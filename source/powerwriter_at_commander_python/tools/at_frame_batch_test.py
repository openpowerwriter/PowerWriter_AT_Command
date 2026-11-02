# -*- coding: utf-8 -*-
"""
Raw AT-frame batch tester for a real PowerWriter device.

This script deliberately does not use the C core for framing: it builds and
parses the documented PWAT frames directly on the serial port.  That makes it
possible to distinguish:

  * a valid success response frame,
  * a valid ATCmdStatusError frame (device rejected the command),
  * no response at all (timeout), and
  * a malformed frame / device disconnect.

The C library is not modified by this tool.
"""

from __future__ import annotations

import argparse
import json
import struct
import sys
import threading
import time
import zlib
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Iterable, Optional

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from pw_at.serial_backend import list_serial_ports, open_backend  # noqa: E402


# ---------------------------------------------------------------------------
# Protocol constants
# ---------------------------------------------------------------------------
CMD_INFO = 1
CMD_RSP_INFO = 2
CMD_GET_CFG = 3
CMD_RSP_CFG = 4
CMD_SET_CFG = 5
CMD_SET_BAUD = 6

CMD_CONNECT = 100
CMD_STATUS = 101
CMD_CHIP_ID = 102
CMD_RSP_CHIP_ID = 103
CMD_READ = 104
CMD_RSP_READ = 105
CMD_ERASE = 106
CMD_ERASE_SECTOR = 107
CMD_WRITE_PREPARE = 108
CMD_WRITE = 109
CMD_READ_OB = 110
CMD_RSP_READ_OB = 111
CMD_WRITE_VENDOR_OB = 112
CMD_WRITE_USER_OB = 113
CMD_RESET = 114

CMD_PROJECT_INFO = 200
CMD_RSP_PROJECT_INFO = 201
CMD_PROJECT_LOAD = 202
CMD_PROJECT_LOAD_SEND = 203
CMD_PROJECT_DISABLE = 204
CMD_OFFLINE_START = 205
CMD_OFFLINE_STATUS = 206
CMD_PROJECT_SWITCH = 207

CMD_FACTORY_SRAM = 300
CMD_FACTORY_FLASH = 301
CMD_BROADCAST = 400

STATUS_OK = 2147483547
STATUS_ERROR = 2147483548
STATUS_PROGRESS = 2147483549

CMD_NAMES = {
    CMD_INFO: "GetWriterInfo",
    CMD_RSP_INFO: "RspWriterInfo",
    CMD_GET_CFG: "GetWriterCfg",
    CMD_RSP_CFG: "RspWriterCfg",
    CMD_SET_CFG: "SetWriterCfg",
    CMD_SET_BAUD: "SetBaudRate",
    CMD_CONNECT: "ConnectTarget",
    CMD_STATUS: "GetTargetStatus",
    CMD_CHIP_ID: "GetTargetChipID",
    CMD_RSP_CHIP_ID: "RspTargetChipID",
    CMD_READ: "ReadTargetMemory",
    CMD_RSP_READ: "RspTargetMemory",
    CMD_ERASE: "EraseTarget",
    CMD_ERASE_SECTOR: "EraseTargetSectors",
    CMD_WRITE_PREPARE: "WriteTargetMemoryPrepare",
    CMD_WRITE: "WriteTargetMemory",
    CMD_READ_OB: "ReadTargetOptionByte",
    CMD_RSP_READ_OB: "RspTargetOptionByte",
    CMD_WRITE_VENDOR_OB: "WriteTargetVendorOptionByte",
    CMD_WRITE_USER_OB: "WriteTargetUserOptionByte",
    CMD_RESET: "TargetReset",
    CMD_PROJECT_INFO: "GetProjectInfo",
    CMD_RSP_PROJECT_INFO: "RspProjectInfo",
    CMD_PROJECT_LOAD: "LoadProject",
    CMD_PROJECT_LOAD_SEND: "LoadProjectSend",
    CMD_PROJECT_DISABLE: "DisableProject",
    CMD_OFFLINE_START: "StartOffline",
    CMD_OFFLINE_STATUS: "GetOfflineStatus",
    CMD_PROJECT_SWITCH: "SwitchOfflineProject",
    CMD_FACTORY_SRAM: "FactoryRunSRAMFW",
    CMD_FACTORY_FLASH: "FactoryRunFlashFW",
    CMD_BROADCAST: "Broadcast",
    STATUS_OK: "StatusOK",
    STATUS_ERROR: "StatusError",
    STATUS_PROGRESS: "StatusProgress",
}

