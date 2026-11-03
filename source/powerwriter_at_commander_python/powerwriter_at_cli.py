#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PowerWriter AT Commander - command-line version.

Calls the C bridge library through ctypes. Build the library first:

    build_windows.bat        # or build_linux.sh / build_macos.sh

There is no third-party runtime dependency; the serial backend uses the
Python standard library.

Examples:
    python powerwriter_at_cli.py list
    python powerwriter_at_cli.py doctor
    python powerwriter_at_cli.py --port COM3 info
    python powerwriter_at_cli.py --port COM3 connect
    python powerwriter_at_cli.py --port COM3 read 0x08000000 256
    python powerwriter_at_cli.py --port COM3 write 0x08000000 app.bin -y
"""

from __future__ import annotations

import argparse
import json
import platform
import sys
import time
from contextlib import contextmanager
from pathlib import Path

from pw_at import (
    ATError,
    ATLibraryLoadError,
    ATLibraryNotFound,
    BroadcastDir,
    ClockType,
    EraseType,
    OBUpdateType,
    OfflineState,
    OutputVext,
    PowerWriterAT,
    PowerWriterATError,
    ResetType,
    WriterConfig,
    __version__,
    arch_tags,
    describe_error,
    library_names,
    load_library,
    platform_tag,
)
from pw_at.demo import (
    DEFAULT_PROJECT,
    DEFAULT_PROJECT_NAME,
    GUIDE_TEXT,
    INTRODUCTION,
    run_sample_workflow,
    wait_target_connected,
)
from pw_at.transport import list_serial_ports
from pw_at.utils import hexdump

LOG_PREFIX = {
    "debug": "[Debug]",
    "info": "[Info]",
    "warn": "[Warning]",
    "error": "[Error]",
}

ERASE_MAP = {"none": EraseType.NONE, "chip": EraseType.CHIP, "sector": EraseType.SECTOR}
VEXT_MAP = {"1.8": OutputVext.V1_8, "3.3": OutputVext.V3_3,
            "5.0": OutputVext.V5_0, "external": OutputVext.EXTERNAL}
CLOCK_MAP = {"20": ClockType.MHZ20, "10": ClockType.MHZ10,
             "5": ClockType.MHZ5, "2": ClockType.MHZ2, "1": ClockType.MHZ1}
BOOL_MAP = {"on": 1, "off": 0, "1": 1, "0": 0}


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
def parse_int(text: str) -> int:
    return int(text, 0)


def make_logger(args):
    def log(level: str, message: str) -> None:
        if level == "debug" and not getattr(args, "debug", False):
            return
        if level == "info" and getattr(args, "quiet", False):
            return
        prefix = LOG_PREFIX.get(level, "")
        print("%s %s" % (prefix, message), file=sys.stderr)
    return log


def choose_port(port: str | None) -> str:
    if port:
        return port
    ports = list_serial_ports()
    if not ports:
        raise SystemExit("No serial port available; connect a device and specify one with --port")

    powerwriter_ports = [item for item in ports if item.is_powerwriter]
    if len(powerwriter_ports) == 1:
        return powerwriter_ports[0].device
    if not powerwriter_ports and len(ports) == 1:
        return ports[0].device

    if len(powerwriter_ports) > 1:
        print("Multiple PowerWriter devices found; specify one with --port:", file=sys.stderr)
    else:
        print("No PowerWriter detected automatically; specify one with --port:", file=sys.stderr)
    for item in ports:
        print("  %s" % item, file=sys.stderr)
    raise SystemExit(2)


@contextmanager
def open_device(args, log=None):
    port = choose_port(getattr(args, "port", None))
    try:
        device = PowerWriterAT(
            encrypt=getattr(args, "encrypt", False),
            log=log if log is not None else make_logger(args),
            encrypt_key=getattr(args, "encrypt_key", None),
            encrypt_iv=getattr(args, "encrypt_iv", None),
        )
    except ValueError as exc:
        raise SystemExit(str(exc))
    try:
        device.open_serial(port, getattr(args, "baud", 9600))
    except PowerWriterATError as exc:
        raise SystemExit("Failed to connect to %s: %s" % (port, exc))
    try:
        yield device
    finally:
        device.close()


def confirm(args, message: str) -> None:
    if getattr(args, "yes", False):
        return
    if not sys.stdin.isatty():
        raise SystemExit("This operation modifies device or target chip data; add --yes to confirm")
    answer = input("%s [y/N]: " % message).strip().lower()
    if answer not in ("y", "yes"):
        raise SystemExit("Cancelled")


def make_progress(label: str):
    state = {"last": -1}

    def callback(processed: int, total: int) -> None:
        if total <= 0:
            return
        percent = int(processed * 100 / total)
        if percent != state["last"] and (percent % 5 == 0 or percent == 100):
            state["last"] = percent
            print("\r%s: %3d%% (%d/%d)" % (label, percent, processed, total),
                  end="", file=sys.stderr, flush=True)

    def finish() -> None:
        if state["last"] >= 0:
            print(file=sys.stderr)

    callback.finish = finish
    return callback


# ---------------------------------------------------------------------------
# Command implementations
# ---------------------------------------------------------------------------
def cmd_list(args) -> int:
    powerwriter_only = bool(getattr(args, "powerwriter", False))
    ports = list_serial_ports(powerwriter_only=powerwriter_only)
    if not ports:
        if powerwriter_only:
            print("No PowerWriter device found (identified by VID/PID or description)")
        else:
            print("No serial port found")
        return 0

    for item in ports:
        print("%-12s %s" % (item.device, item.description or "-"))
        details = []
        if item.vid_pid:
            details.append("VID:PID=%s" % item.vid_pid)
        if item.is_powerwriter:
            details.append("PowerWriter")
        if item.hwid:
            details.append(item.hwid)
        if details:
            print("  %s" % "  ".join(details))

    powerwriter_ports = [item for item in ports if item.is_powerwriter]
    if powerwriter_ports:
        print("\nDetected PowerWriter: %s"
              % ", ".join(item.device for item in powerwriter_ports))
    return 0


def cmd_doctor(args) -> int:
    print("PowerWriter AT Python binding diagnostics")
    print("  Python      : %s" % sys.version.split()[0])
    print("  System      : %s %s" % (platform.system(), platform.release()))
    print("  Platform    : %s / %s" % (platform_tag(), " ".join(arch_tags())))
    print("  Port backend: standard library (%s)"
          % ("Win32 API" if sys.platform.startswith("win") else "termios"))
    ports = list_serial_ports()
    powerwriter_ports = [item for item in ports if item.is_powerwriter]
    print("  Serial ports: %d" % len(ports))
    for item in ports:
        print("    %s" % item)
    print("  PowerWriter : %s" % (
        ", ".join("%s (%s)" % (item.device, item.vid_pid)
                  for item in powerwriter_ports)
        if powerwriter_ports else "not detected"))
    try:
        lib, path = load_library()
    except (ATLibraryNotFound, Exception) as exc:
        print("  Library     : unavailable")
        print(str(exc))
        return 1
    print("  Library     : %s" % path)
    print("  ABI version : 0x%08X" % lib.pwat_version())
    print("  Candidates  : %s" % ", ".join(library_names()))
    print("  Run mode    : %s" % ("packaged EXE" if getattr(sys, "frozen", False) else "Python source"))
    print("  Demo project: %s%s" % (
        DEFAULT_PROJECT,
        "" if DEFAULT_PROJECT.is_file() else " (missing)"))
    return 0


def cmd_about(args) -> int:
    print(INTRODUCTION)
    return 0


def cmd_guide(args) -> int:
    print(GUIDE_TEXT)
    return 0


def cmd_info(args) -> int:
    with open_device(args) as pw:
        info = pw.get_writer_info()
        print("Model       : %s" % (info.oem or "-"))
        print("SN          : %s" % (info.sn or "-"))
        print("Hardware    : %s" % (info.hardware_version or "-"))
        print("Bootloader  : %s" % (info.bootloader_version or "-"))
        print("Interface FW: %s" % (info.interface_version or "-"))
        if args.config:
            print()
            print(pw.get_writer_config().describe())
    return 0


def cmd_config_get(args) -> int:
    with open_device(args) as pw:
        print(pw.get_writer_config().describe())
    return 0


def cmd_set_baud(args) -> int:
    with open_device(args) as pw:
        pw.set_baudrate(args.baudrate)
    print("AT baud rate set to %d (the device replies at the old baud rate first; the host serial port has switched over)"
          % args.baudrate)
    return 0


def cmd_config_set(args) -> int:
    with open_device(args) as pw:
        cfg = pw.get_writer_config()
        if args.erase_type is not None:
            cfg.erase_type = int(ERASE_MAP[args.erase_type])
        if args.vext is not None:
            cfg.output_vext_type = int(VEXT_MAP[args.vext])
        if args.clock is not None:
            cfg.clock_type = int(CLOCK_MAP[args.clock])
        if args.buzzer is not None:
            cfg.buzzer_enable = BOOL_MAP[args.buzzer]
        if args.ob_update is not None:
            cfg.ob_update_type = args.ob_update
        if args.auto is not None:
            cfg.target_auto_enable = BOOL_MAP[args.auto]
        if args.in_debounce is not None:
            cfg.target_auto_in_debounce = args.in_debounce
        if args.out_debounce is not None:
            cfg.target_auto_out_debounce = args.out_debounce
        if args.disable_power_ap is not None:
            cfg.disable_power_ap = BOOL_MAP[args.disable_power_ap]
        if args.run_ap is not None:
            cfg.run_ap = BOOL_MAP[args.run_ap]
        if args.power_on_debounce is not None:
            cfg.power_on_debounce = args.power_on_debounce
        if args.power_off_debounce is not None:
            cfg.power_off_debounce = args.power_off_debounce
        if args.reset_pin is not None:
            cfg.reset_type = args.reset_pin
        pw.set_writer_config(cfg)
        print("Configuration updated:")
        print(cfg.describe())
    return 0


def cmd_connect(args) -> int:
    with open_device(args) as pw:
        pw.target_connect()
    print("Target chip connect command sent")
    print("To check the connection status, run: status")
    return 0


def cmd_status(args) -> int:
    with open_device(args) as pw:
        if wait_target_connected(pw, 5):
            print("Target chip connected")
            return 0
        print("Target chip not connected (error: %s)" % pw.last_error_text)
        return 1


def cmd_id(args) -> int:
    with open_device(args) as pw:
        cid = pw.target_get_id()
        print("Target chip ID: %s" % cid.hex)
        print("Value       : 0x%X" % cid.value)
    return 0


def cmd_read(args) -> int:
    if args.size <= 0:
        raise SystemExit("Read length must be greater than 0")
    with open_device(args) as pw:
        progress = make_progress("Read") if args.size > 256 and sys.stderr.isatty() else None
        data = pw.target_read(args.address, args.size, progress)
        if progress:
            progress.finish()
        if args.output:
            Path(args.output).write_bytes(data)
            print("Saved %d bytes to %s" % (len(data), args.output))
        else:
            print(hexdump(data, args.address))
    return 0


def cmd_write(args) -> int:
    path = Path(args.file)
    if not path.is_file():
        raise SystemExit("File not found: %s" % path)
    data = path.read_bytes()
    if not data:
        raise SystemExit("File is empty: %s" % path)
    confirm(args, "This will write %d bytes to address %s and modify target chip data. Continue?"
            % (len(data), args.address))
    with open_device(args) as pw:
        progress = make_progress("Write")
        pw.target_write(args.address, data, prepare=not args.no_prepare, progress=progress)
        progress.finish()
        print("Write complete: %d bytes @ 0x%08X" % (len(data), args.address))
        if args.verify:
            print("Verifying...", file=sys.stderr)
            readback = pw.target_read(args.address, len(data))
            if readback == data:
                print("Verification passed")
            else:
                for i, (a, b) in enumerate(zip(readback, data)):
                    if a != b:
                        print("Verification failed: offset 0x%X expected 0x%02X got 0x%02X"
                              % (i, b, a), file=sys.stderr)
                        break
                return 2
    return 0


def cmd_write_prepare(args) -> int:
    with open_device(args) as pw:
        pw.target_write_prepare(args.total)
    print("Write prepare command sent: total length %d bytes" % args.total)
    return 0


def cmd_erase(args) -> int:
    confirm(args, "This will perform a full-chip erase of the target chip. Continue?")
    with open_device(args) as pw:
        pw.target_erase(args.timeout)
    print("Full-chip erase complete")
    return 0


def cmd_erase_sector(args) -> int:
    confirm(args, "This will erase the sector(s) covering 0x%X bytes starting at target address 0x%08X. Continue?"
            % (args.size, args.address))
    with open_device(args) as pw:
        pw.target_erase_sector(args.address, args.size, args.timeout)
    print("Sector erase complete")
    return 0


def cmd_ob_read(args) -> int:
    with open_device(args) as pw:
        ob = pw.target_read_ob()
        if args.output:
            Path(args.output).write_bytes(ob.data)
            print("Saved %d bytes to %s" % (len(ob.data), args.output))
        else:
            print("OptionByte (%d bytes):" % len(ob.data))
            print(hexdump(ob.data))
    return 0


def cmd_ob_write_vendor(args) -> int:
    confirm(args, "This will write the vendor default OptionByte. Continue?")
    with open_device(args) as pw:
        pw.target_write_vendor_ob(args.timeout)
    print("Vendor default OptionByte written")
    return 0


def cmd_ob_write_user(args) -> int:
    confirm(args, "This will write the user OptionByte. Continue?")
    with open_device(args) as pw:
        pw.target_write_user_ob(args.timeout)
    print("User OptionByte written")
    return 0


def cmd_reset(args) -> int:
    from pw_at.constants import RESET_TYPE_NAMES
    value = args.type
    if value in RESET_TYPE_NAMES:
        reset_type = RESET_TYPE_NAMES[value]
    else:
        try:
            reset_type = ResetType(int(value, 0))
        except ValueError:
            raise SystemExit("Invalid reset type: %s" % value)
    with open_device(args) as pw:
        pw.target_reset(reset_type)
    print("Reset command sent (type=%d)" % int(reset_type))
    return 0


def cmd_project_info(args) -> int:
    with open_device(args) as pw:
        info = pw.project_info()
        print("Project status: %s" % ("valid" if info.active else "invalid"))
        print("Project size: %d bytes" % info.size)
        print("CRC32   : 0x%08X" % info.crc32)
    return 0


def cmd_project_load(args) -> int:
    path = Path(args.file)
    if not path.is_file():
        raise SystemExit("File not found: %s" % path)
    data = path.read_bytes()
    name = args.name or path.name
    confirm(args, "This will load project %s (%d bytes) into the writer. Continue?" % (name, len(data)))
    with open_device(args) as pw:
        progress = make_progress("Loading project")
        pw.project_load(name, data, password=args.password,
                        progress=progress, name_encoding=args.name_encoding)
        progress.finish()
    print("Project loaded: %s" % name)
    return 0


def cmd_project_disable(args) -> int:
    confirm(args, "This will disable the offline project in the writer. Continue?")
    with open_device(args) as pw:
        pw.project_disable()
    print("Offline project disabled")
    return 0


def cmd_offline_start(args) -> int:
    confirm(args, "This will start offline programming (erasing/writing the target chip). Continue?")
    with open_device(args) as pw:
        pw.offline_start()
    print("Offline programming started")
    print("To check progress, run: offline-status")
    return 0


def cmd_offline_status(args) -> int:
    with open_device(args) as pw:
        status = pw.offline_status()
    if status.state == OfflineState.OK:
        print("Offline programming complete")
        return 0
    if status.failed:
        print("Offline status query returned error code %d (%s) (the device may not be programming)"
              % (status.error_code, describe_error(status.error_code)))
        return 1
    if status.state == OfflineState.PROGRESS and status.progress:
        if status.progress.processed > status.progress.total:
            print("Offline programming: preparing...")
        else:
            print("Offline programming: %d/%d" % (status.progress.processed,
                                                  status.progress.total))
        return 0
    print("Offline programming status unknown")
    return 0


def cmd_project_switch(args) -> int:
    with open_device(args) as pw:
        pw.project_switch(args.name, password=args.password, reload=args.reload,
                          name_encoding=args.name_encoding)
    print("Switched project: %s" % args.name)
    return 0


def cmd_broadcast(args) -> int:
    if args.hex:
        try:
            data = bytes.fromhex(args.data.replace(",", " ").replace("0x", ""))
        except ValueError as exc:
            raise SystemExit("Invalid hexadecimal data format: %s" % exc)
    else:
        data = args.data.encode("utf-8")
    direction = BroadcastDir.CDC2UART if args.dir == "cdc2uart" else BroadcastDir.UART2CDC
    with open_device(args) as pw:
        response = pw.broadcast(data, direction=direction,
                                keep_frame=args.keep_frame, wait_rsp=args.wait_rsp,
                                timeout_ms=getattr(args, "timeout", 5000))
        print("Broadcast sent: %d bytes" % len(data))
        if response is not None:
            print("Response received: %d bytes" % len(response.data))
            print(hexdump(response.data))
    return 0


def cmd_factory(args) -> int:
    with open_device(args) as pw:
        if args.which == "sram":
            pw.factory_run_sram_fw(args.timeout)
        else:
            pw.factory_run_flash_fw(args.timeout)
    print("Factory %s firmware command executed" % args.which.upper())
    return 0


def cmd_benchmark(args) -> int:
    """
    Sample workflow corresponding to powerwriter_at_samples.c.

    By default only safe steps run (information, connect, chip ID, memory
    reads). With --destructive the full erase/write/OptionByte/offline
    workflow runs.
    """
    if args.destructive:
        confirm(args, "This will run the full workflow: erase and write target Flash, "
                      "write OptionByte, and load the offline project. Target chip data will be lost. Continue?")

    progress_last = {}

    def log(level: str, message: str) -> None:
        if level == "warn":
            print("[Warning] %s" % message, file=sys.stderr)
        elif level == "error":
            print("[Error] %s" % message, file=sys.stderr)
        else:
            print(message)

    def progress(label: str, processed: int, total: int) -> None:
        if total <= 0:
            return
        percent = int(processed * 100 / total)
        if progress_last.get(label) == percent:
            return
        progress_last[label] = percent
        print("\r%s: %3d%% (%d/%d)" % (label, percent, processed, total),
              end="", file=sys.stderr, flush=True)
        if percent >= 100:
            print(file=sys.stderr)

    # The workflow prints its own steps; silence the client's info logs.
    with open_device(args, log=lambda level, message: None) as pw:
        run_sample_workflow(
            pw,
            destructive=args.destructive,
            project_path=args.project,
            project_name=args.project_name or DEFAULT_PROJECT_NAME,
            log=log,
            progress=progress,
        )
    return 0


# ---------------------------------------------------------------------------
# C++ CLI compatible flat-flag interface
# ---------------------------------------------------------------------------
CPP_COMMANDS = {
    "-info": "info",
    "-cfg": "cfg",
    "-setcfg": "setcfg",
    "-setbaud": "setbaud",
    "-connect": "connect",
    "-status": "status",
    "-cid": "cid",
    "-read": "read",
    "-erase": "erase",
    "-write": "write",
    "-read-ob": "read_ob",
    "-write-vob": "write_vob",
    "-write-uob": "write_uob",
    "-reset": "reset",
    "-prj-info": "prj_info",
    "-prj-ld": "prj_ld",
    "-prj-sw": "prj_sw",
    "-prj-dis": "prj_dis",
    "-start": "start",
    "-offline-status": "offline_status",
    "-factory-sram-fw": "factory_sram",
    "-factory-flash-fw": "factory_flash",
    "-bcst": "bcst",
    "-sleep": "sleep",
    "-scan": "scan",
}

CPP_VALUE_PARAMS = (
    "-f", "-pwd", "-b", "-type", "-addr", "-s", "-t",
    "-data", "-dir", "-kf", "-wtrsp", "-fw-num", "-mode",
)

CPP_HELP = """
PowerWriter AT Commander (C++ CLI compatible flags)
===================================================
Usage:
  powerwriter_at_cli.py [--port COMx] [--baud 9600] [-command [args]]
  Add --encrypt --encrypt-key HEX --encrypt-iv HEX for encrypted devices.