RESPONSE_PROP_SIZE = {
    CMD_RSP_INFO: 64,
    CMD_RSP_CFG: 70,
    CMD_RSP_CHIP_ID: 17,
    CMD_RSP_READ: 264,
    CMD_RSP_READ_OB: 1028,
    CMD_RSP_PROJECT_INFO: 9,
}


def cmd_name(cmd: int) -> str:
    return CMD_NAMES.get(cmd, "0x%08X" % (cmd & 0xFFFFFFFF))


# ---------------------------------------------------------------------------
# Frame encoding/decoding
# ---------------------------------------------------------------------------
@dataclass
class Frame:
    raw: bytes
    cmd: int
    prop: bytes
    crc_ok: bool

    @property
    def cmd_size(self) -> int:
        return len(self.prop)

    @property
    def error_code(self) -> Optional[int]:
        if self.cmd == STATUS_ERROR and len(self.prop) >= 4:
            return struct.unpack_from("<I", self.prop, 0)[0]
        return None

    def summary(self) -> str:
        name = cmd_name(self.cmd)
        if self.cmd == STATUS_ERROR:
            return "%s(err=%s)" % (name, self.error_code)
        if self.cmd == STATUS_PROGRESS and len(self.prop) >= 8:
            total, processed = struct.unpack_from("<II", self.prop, 0)
            return "%s(%d/%d)" % (name, processed, total)
        return "%s(size=%d)" % (name, self.cmd_size)


def build_frame(cmd: int, prop: bytes) -> bytes:
    payload = struct.pack("<iI", cmd, len(prop)) + prop
    total = 8 + len(payload) + 4
    body = b"PWAT" + struct.pack("<I", total) + payload
    crc = zlib.crc32(body) & 0xFFFFFFFF
    return body + struct.pack("<I", crc)


class FrameDecoder:
    """Incremental PWAT frame decoder used only for observation."""

    def __init__(self) -> None:
        self.buffer = b""
        self.discarded = 0
        self.bad_crc = 0
        self.bad_length = 0

    def feed(self, data: bytes) -> list[Frame]:
        self.buffer += data
        frames: list[Frame] = []
        while True:
            index = self.buffer.find(b"PWAT")
            if index < 0:
                if len(self.buffer) > 3:
                    self.discarded += len(self.buffer) - 3
                    self.buffer = self.buffer[-3:]
                break
            if index:
                self.discarded += index
                self.buffer = self.buffer[index:]
            if len(self.buffer) < 8:
                break
            total = struct.unpack_from("<I", self.buffer, 4)[0]
            if total < 20 or total > 65536:
                self.bad_length += 1
                self.discarded += 1
                self.buffer = self.buffer[1:]
                continue
            if len(self.buffer) < total:
                break
            raw = self.buffer[:total]
            self.buffer = self.buffer[total:]
            calc = zlib.crc32(raw[:-4]) & 0xFFFFFFFF
            stored = struct.unpack_from("<I", raw, total - 4)[0]
            cmd, cmd_size = struct.unpack_from("<iI", raw, 8)
            prop = raw[16:16 + cmd_size]
            frames.append(Frame(raw=raw, cmd=cmd, prop=prop, crc_ok=calc == stored))
        return frames


# ---------------------------------------------------------------------------
# Property builders
# ---------------------------------------------------------------------------
def p4(value: int) -> bytes:
    return struct.pack("<I", value & 0xFFFFFFFF)


def p8(a: int, b: int) -> bytes:
    return struct.pack("<II", a & 0xFFFFFFFF, b & 0xFFFFFFFF)


def project_name(name: str, encoding: str = "utf-8") -> bytes:
    raw = name.encode(encoding, "replace")[:254]
    return raw + b"\x00" * (255 - len(raw))


def load_project_header(password: str, size: int, crc: int, name: str) -> bytes:
    pwd = password.encode("utf-8")[:16]
    pwd = pwd + b"\x00" * (16 - len(pwd))
    return pwd + p4(size) + p4(crc) + project_name(name)


def load_project_packet(offset: int, data: bytes) -> bytes:
    return p4(offset) + p4(len(data)) + data + b"\x00" * (256 - len(data))


def switch_project(reload_type: int, password: str, name: str) -> bytes:
    pwd = password.encode("utf-8")[:16]
    pwd = pwd + b"\x00" * (16 - len(pwd))
    return p4(reload_type) + pwd + project_name(name)


def broadcast_prop(data: bytes, direction: int = 0, keep: bool = False) -> bytes:
    data = data[:256]
    return struct.pack("<BiI", 1 if keep else 0, direction, len(data)) + data


# ---------------------------------------------------------------------------
# Test cases
# ---------------------------------------------------------------------------
@dataclass
class Case:
    name: str
    cmd: int
    prop: bytes
    timeout_ms: int = 1500
    expect: str = "status"      # status | info | cfg | chipid | mem | ob | projinfo | none | any
    destructive: bool = False
    note: str = ""
    stop_on_status: bool = True


@dataclass
class CaseResult:
    case: Case
    iteration: int
    success: bool
    classification: str
    elapsed_ms: int
    tx_hex: str
    frames: list[str] = field(default_factory=list)
    error: str = ""
    alive_after: Optional[bool] = None
    usb_events: list[str] = field(default_factory=list)


def expected_frame(case: Case, frame: Frame) -> bool:
    if not frame.crc_ok:
        return False
    if case.expect == "none":
        return False
    if case.expect == "status":
        return frame.cmd in (STATUS_OK, STATUS_ERROR)
    mapping = {
        "info": CMD_RSP_INFO,
        "cfg": CMD_RSP_CFG,
        "chipid": CMD_RSP_CHIP_ID,
        "mem": CMD_RSP_READ,
        "ob": CMD_RSP_READ_OB,
        "projinfo": CMD_RSP_PROJECT_INFO,
    }
    return frame.cmd == mapping.get(case.expect)


def classify(case: Case, frames: list[Frame], decoder: FrameDecoder) -> tuple[bool, str]:
    if decoder.bad_crc or decoder.bad_length:
        return False, "BAD_FRAME"
    if not frames:
        if case.expect == "none":
            return True, "NO_RSP_EXPECTED"
        return False, "NO_RESPONSE"
    if case.expect == "none":
        return False, "UNEXPECTED_RSP"
    if case.expect == "any":
        return True, "ANY_RSP"
    for frame in frames:
        if frame.cmd == STATUS_ERROR:
            return True, "ERROR_RSP"
        if expected_frame(case, frame):
            return True, "OK_RSP"
    if case.expect == "status" and any(f.cmd == STATUS_PROGRESS for f in frames):
        return False, "ONLY_PROGRESS"
    return False, "UNEXPECTED_RSP"