Commands:
  -info                Read writer information
  -cfg                 Read writer configuration
  -setcfg -f FILE      Write configuration from a JSON file
  -setbaud -b BAUD     Set the AT baud rate
  -connect             Connect to the target chip
  -status              Query target status (poll for up to 5 seconds)
  -cid                 Read the target chip ID
  -read -addr ADDR -s SIZE
                       Read target memory
  -erase -t MS         Full-chip erase
  -erase -t MS -addr ADDR -s SIZE
                       Sector erase
  -write -addr ADDR -f FILE
                       Write target memory (only .bin is supported currently)
  -read-ob             Read the target OptionByte
  -write-vob -t MS     Write the vendor default OptionByte
  -write-uob -t MS     Write the user OptionByte
  -reset -type TYPE    Reset the target
  -prj-info            Query offline project
  -prj-ld -f FILE [-pwd PWD]
                       Load offline project
  -prj-sw -mode 0|1 -f FILE [-pwd PWD]
                       Switch offline project (1=reload)
  -prj-dis             Disable offline project
  -start               Start offline programming
  -offline-status      Query offline programming status once
  -factory-sram-fw -t MS
  -factory-flash-fw -t MS
  -bcst -data TEXT | -f FILE -dir usbtouart|uarttousb [-kf true|false] [-wtrsp true|false] [-t MS]
  -sleep -t MS         Host wait
  -scan                Scan for PowerWriter devices