# ---------------------------------------------------------------------------
# Serial session
# ---------------------------------------------------------------------------
class Device:
    def __init__(self, port: Optional[str], baud: int):
        self.preferred = port
        self.baud = baud
        self.backend = None
        self.port = None
        self.decoder = FrameDecoder()

    def find_port(self) -> Optional[str]:
        ports = list_serial_ports(powerwriter_only=True)
        devices = [p.device for p in ports]
        if self.preferred and self.preferred in devices:
            return self.preferred
        if self.preferred and not devices:
            # The OS may still have the old port even if VID/PID lookup failed.
            return self.preferred
        return devices[0] if devices else None

    def open(self, wait_s: float = 0.0) -> bool:
        deadline = time.monotonic() + wait_s
        while True:
            port = self.find_port()
            if port:
                try:
                    self.backend = open_backend(port, self.baud)
                    self.port = port
                    self.decoder = FrameDecoder()
                    time.sleep(0.05)
                    return True
                except Exception:
                    self.backend = None
            if time.monotonic() >= deadline:
                return False
            time.sleep(0.3)

    def close(self) -> None:
        if self.backend is not None:
            try:
                self.backend.close()
            except Exception:
                pass
        self.backend = None

    def reopen(self, wait_s: float = 10.0) -> bool:
        self.close()
        return self.open(wait_s)

    def drain(self, quiet_s: float = 0.05) -> bytes:
        if self.backend is None:
            return b""
        data = b""
        deadline = time.monotonic() + 0.5
        last = time.monotonic()
        while time.monotonic() < deadline:
            try:
                chunk = self.backend.read(quiet_s)
            except Exception:
                break
            if chunk:
                data += chunk
                last = time.monotonic()
            elif time.monotonic() - last >= quiet_s:
                break
        return data

    def exchange(
        self,
        cmd: int,
        prop: bytes,
        timeout_ms: int,
        stop_when: Optional[Callable[[list[Frame]], bool]] = None,
    ) -> tuple[list[Frame], int, str]:
        if self.backend is None:
            return [], 0, "PORT_CLOSED"
        self.decoder = FrameDecoder()
        self.drain()
        frame = build_frame(cmd, prop)
        started = time.monotonic()
        try:
            self.backend.write(frame)
        except Exception as exc:
            return [], int((time.monotonic() - started) * 1000), "WRITE_FAILED: %s" % exc

        frames: list[Frame] = []
        last_rx = None
        deadline = started + timeout_ms / 1000.0
        while time.monotonic() < deadline:
            try:
                data = self.backend.read(0.02)
            except Exception as exc:
                return frames, int((time.monotonic() - started) * 1000), "READ_FAILED: %s" % exc
            if data:
                last_rx = time.monotonic()
                frames.extend(self.decoder.feed(data))
                if stop_when and stop_when(frames):
                    break
            elif last_rx is not None and time.monotonic() - last_rx > 0.15:
                break
        elapsed = int((time.monotonic() - started) * 1000)
        return frames, elapsed, ""

    def transact(self, case: Case) -> tuple[list[Frame], int, str]:
        def stop_when(frames: list[Frame]) -> bool:
            if case.stop_on_status and any(
                f.cmd in (STATUS_OK, STATUS_ERROR) for f in frames
            ):
                return True
            if case.expect not in ("status", "none", "any") and any(
                expected_frame(case, f) for f in frames
            ):
                return True
            return False

        return self.exchange(case.cmd, case.prop, case.timeout_ms, stop_when)

    def alive(self, timeout_ms: int = 1200) -> bool:
        if self.backend is None:
            return False
        try:
            self.decoder = FrameDecoder()
            self.drain()
            self.backend.write(build_frame(CMD_INFO, p4(0)))
            deadline = time.monotonic() + timeout_ms / 1000.0
            frames: list[Frame] = []
            while time.monotonic() < deadline:
                data = self.backend.read(0.02)
                if data:
                    frames.extend(self.decoder.feed(data))
                    if any(f.cmd == CMD_RSP_INFO and f.crc_ok for f in frames):
                        return True
            return False
        except Exception:
            return False


class UsbMonitor(threading.Thread):
    """Watch the PowerWriter COM port for a USB drop/re-enumeration."""

    def __init__(self, port: Optional[str], duration_s: float = 15.0,
                 interval_s: float = 0.2) -> None:
        super().__init__(daemon=True)
        self.port = port
        self.duration_s = duration_s
        self.interval_s = interval_s
        self.stop_event = threading.Event()
        self.events: list[str] = []
        self.started = time.monotonic()
        self._absent = 0
        self._present = True

    def _ports(self):
        try:
            return list_serial_ports(powerwriter_only=False)
        except Exception:
            return None

    def run(self) -> None:
        while (not self.stop_event.is_set()
               and time.monotonic() - self.started < self.duration_s):
            now = time.monotonic() - self.started
            ports = self._ports()
            if ports is not None:
                powerwriter = [p for p in ports if p.is_powerwriter]
                devices = [p.device for p in powerwriter]
                present = (self.port in devices) if self.port else bool(devices)
                if not present:
                    self._absent += 1
                    if self._absent >= 2 and self._present:
                        self._present = False
                        extra = (" (other PowerWriter: %s)" % ",".join(devices)
                                 if devices else "")
                        self.events.append("USB_DROP@%.1fs%s" % (now, extra))
                else:
                    if not self._present:
                        self._present = True
                        self.events.append("USB_RETURN@%.1fs" % now)
                    self._absent = 0
            time.sleep(self.interval_s)
        if not self._present:
            self.events.append("USB_ABSENT_AT_END")
        if not self.events:
            self.events.append("USB_STABLE")

    def stop(self) -> None:
        self.stop_event.set()
        self.join(timeout=2.0)


# ---------------------------------------------------------------------------
# Case definitions
# ---------------------------------------------------------------------------
def safe_cases() -> list[Case]:
    return [
        Case("info", CMD_INFO, p4(0), 1500, "info"),
        Case("config-get", CMD_GET_CFG, p4(0), 1500, "cfg"),
        Case("status", CMD_STATUS, p4(0), 1500, "status"),
        Case("chip-id", CMD_CHIP_ID, p4(0), 1500, "chipid"),
        Case("read-flash-16", CMD_READ, p8(0x08000000, 16), 5500, "mem"),
        Case("read-sram-16", CMD_READ, p8(0x20000000, 16), 5500, "mem"),
        Case("read-ob", CMD_READ_OB, p4(0), 5500, "ob"),
        Case("project-info", CMD_PROJECT_INFO, p4(0), 1500, "projinfo"),
        Case("connect-target", CMD_CONNECT, p4(0), 2000, "status"),
        Case("offline-status", CMD_OFFLINE_STATUS, p4(0), 1500, "status"),
        Case("broadcast-no-rsp", CMD_BROADCAST, broadcast_prop(b"PWAT batch\r\n"),
             400, "none", stop_on_status=False),
        Case("broadcast-wait-rsp", CMD_BROADCAST, broadcast_prop(b"PWAT batch\r\n"),
             1200, "any", stop_on_status=False),
    ]


def online_cases() -> list[Case]:
    """Target-mutating commands; the caller must opt in."""
    data = bytes(range(16))
    return [
        Case("erase", CMD_ERASE, p4(0), 2000, "status", destructive=True,
             note="full chip erase (target may be absent)"),
        Case("erase-sector", CMD_ERASE_SECTOR, p8(0x08000000, 0x400), 2000,
             "status", destructive=True),
        Case("write-prepare", CMD_WRITE_PREPARE, p4(16), 1500, "status",
             destructive=True),
        Case("write-16", CMD_WRITE, p8(0x08000000, len(data)) + data, 2000,
             "status", destructive=True),
        Case("write-sram-16", CMD_WRITE, p8(0x20001000, len(data)) + data, 3000,
             "status", destructive=True),
        Case("reset", CMD_RESET, p4(3), 1500, "status", destructive=True),
    ]


def device_cases() -> list[Case]:
    """Writer-state commands; some can invalidate/load the offline project."""
    return [
        Case("set-baud-9600", CMD_SET_BAUD, p4(9600), 2000, "status"),
        Case("project-disable", CMD_PROJECT_DISABLE, p4(0), 1500, "status",
             destructive=True),
        Case("offline-start", CMD_OFFLINE_START, p4(0), 2000, "status",
             destructive=True),
        Case("project-switch", CMD_PROJECT_SWITCH,
             switch_project(0, "", "PowerWriter_test_project.pkg"), 3000, "status",
             destructive=True),
        Case("project-switch-stm32", CMD_PROJECT_SWITCH,
             switch_project(0, "", "stm32f071.pkg"), 3000, "status",
             destructive=True),
    ]


def risky_cases() -> list[Case]:
    return [
        Case("factory-sram", CMD_FACTORY_SRAM, p4(0), 3000, "status",
             destructive=True),
        Case("factory-flash", CMD_FACTORY_FLASH, p4(0), 3000, "status",
             destructive=True),
        Case("write-vendor-ob", CMD_WRITE_VENDOR_OB, p4(0), 2000, "status",
             destructive=True),
        Case("write-user-ob", CMD_WRITE_USER_OB, p4(0), 2000, "status",
             destructive=True),
    ]


# ---------------------------------------------------------------------------
# Runner
# ---------------------------------------------------------------------------
def run_case(
    device: Device,
    case: Case,
    iteration: int,
    check_alive: bool,
    monitor_usb_s: float = 0.0,
) -> CaseResult:
    monitor = None
    if monitor_usb_s > 0:
        monitor = UsbMonitor(device.port, monitor_usb_s)
        monitor.start()

    frames, elapsed, error = device.transact(case)
    if error:
        success, classification = False, error.split(":", 1)[0]
    else:
        success, classification = classify(case, frames, device.decoder)

    if monitor is not None:
        if not frames:
            # The device watchdog restarts the firmware about 15 seconds after
            # an abnormal state. Keep watching for 15 seconds after this
            # command finished timing out, so a late USB drop is not missed.
            monitor.duration_s = max(
                monitor.duration_s,
                (time.monotonic() - monitor.started) + 15.0,
            )
        remaining = monitor.duration_s - (time.monotonic() - monitor.started)
        if remaining > 0:
            time.sleep(remaining)
        monitor.stop()

    tx_hex = build_frame(case.cmd, case.prop).hex()
    result = CaseResult(
        case=case,
        iteration=iteration,
        success=success,
        classification=classification,
        elapsed_ms=elapsed,
        tx_hex=tx_hex,
        frames=[f.summary() + ("" if f.crc_ok else " BAD_CRC") for f in frames],
        error=error,
        usb_events=list(monitor.events) if monitor is not None else [],
    )
    if check_alive:
        result.alive_after = device.alive()
        if not result.alive_after:
            device.reopen()
            result.alive_after = device.alive()
    print(
        "[%s] %-20s tx=%-5d rx=%-44s %5dms  %s%s%s"
        % (
            "PASS" if success else "FAIL",
            case.name,
            case.cmd,
            ", ".join(result.frames) if result.frames else "<none>",
            elapsed,
            classification,
            "" if result.alive_after is not False else " ALIVE=NO",
            (" USB=" + ",".join(result.usb_events)) if result.usb_events else "",
        ),
        flush=True,
    )
    return result