Arguments:
  -f FILE   file                  -pwd PWD  project password
  -b BAUD   baud rate             -type N   reset type
  -addr N   address               -s N      length
  -t MS     timeout               -data S   broadcast text
  -dir S    broadcast direction   -kf B     forward full AT frame
  -wtrsp B  wait for response     -mode N   0=continue, 1=reload
  -fw-num N (Python supports .bin only; ignored)

Examples:
  powerwriter_at_cli.py -info
  powerwriter_at_cli.py -read -addr 0x08000000 -s 0x100
  powerwriter_at_cli.py -write -addr 0x08000000 -f app.bin
  powerwriter_at_cli.py -prj-ld -f stm32f071.pkg
  powerwriter_at_cli.py -start
  powerwriter_at_cli.py -offline-status

Note: the original subcommands (info, read, write, etc.) are still available.
""".strip()


def _cpp_globals(tokens: list[str]) -> tuple[dict, list[str]]:
    """Extract Python global options; leave C++ flags untouched."""
    values = {"baud": 9600}
    rest: list[str] = []
    i = 0
    while i < len(tokens):
        token = tokens[i]
        if token in ("--port", "--baud", "--encrypt-key", "--encrypt-iv"):
            if i + 1 >= len(tokens):
                raise SystemExit("%s is missing a value" % token)
            values[token[2:].replace("-", "_")] = tokens[i + 1]
            i += 2
            continue
        if token.startswith("--port="):
            values["port"] = token.split("=", 1)[1]
            i += 1
            continue
        if token.startswith("--baud="):
            values["baud"] = token.split("=", 1)[1]
            i += 1
            continue
        if token.startswith("--encrypt-key="):
            values["encrypt_key"] = token.split("=", 1)[1]
            i += 1
            continue
        if token.startswith("--encrypt-iv="):
            values["encrypt_iv"] = token.split("=", 1)[1]
            i += 1
            continue
        if token in ("--encrypt", "--debug", "--quiet"):
            values[token[2:]] = True
            i += 1
            continue
        if token == "-enable_debug":
            values["debug"] = True
            i += 1
            continue
        rest.append(token)
        i += 1
    return values, rest


def _cpp_parse_params(tokens: list[str]) -> dict:
    params: dict = {}
    i = 0
    while i < len(tokens):
        token = tokens[i]
        if token in ("-y", "--yes"):
            params["yes"] = True
            i += 1
            continue
        if not token.startswith("-"):
            params.setdefault("_pos", []).append(token)
            i += 1
            continue

        key, value = token, None
        if "=" in token:
            key, value = token.split("=", 1)
        elif token in CPP_VALUE_PARAMS:
            if i + 1 < len(tokens):
                nxt = tokens[i + 1]
                if nxt.startswith("-") and not (
                        len(nxt) > 1 and nxt[1].isdigit()):
                    value = ""
                else:
                    value = nxt
                    i += 1
            else:
                value = ""
        else:
            for candidate in sorted(CPP_VALUE_PARAMS, key=len, reverse=True):
                if token.startswith(candidate) and len(token) > len(candidate):
                    key = candidate
                    value = token[len(candidate):]
                    break
        if value is not None:
            value = value.strip().strip('"')
        params[key] = value
        i += 1
    return params


def _cpp_int(params: dict, key: str, default: int = 0) -> int:
    value = params.get(key)
    if value is None or value == "":
        return int(default)
    try:
        return int(str(value), 0)
    except ValueError:
        raise SystemExit("Parameter %s is not a valid number: %s" % (key, value))


def _cpp_bool(value) -> bool:
    if isinstance(value, bool):
        return value
    return str(value).strip().lower() in ("1", "true", "yes", "on")


def _cpp_args(globals_: dict, **kwargs) -> argparse.Namespace:
    return argparse.Namespace(
        port=globals_.get("port"),
        baud=int(globals_.get("baud", 9600)),
        encrypt=bool(globals_.get("encrypt", False)),
        encrypt_key=globals_.get("encrypt_key"),
        encrypt_iv=globals_.get("encrypt_iv"),
        debug=bool(globals_.get("debug", False)),
        quiet=bool(globals_.get("quiet", False)),
        **kwargs,
    )


def _cpp_setcfg(globals_: dict, path: str) -> int:
    if not path:
        raise SystemExit("-setcfg requires -f config file")
    source = Path(path)
    if not source.is_file():
        raise SystemExit("Config file not found: %s" % source)
    try:
        data = json.loads(source.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        raise SystemExit("Failed to read config JSON: %s" % exc)
    names = data.get("names", {})
    base = data.get("base config", {})
    offline = data.get("offline config", {})
    output = data.get("output config", {})
    cfg = WriterConfig(
        target_vendor=str(names.get("vendor", "")),
        target_series=str(names.get("series", "")),
        target_model=str(names.get("model", "")),
        erase_type=int(base.get("erase", 0)),
        output_vext_type=int(base.get("vext", 0)),
        clock_type=int(base.get("clock", 0)),
        buzzer_enable=1 if _cpp_bool(base.get("buzzer", False)) else 0,
        ob_update_type=int(base.get("option byte type", 0)),
        limit_number_enable=1 if _cpp_bool(offline.get("limit enable", False)) else 0,
        limit_number=int(offline.get("limit number", 0)),
        target_auto_enable=1 if _cpp_bool(offline.get("auto", False)) else 0,
        target_auto_in_debounce=int(offline.get("in debounce(ms)", 0)),
        target_auto_out_debounce=int(offline.get("out debounce(ms)", 0)),
        disable_power_ap=1 if _cpp_bool(output.get("disable power after programming", False)) else 0,
        run_ap=1 if _cpp_bool(output.get("run target after programming", False)) else 0,
        power_on_debounce=int(output.get("power on debounce(ms)", 0)),
        power_off_debounce=int(output.get("power off debounce(ms)", 0)),
        reset_type=int(output.get("reset pin ctrl", 0)),
    )
    with open_device(_cpp_args(globals_)) as pw:
        pw.set_writer_config(cfg)
    print("Configuration updated:")
    print(cfg.describe())
    return 0


def _cpp_broadcast_data(params: dict) -> tuple[str, bool]:
    path = params.get("-f")
    if path:
        source = Path(path)
        if not source.is_file():
            raise SystemExit("Broadcast file not found: %s" % source)
        raw = source.read_bytes()
        if source.suffix.lower() == ".bin":
            return raw.hex(), True
        return raw.decode("utf-8", "replace"), False
    return str(params.get("-data", "")), False


def _run_cpp_command(globals_: dict, flag: str, params: dict) -> int:
    action = CPP_COMMANDS[flag]
    if action == "info":
        return cmd_info(_cpp_args(globals_, config=False))
    if action == "cfg":
        return cmd_config_get(_cpp_args(globals_))
    if action == "setcfg":
        return _cpp_setcfg(globals_, str(params.get("-f", "")))
    if action == "setbaud":
        return cmd_set_baud(_cpp_args(
            globals_, baudrate=_cpp_int(params, "-b", 9600)))
    if action == "connect":
        return cmd_connect(_cpp_args(globals_))
    if action == "status":
        return cmd_status(_cpp_args(globals_))
    if action == "cid":
        return cmd_id(_cpp_args(globals_))
    if action == "read":
        return cmd_read(_cpp_args(
            globals_,
            address=_cpp_int(params, "-addr", 0),
            size=_cpp_int(params, "-s", 0),
            output=None,
        ))
    if action == "erase":
        timeout = _cpp_int(params, "-t", 10000)
        if "-addr" in params or "-s" in params:
            return cmd_erase_sector(_cpp_args(
                globals_,
                address=_cpp_int(params, "-addr", 0),
                size=_cpp_int(params, "-s", 0),
                timeout=timeout,
                yes=True,
            ))
        return cmd_erase(_cpp_args(globals_, timeout=timeout, yes=True))
    if action == "write":
        path = str(params.get("-f", ""))
        if not path:
            raise SystemExit("-write requires -f file")
        return cmd_write(_cpp_args(
            globals_,
            address=_cpp_int(params, "-addr", 0),
            file=path,
            verify=False,
            no_prepare=False,
            yes=True,
        ))
    if action == "read_ob":
        return cmd_ob_read(_cpp_args(globals_, output=None))
    if action == "write_vob":
        return cmd_ob_write_vendor(_cpp_args(
            globals_, timeout=_cpp_int(params, "-t", 5000), yes=True))
    if action == "write_uob":
        return cmd_ob_write_user(_cpp_args(
            globals_, timeout=_cpp_int(params, "-t", 5000), yes=True))
    if action == "reset":
        return cmd_reset(_cpp_args(
            globals_, type=str(params.get("-type", "3"))))
    if action == "prj_info":
        return cmd_project_info(_cpp_args(globals_))
    if action == "prj_ld":
        path = str(params.get("-f", ""))
        if not path:
            raise SystemExit("-prj-ld requires -f project file")
        return cmd_project_load(_cpp_args(
            globals_,
            file=path,
            name=None,
            password=str(params.get("-pwd", "")),
            name_encoding="auto",
            yes=True,
        ))
    if action == "prj_sw":
        path = str(params.get("-f", ""))
        if not path:
            raise SystemExit("-prj-sw requires -f project file")
        return cmd_project_switch(_cpp_args(
            globals_,
            name=Path(path).name,
            password=str(params.get("-pwd", "")),
            reload=_cpp_int(params, "-mode", 0) == 1,
            name_encoding="auto",
        ))
    if action == "prj_dis":
        return cmd_project_disable(_cpp_args(globals_, yes=True))
    if action == "start":
        return cmd_offline_start(_cpp_args(globals_, yes=True))
    if action == "offline_status":
        return cmd_offline_status(_cpp_args(globals_))
    if action in ("factory_sram", "factory_flash"):
        return cmd_factory(_cpp_args(
            globals_,
            which="sram" if action == "factory_sram" else "flash",
            timeout=_cpp_int(params, "-t", 5000),
        ))
    if action == "bcst":
        data, is_hex = _cpp_broadcast_data(params)
        direction = str(params.get("-dir", "usbtouart"))
        direction = {
            "usbtouart": "cdc2uart",
            "uarttousb": "uart2cdc",
        }.get(direction, direction)
        return cmd_broadcast(_cpp_args(
            globals_,
            data=data,
            hex=is_hex,
            dir=direction,
            keep_frame=_cpp_bool(params.get("-kf", False)),
            wait_rsp=_cpp_bool(params.get("-wtrsp", False)),
            timeout=_cpp_int(params, "-t", 5000),
        ))
    if action == "sleep":
        time.sleep(_cpp_int(params, "-t", 1000) / 1000.0)
        return 0
    if action == "scan":
        return cmd_list(_cpp_args(globals_, powerwriter=True))
    raise SystemExit("Unsupported command: %s" % flag)


def _first_is_cpp(argv: list[str]) -> bool:
    i = 0
    while i < len(argv):
        token = argv[i]
        if token in ("--port", "--baud", "--encrypt-key", "--encrypt-iv"):
            i += 2
            continue
        if (token.startswith("--port=") or token.startswith("--baud=")
                or token.startswith("--encrypt-key=")
                or token.startswith("--encrypt-iv=")):
            i += 1
            continue
        if token in ("--encrypt", "--debug", "--quiet", "-enable_debug"):
            i += 1
            continue
        if token in ("-V", "--version", "--help"):
            return False
        return token in CPP_COMMANDS or token in ("-h", "-help", "help") \
            or token.startswith("-")
    return False


def run_cpp_style(argv: list[str]) -> int:
    globals_, rest = _cpp_globals(list(argv))
    if not rest or rest[0] in ("-h", "-help", "help"):
        print(CPP_HELP)
        return 0
    flag = rest[0]
    if flag not in CPP_COMMANDS:
        print("Unknown command: %s" % flag, file=sys.stderr)
        print(CPP_HELP, file=sys.stderr)
        return 2
    params = _cpp_parse_params(rest[1:])
    return _run_cpp_command(globals_, flag, params)


# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
def add_common(parser: argparse.ArgumentParser, suppress: bool = False) -> None:
    """
    Add connection-related arguments.

    suppress=True is used by subcommands so that omitted options do not
    overwrite values already parsed by the top-level parser. This supports
    both of the following forms:

        python powerwriter_at_cli.py --port COM3 info
        python powerwriter_at_cli.py info --port COM3
    """
    default = (lambda value: argparse.SUPPRESS) if suppress else (lambda value: value)
    parser.add_argument("--port", default=default(None),
                        help="Serial port, e.g. COM3 or /dev/ttyACM0")
    parser.add_argument("--baud", type=int, default=default(9600),
                        help="Baud rate (default 9600)")
    parser.add_argument("--encrypt", action="store_true", default=default(False),
                        help="Enable AES128-CBC encrypted communication")
    parser.add_argument("--encrypt-key", metavar="HEX", default=default(None),
                        help="AES key: 32 hex digits (requires --encrypt)")
    parser.add_argument("--encrypt-iv", metavar="HEX", default=default(None),
                        help="AES IV: 32 hex digits (requires --encrypt)")
    parser.add_argument("--debug", action="store_true", default=default(False),
                        help="Output communication debug logs")
    parser.add_argument("--quiet", action="store_true", default=default(False),
                        help="Only output warnings and errors")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="powerwriter_at_cli.py",
        description="PowerWriter AT Commander command-line edition (Python + C core dynamic library)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="C++ CLI style is also supported: -info, -read -addr ... -s ..., -prj-ld -f ...; "
               "run `-help` for details. In subcommand mode, destructive operations require --yes.",
    )
    parser.add_argument("-V", "--version", action="version",
                        version="PowerWriter AT Commander %s" % __version__)
    # Global connection options: allowed before the subcommand.
    add_common(parser)
    sub = parser.add_subparsers(dest="command", required=True, metavar="<command>")

    p = sub.add_parser("list", help="List serial ports")
    p.add_argument("--powerwriter", "--pw", action="store_true",
                   help="Only list detected PowerWriter devices")
    p.set_defaults(func=cmd_list)

    p = sub.add_parser("doctor", help="Check the dynamic library and serial port environment")
    p.set_defaults(func=cmd_doctor)

    p = sub.add_parser("about", help="Show the PowerWriter AT interface introduction")
    p.set_defaults(func=cmd_about)

    p = sub.add_parser("guide", help="Show API call order and dependencies")
    p.set_defaults(func=cmd_guide)

    p = sub.add_parser("info", help="Read writer information", parents=[])
    add_common(p, suppress=True)
    p.add_argument("--config", action="store_true", help="Also read the configuration")
    p.set_defaults(func=cmd_info)

    p = sub.add_parser("config-get", help="Read writer configuration")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_config_get)

    p = sub.add_parser("config-set", help="Modify writer configuration")
    add_common(p, suppress=True)
    p.add_argument("--erase-type", choices=sorted(ERASE_MAP), help="Erase mode")
    p.add_argument("--vext", choices=sorted(VEXT_MAP), help="Output VEXT")
    p.add_argument("--clock", choices=sorted(CLOCK_MAP), help="Target clock")
    p.add_argument("--buzzer", choices=sorted(BOOL_MAP), help="Buzzer")
    p.add_argument("--ob-update", type=int, choices=[0, 1, 2, 3], help="OptionByte update mode")
    p.add_argument("--auto", choices=sorted(BOOL_MAP), help="Target auto-detect")
    p.add_argument("--in-debounce", type=int, help="Insert debounce (ms)")
    p.add_argument("--out-debounce", type=int, help="Remove debounce (ms)")
    p.add_argument("--disable-power-ap", choices=sorted(BOOL_MAP), help="Power off after programming")
    p.add_argument("--run-ap", choices=sorted(BOOL_MAP), help="Run after programming")
    p.add_argument("--power-on-debounce", type=int, help="Power-on debounce (ms)")
    p.add_argument("--power-off-debounce", type=int, help="Power-off debounce (ms)")
    p.add_argument("--reset-pin", type=int, choices=list(range(8)),
                   help="Reset pin control mode (0-7, same as online reset)")
    p.set_defaults(func=cmd_config_set)

    p = sub.add_parser("set-baud", help="Set the device AT baud rate")
    add_common(p, suppress=True)
    p.add_argument("baudrate", type=int, help="New AT baud rate, e.g. 115200")
    p.set_defaults(func=cmd_set_baud)

    p = sub.add_parser("connect", help="Connect to the target chip")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_connect)

    p = sub.add_parser("status", help="Query target chip connection status")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_status)

    p = sub.add_parser("id", help="Read target chip ID")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_id)

    p = sub.add_parser("read", help="Read target memory")
    add_common(p, suppress=True)
    p.add_argument("address", type=parse_int, help="Start address, supports 0x prefix")
    p.add_argument("size", type=parse_int, help="Read length")
    p.add_argument("-o", "--output", help="Save to file (default: print hex)")
    p.set_defaults(func=cmd_read)

    p = sub.add_parser("write", help="Write target memory")
    add_common(p, suppress=True)
    p.add_argument("address", type=parse_int, help="Start address")
    p.add_argument("file", help="Binary file to write")
    p.add_argument("--verify", action="store_true", help="Verify after writing")
    p.add_argument("--no-prepare", action="store_true", help="Do not send the write prepare command")
    p.add_argument("-y", "--yes", action="store_true", help="Skip confirmation")
    p.set_defaults(func=cmd_write)

    p = sub.add_parser("write-prepare", help="Send write prepare command")
    add_common(p, suppress=True)
    p.add_argument("total", type=parse_int, help="Total number of bytes planned to write")
    p.set_defaults(func=cmd_write_prepare)

    p = sub.add_parser("erase", help="Full-chip erase the target chip")
    add_common(p, suppress=True)
    p.add_argument("--timeout", type=int, default=10000, help="Timeout (ms)")
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_erase)

    p = sub.add_parser("erase-sector", help="Erase target sector")
    add_common(p, suppress=True)
    p.add_argument("address", type=parse_int)
    p.add_argument("size", type=parse_int)
    p.add_argument("--timeout", type=int, default=10000)
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_erase_sector)

    p = sub.add_parser("ob-read", help="Read target OptionByte")
    add_common(p, suppress=True)
    p.add_argument("-o", "--output", help="Save to file")
    p.set_defaults(func=cmd_ob_read)

    p = sub.add_parser("ob-write-vendor", help="Write vendor default OptionByte")
    add_common(p, suppress=True)
    p.add_argument("--timeout", type=int, default=5000)
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_ob_write_vendor)

    p = sub.add_parser("ob-write-user", help="Write user OptionByte")
    add_common(p, suppress=True)
    p.add_argument("--timeout", type=int, default=5000)
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_ob_write_user)

    p = sub.add_parser("reset", help="Reset the target chip")
    add_common(p, suppress=True)
    p.add_argument("--type", default="hw-core-reset",
                   help="Reset type name or value (default hw-core-reset)")
    p.set_defaults(func=cmd_reset)

    p = sub.add_parser("project-info", help="Query offline project information")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_project_info)

    p = sub.add_parser("project-load", help="Load offline project")
    add_common(p, suppress=True)
    p.add_argument("file", help="Project file (.pkg)")
    p.add_argument("--name", help="Project name in the writer (defaults to the file name)")
    p.add_argument("--password", default="", help="Project password")
    p.add_argument("--name-encoding", choices=["auto", "gbk", "utf-8"], default="auto")
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_project_load)

    p = sub.add_parser("project-disable", help="Disable offline project")
    add_common(p, suppress=True)
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_project_disable)

    p = sub.add_parser("offline-start", help="Start offline programming")
    add_common(p, suppress=True)
    p.add_argument("-y", "--yes", action="store_true")
    p.set_defaults(func=cmd_offline_start)

    p = sub.add_parser("offline-status", help="Query offline programming status once")
    add_common(p, suppress=True)
    p.set_defaults(func=cmd_offline_status)

    p = sub.add_parser("project-switch", help="Switch offline project")
    add_common(p, suppress=True)
    p.add_argument("name", help="Project name")
    p.add_argument("--password", default="")
    p.add_argument("--reload", action="store_true", help="Reload project progress")
    p.add_argument("--name-encoding", choices=["auto", "gbk", "utf-8"], default="auto")
    p.set_defaults(func=cmd_project_switch)

    p = sub.add_parser("broadcast", help="Send broadcast data")
    add_common(p, suppress=True)
    p.add_argument("data", help="Text or hexadecimal data")
    p.add_argument("--hex", action="store_true", help="Parse data as hexadecimal")
    p.add_argument("--dir", choices=["cdc2uart", "uart2cdc"], default="cdc2uart")
    p.add_argument("--keep-frame", action="store_true", help="Forward the complete AT frame")
    p.add_argument("--wait-rsp", action="store_true", help="Wait for the device response")
    p.add_argument("--timeout", type=int, default=5000, help="Response wait timeout (ms)")
    p.set_defaults(func=cmd_broadcast)

    p = sub.add_parser("factory-sram", help="Run factory SRAM firmware")
    add_common(p, suppress=True)
    p.add_argument("--timeout", type=int, default=5000)
    p.set_defaults(func=cmd_factory, which="sram")

    p = sub.add_parser("factory-flash", help="Run factory Flash firmware")
    add_common(p, suppress=True)
    p.add_argument("--timeout", type=int, default=5000)
    p.set_defaults(func=cmd_factory, which="flash")

    p = sub.add_parser("benchmark", help="Sample workflow (corresponds to the C benchmark)")
    add_common(p, suppress=True)
    p.add_argument("--destructive", action="store_true",
                   help="Run the full workflow: erase/write/OptionByte/offline project")
    p.add_argument("-y", "--yes", action="store_true", help="Skip confirmation")
    p.add_argument("--project", default=str(DEFAULT_PROJECT), help="Offline project file")
    p.add_argument("--project-name", help="Project name to load into the writer")
    p.set_defaults(func=cmd_benchmark)

    return parser


def main(argv=None) -> int:
    # Use UTF-8 explicitly: a frozen Windows EXE may otherwise fall back to
    # the legacy ANSI code page and garble Chinese output.
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except Exception:
            pass

    raw = list(sys.argv[1:] if argv is None else argv)
    if _first_is_cpp(raw):
        try:
            return run_cpp_style(raw)
        except PowerWriterATError as exc:
            print("[Error] %s" % exc, file=sys.stderr)
            return 1
        except (ATLibraryNotFound, ATLibraryLoadError) as exc:
            print("[Error] %s" % exc, file=sys.stderr)
            return 1
        except KeyboardInterrupt:
            print("\nInterrupted", file=sys.stderr)
            return 130

    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        return args.func(args)
    except PowerWriterATError as exc:
        print("[Error] %s" % exc, file=sys.stderr)
        return 1
    except (ATLibraryNotFound, ATLibraryLoadError) as exc:
        print("[Error] %s" % exc, file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("\nInterrupted", file=sys.stderr)
        return 130


if __name__ == "__main__":
    sys.exit(main())