def run_project_load(
    device: Device,
    path: Path,
    name: str,
    password: str,
    header_timeout_ms: int,
    packet_timeout_ms: int,
    output: Path,
) -> int:
    """Send LoadProject header and each 256-byte packet, reporting every step."""
    data = path.read_bytes()
    crc = zlib.crc32(data) & 0xFFFFFFFF
    print("Project: %s, %d bytes, CRC32=0x%08X, name=%r"
          % (path, len(data), crc, name), flush=True)

    output.parent.mkdir(parents=True, exist_ok=True)
    handle = output.open("w", encoding="utf-8")

    def write_record(kind: str, offset: int, size: int, frames: list[Frame],
                     elapsed: int, error: str) -> None:
        handle.write(json.dumps({
            "kind": kind,
            "offset": offset,
            "size": size,
            "elapsed_ms": elapsed,
            "frames": [f.summary() + ("" if f.crc_ok else " BAD_CRC") for f in frames],
            "error": error,
            "port": device.port,
        }, ensure_ascii=False) + "\n")
        handle.flush()

    def terminal(frames: list[Frame]) -> bool:
        return any(f.cmd in (STATUS_OK, STATUS_ERROR) for f in frames)

    try:
        frames, elapsed, error = device.exchange(
            CMD_PROJECT_LOAD,
            load_project_header(password, len(data), crc, name),
            header_timeout_ms,
            terminal,
        )
        write_record("header", 0, len(data), frames, elapsed, error)
        print("[HEADER] %6dms  %-50s %s"
              % (elapsed, ", ".join(f.summary() for f in frames) or "<none>",
                 error or ""), flush=True)
        if error or not any(f.cmd == STATUS_OK for f in frames):
            print("[STOP] project header rejected or unanswered", flush=True)
            return 1

        offset = 0
        packet = 0
        while offset < len(data):
            chunk = data[offset:offset + 256]
            frames, elapsed, error = device.exchange(
                CMD_PROJECT_LOAD_SEND,
                load_project_packet(offset, chunk),
                packet_timeout_ms,
                terminal,
            )
            write_record("packet", offset, len(chunk), frames, elapsed, error)
            print("[PACKET %3d] offset=%6d size=%3d  %6dms  %-45s %s"
                  % (packet, offset, len(chunk), elapsed,
                     ", ".join(f.summary() for f in frames) or "<none>",
                     error or ""), flush=True)
            if error or not any(f.cmd == STATUS_OK for f in frames):
                print("[STOP] packet offset=%d failed; device alive check..."
                      % offset, flush=True)
                alive = device.alive()
                print("[STOP] alive=%s, port=%s" % (alive, device.port), flush=True)
                if not alive:
                    old_port = device.port
                    if device.reopen(wait_s=10.0):
                        print("[STOP] device re-enumerated: %s -> %s"
                              % (old_port, device.port), flush=True)
                    else:
                        print("[STOP] device did not come back", flush=True)
                if device.backend is not None:
                    info_frames, info_elapsed, info_error = device.exchange(
                        CMD_PROJECT_INFO, p4(0), 1500, terminal)
                    write_record("project-info", 0, 0, info_frames,
                                 info_elapsed, info_error)
                    summary = ", ".join(f.summary() for f in info_frames) or "<none>"
                    print("[PROJECT-INFO] %6dms  %s" % (info_elapsed, summary),
                          flush=True)
                    for frame in info_frames:
                        if frame.cmd == CMD_RSP_PROJECT_INFO and len(frame.prop) >= 9:
                            active = frame.prop[0]
                            size, info_crc = struct.unpack_from("<II", frame.prop, 1)
                            print("[PROJECT-INFO] active=%d size=%d (0x%08X) crc=0x%08X"
                                  % (active, size, size, info_crc), flush=True)
                return 1
            offset += len(chunk)
            packet += 1

        info_frames, info_elapsed, info_error = device.exchange(
            CMD_PROJECT_INFO, p4(0), 1500, terminal)
        write_record("project-info", 0, 0, info_frames, info_elapsed, info_error)
        print("[DONE] all %d packets acknowledged" % packet, flush=True)
        print("[PROJECT-INFO] %6dms  %s"
              % (info_elapsed,
                 ", ".join(f.summary() for f in info_frames) or "<none>"),
              flush=True)
        for frame in info_frames:
            if frame.cmd == CMD_RSP_PROJECT_INFO and len(frame.prop) >= 9:
                active = frame.prop[0]
                size, info_crc = struct.unpack_from("<II", frame.prop, 1)
                print("[PROJECT-INFO] active=%d size=%d (0x%08X) crc=0x%08X"
                      % (active, size, size, info_crc), flush=True)
        return 0
    finally:
        handle.close()


def run_config_roundtrip(
    device: Device,
    output: Path,
    write_timeout_ms: int = 3000,
) -> int:
    """Read the 70-byte writer config, write it back unchanged, read again."""
    output.parent.mkdir(parents=True, exist_ok=True)
    handle = output.open("w", encoding="utf-8")

    def terminal(frames: list[Frame]) -> bool:
        return any(f.cmd in (STATUS_OK, STATUS_ERROR) for f in frames)

    def get_config() -> Optional[bytes]:
        frames, elapsed, error = device.exchange(
            CMD_GET_CFG, p4(0), 2000,
            lambda fs: any(f.cmd == CMD_RSP_CFG for f in fs) or terminal(fs),
        )
        print("[GET-CFG] %6dms  %s %s"
              % (elapsed, ", ".join(f.summary() for f in frames) or "<none>",
                 error or ""), flush=True)
        handle.write(json.dumps({
            "kind": "get-config", "elapsed_ms": elapsed,
            "frames": [f.summary() for f in frames], "error": error,
        }, ensure_ascii=False) + "\n")
        handle.flush()
        for frame in frames:
            if frame.cmd == CMD_RSP_CFG:
                return frame.prop
        return None

    try:
        config = get_config()
        if config is None:
            print("[STOP] config-get failed", flush=True)
            return 1
        print("[GET-CFG] %d bytes: %s" % (len(config), config.hex()), flush=True)

        frames, elapsed, error = device.exchange(
            CMD_SET_CFG, config, write_timeout_ms, terminal)
        print("[SET-CFG] %6dms  %s %s"
              % (elapsed, ", ".join(f.summary() for f in frames) or "<none>",
                 error or ""), flush=True)
        handle.write(json.dumps({
            "kind": "set-config", "elapsed_ms": elapsed,
            "frames": [f.summary() for f in frames], "error": error,
        }, ensure_ascii=False) + "\n")
        handle.flush()
        if error or not any(f.cmd == STATUS_OK for f in frames):
            print("[STOP] config-set failed", flush=True)
            return 1

        again = get_config()
        if again is None:
            print("[STOP] config re-read failed", flush=True)
            return 1
        if again == config:
            print("[OK] config read-back is identical (%d bytes)" % len(again),
                  flush=True)
            return 0
        print("[WARN] config changed after write-back", flush=True)
        print("[WARN] before: %s" % config.hex(), flush=True)
        print("[WARN] after : %s" % again.hex(), flush=True)
        return 1
    finally:
        handle.close()


def main(argv: Optional[Iterable[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Raw PWAT frame batch tester")
    parser.add_argument("--port", help="serial port, default: auto-detect PowerWriter")
    parser.add_argument("--baud", type=int, default=9600)
    parser.add_argument("--repeat", type=int, default=3)
    parser.add_argument("--phase", choices=["safe", "online", "device", "risky", "all"],
                        default="safe")
    parser.add_argument("--only", help="comma-separated case names to run")
    parser.add_argument("--timeout-ms", type=int,
                        help="override the per-case response timeout")
    parser.add_argument("--config-set-same", action="store_true",
                        help="read the 70-byte config, write it back unchanged, verify")
    parser.add_argument("--load-project",
                        help="test LoadProject with this .pkg file")
    parser.add_argument("--project-name", help="project name stored on the writer")
    parser.add_argument("--project-password", default="")
    parser.add_argument("--header-timeout-ms", type=int, default=5000)
    parser.add_argument("--packet-timeout-ms", type=int, default=2000)
    parser.add_argument("--check-alive", action="store_true",
                        help="send GetWriterInfo after every case")
    parser.add_argument("--monitor-usb", type=float, default=0.0,
                        help="watch the PowerWriter COM port for N seconds "
                             "(detect USB drop/re-enumeration)")
    parser.add_argument("--pre-reset", action="store_true",
                        help="send TargetReset before every case to disconnect the target")
    parser.add_argument("--output", default="tools/at_batch_results.jsonl")
    args = parser.parse_args(argv)

    cases: list[Case] = []
    if args.phase in ("safe", "all"):
        cases += safe_cases()
    if args.phase in ("online", "all"):
        cases += online_cases()
    if args.phase in ("device", "all"):
        cases += device_cases()
    if args.phase in ("risky", "all"):
        cases += risky_cases()
    if args.only:
        wanted = {name.strip() for name in args.only.split(",") if name.strip()}
        cases = [case for case in cases if case.name in wanted]
        if not cases:
            print("ERROR: no matching cases for --only %s" % args.only,
                  file=sys.stderr)
            return 2
    if args.timeout_ms:
        for case in cases:
            case.timeout_ms = args.timeout_ms

    device = Device(args.port, args.baud)
    if not device.open(wait_s=5.0):
        print("ERROR: PowerWriter serial port not found", file=sys.stderr)
        return 2
    print("Port: %s @ %d, phase=%s, repeat=%d"
          % (device.port, args.baud, args.phase, args.repeat), flush=True)

    if args.config_set_same:
        try:
            return run_config_roundtrip(device, Path(args.output))
        finally:
            device.close()

    if args.load_project:
        project = Path(args.load_project)
        if not project.is_file():
            print("ERROR: project file not found: %s" % project, file=sys.stderr)
            device.close()
            return 2
        try:
            return run_project_load(
                device,
                project,
                args.project_name or project.name,
                args.project_password,
                args.header_timeout_ms,
                args.packet_timeout_ms,
                Path(args.output),
            )
        finally:
            device.close()

    results: list[CaseResult] = []
    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    try:
        with output.open("w", encoding="utf-8") as handle:
            for case in cases:
                for iteration in range(args.repeat):
                    if device.backend is None:
                        device.reopen(wait_s=10.0)
                    if args.pre_reset:
                        reset_frames, reset_ms, reset_error = device.exchange(
                            CMD_RESET, p4(3), 2000,
                            lambda fs: any(f.cmd in (STATUS_OK, STATUS_ERROR)
                                           for f in fs),
                        )
                        print("[PRE-RESET] %5dms %s %s"
                              % (reset_ms,
                                 ", ".join(f.summary() for f in reset_frames)
                                 or "<none>", reset_error or ""), flush=True)
                        time.sleep(0.3)
                    result = run_case(device, case, iteration,
                                      args.check_alive, args.monitor_usb)
                    results.append(result)
                    handle.write(json.dumps({
                        "case": result.case.name,
                        "cmd": result.case.cmd,
                        "iteration": result.iteration,
                        "success": result.success,
                        "classification": result.classification,
                        "elapsed_ms": result.elapsed_ms,
                        "tx_hex": result.tx_hex,
                        "frames": result.frames,
                        "error": result.error,
                        "alive_after": result.alive_after,
                        "usb_events": result.usb_events,
                    }, ensure_ascii=False) + "\n")
                    handle.flush()
    finally:
        device.close()

    total = len(results)
    passed = sum(1 for r in results if r.success)
    no_rsp = sum(1 for r in results if r.classification == "NO_RESPONSE")
    bad = sum(1 for r in results if r.classification == "BAD_FRAME")
    print("\nSummary: %d/%d passed, %d no-response, %d bad-frame"
          % (passed, total, no_rsp, bad), flush=True)
    if no_rsp:
        names = sorted({r.case.name for r in results if r.classification == "NO_RESPONSE"})
        print("No-response cases: %s" % ", ".join(names), flush=True)
    return 0 if passed == total else 1


if __name__ == "__main__":
    raise SystemExit(main())
