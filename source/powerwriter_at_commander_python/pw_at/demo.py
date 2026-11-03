# -*- coding: utf-8 -*-
"""
Sample workflow corresponding to powerwriter_at_core/powerwriter_at_samples.c.

The module centralizes the API call order and dependencies so the CLI and
GUI share one implementation:

    1. Read writer information / configuration
    2. (Online operations require an offline project on the device)
    3. Connect target -> poll status -> read chip ID
    4. Read target memory
    5. A reset disconnects the target; reconnect before further online ops
    6. Write vendor default OptionByte -> chip erase -> sector erase
    7. Write prepare (target_write_prepare) -> chunked write (target_write)
    8. Read OptionByte -> write user OptionByte
    9. Broadcast (no response)
   10. Run factory SRAM/Flash firmware
   11. Load offline project -> query project info -> start offline -> poll
   12. Switch offline project (PWX1)

All operations use public PowerWriterAT methods; framing and timeouts remain
implemented by the C core.
"""

from __future__ import annotations

import os
import time
from dataclasses import asdict, dataclass, field, replace
from pathlib import Path
from typing import Callable, Dict, List, Optional

from .constants import ATError, ResetType
from .errors import PowerWriterATError
from .models import OfflineState
from .utils import resource_root

DEFAULT_PROJECT = resource_root() / "assets" / "powerwriter_at_demo_project.pkg"
DEFAULT_PROJECT_NAME = "PowerWriter_test_project.pkg"


@dataclass
class ReadRangeSettings:
    """One target-memory read in the safe workflow."""

    enabled: bool = True
    label: str = ""
    address: int = 0
    size: int = 0

    def to_dict(self) -> dict:
        return asdict(self)

    @classmethod
    def from_dict(cls, data, fallback: "ReadRangeSettings") -> "ReadRangeSettings":
        if not isinstance(data, dict):
            return replace(fallback)
        return cls(
            enabled=bool(data.get("enabled", fallback.enabled)),
            label=str(data.get("label", fallback.label)),
            address=_as_int(data.get("address"), fallback.address),
            size=_as_int(data.get("size"), fallback.size),
        )


DEFAULT_READ_RANGES = (
    ReadRangeSettings(True, "2-byte SRAM", 0x20001000, 2),
    ReadRangeSettings(True, "32-byte Flash", 0x08001000, 32),
    ReadRangeSettings(True, "32-byte SRAM", 0x20001020, 32),
)


@dataclass
class SampleWorkflowSettings:
    """Parameters used by run_sample_workflow().

    The defaults reproduce powerwriter_at_samples.c. The GUI uses the same
    object to expose optional steps and hardware-specific addresses/sizes.
    """

    connect_timeout_s: float = 10.0
    reconnect_timeout_s: float = 10.0
    read_ranges: List[ReadRangeSettings] = field(
        default_factory=lambda: [replace(item) for item in DEFAULT_READ_RANGES])

    reset_enabled: bool = True
    reset_type: int = int(ResetType.HW_CORE_RESET)
    reset_delay_ms: int = 200

    write_vendor_ob_enabled: bool = True
    write_vendor_ob_timeout_ms: int = 5000

    full_erase_enabled: bool = True
    full_erase_timeout_ms: int = 10000

    sector_erase_enabled: bool = True
    sector_erase_address: int = 0x080015FF
    sector_erase_size: int = 0x1002
    sector_erase_timeout_ms: int = 10000

    write_enabled: bool = True
    write_address: int = 0x08000000
    write_size: int = 0x20000

    read_ob_enabled: bool = True

    write_user_ob_enabled: bool = True
    write_user_ob_timeout_ms: int = 5000

    broadcast_enabled: bool = True
    broadcast_data: str = "Hello powerwriter AT\\r\\n"
    broadcast_direction: int = 0
    broadcast_keep_frame: bool = False
    broadcast_wait_rsp: bool = False
    broadcast_timeout_ms: int = 5000

    factory_sram_enabled: bool = True
    factory_sram_timeout_ms: int = 5000
    factory_flash_enabled: bool = True
    factory_flash_timeout_ms: int = 5000

    load_project_enabled: bool = True
    offline_start_enabled: bool = True
    offline_timeout_s: int = 120
    switch_project_enabled: bool = True
    switch_reload: bool = True

    def to_dict(self) -> dict:
        return asdict(self)

    @classmethod
    def from_dict(cls, data) -> "SampleWorkflowSettings":
        defaults = cls()
        if not isinstance(data, dict):
            return defaults

        def get_bool(name: str) -> bool:
            return bool(data.get(name, getattr(defaults, name)))

        def get_int(name: str) -> int:
            return _as_int(data.get(name), getattr(defaults, name))

        def get_float(name: str) -> float:
            value = data.get(name, getattr(defaults, name))
            try:
                return float(value)
            except (TypeError, ValueError):
                return float(getattr(defaults, name))

        ranges_data = data.get("read_ranges")
        ranges = []
        for index, fallback in enumerate(DEFAULT_READ_RANGES):
            item = None
            if isinstance(ranges_data, list) and index < len(ranges_data):
                item = ranges_data[index]
            ranges.append(ReadRangeSettings.from_dict(item, fallback))

        return cls(
            connect_timeout_s=get_float("connect_timeout_s"),
            reconnect_timeout_s=get_float("reconnect_timeout_s"),
            read_ranges=ranges,
            reset_enabled=get_bool("reset_enabled"),
            reset_type=get_int("reset_type"),
            reset_delay_ms=get_int("reset_delay_ms"),
            write_vendor_ob_enabled=get_bool("write_vendor_ob_enabled"),
            write_vendor_ob_timeout_ms=get_int("write_vendor_ob_timeout_ms"),
            full_erase_enabled=get_bool("full_erase_enabled"),
            full_erase_timeout_ms=get_int("full_erase_timeout_ms"),
            sector_erase_enabled=get_bool("sector_erase_enabled"),
            sector_erase_address=get_int("sector_erase_address"),
            sector_erase_size=get_int("sector_erase_size"),
            sector_erase_timeout_ms=get_int("sector_erase_timeout_ms"),
            write_enabled=get_bool("write_enabled"),
            write_address=get_int("write_address"),
            write_size=get_int("write_size"),
            read_ob_enabled=get_bool("read_ob_enabled"),
            write_user_ob_enabled=get_bool("write_user_ob_enabled"),
            write_user_ob_timeout_ms=get_int("write_user_ob_timeout_ms"),
            broadcast_enabled=get_bool("broadcast_enabled"),
            broadcast_data=str(data.get("broadcast_data", defaults.broadcast_data)),
            broadcast_direction=get_int("broadcast_direction"),
            broadcast_keep_frame=get_bool("broadcast_keep_frame"),
            broadcast_wait_rsp=get_bool("broadcast_wait_rsp"),
            broadcast_timeout_ms=get_int("broadcast_timeout_ms"),
            factory_sram_enabled=get_bool("factory_sram_enabled"),
            factory_sram_timeout_ms=get_int("factory_sram_timeout_ms"),
            factory_flash_enabled=get_bool("factory_flash_enabled"),
            factory_flash_timeout_ms=get_int("factory_flash_timeout_ms"),
            load_project_enabled=get_bool("load_project_enabled"),
            offline_start_enabled=get_bool("offline_start_enabled"),
            offline_timeout_s=get_int("offline_timeout_s"),
            switch_project_enabled=get_bool("switch_project_enabled"),
            switch_reload=get_bool("switch_reload"),
        )

    def validate(self) -> None:
        if self.connect_timeout_s <= 0 or self.reconnect_timeout_s <= 0:
            raise ValueError("Connect timeouts must be greater than zero")
        if not 0 <= self.reset_type <= 7:
            raise ValueError("Reset type must be between 0 and 7")
        if self.reset_delay_ms < 0:
            raise ValueError("Reset delay cannot be negative")
        checks = (
            (self.write_vendor_ob_enabled, "write_vendor_ob_timeout_ms"),
            (self.full_erase_enabled, "full_erase_timeout_ms"),
            (self.sector_erase_enabled, "sector_erase_timeout_ms"),
            (self.write_user_ob_enabled, "write_user_ob_timeout_ms"),
            (self.broadcast_enabled, "broadcast_timeout_ms"),
            (self.factory_sram_enabled, "factory_sram_timeout_ms"),
            (self.factory_flash_enabled, "factory_flash_timeout_ms"),
        )
        for enabled, name in checks:
            if enabled and getattr(self, name) <= 0:
                raise ValueError("%s must be greater than zero" % name)
        if self.offline_start_enabled and self.offline_timeout_s <= 0:
            raise ValueError("Offline timeout must be greater than zero")
        if self.sector_erase_enabled and (
                self.sector_erase_address < 0 or self.sector_erase_size <= 0):
            raise ValueError("Sector erase address/size is invalid")
        if self.write_enabled and (
                self.write_address < 0 or self.write_size <= 0):
            raise ValueError("Write address/size is invalid")
        for index, item in enumerate(self.read_ranges, 1):
            if item.address < 0 or item.size < 0:
                raise ValueError("Read range %d address/size is invalid" % index)
            if item.enabled and item.size <= 0:
                raise ValueError("Read range %d size must be greater than zero" % index)
        if self.broadcast_direction not in (0, 1):
            raise ValueError("Broadcast direction must be 0 or 1")
        if self.broadcast_enabled and not _decode_escapes(self.broadcast_data):
            raise ValueError("Broadcast data cannot be empty")


def _as_int(value, fallback: int) -> int:
    try:
        return int(value)
    except (TypeError, ValueError):
        return int(fallback)


def _decode_escapes(text: str) -> str:
    """Allow \\r, \\n, \\t and \\\\ in the broadcast setting."""
    return (str(text)
            .replace("\\r", "\r")
            .replace("\\n", "\n")
            .replace("\\t", "\t")
            .replace("\\\\", "\\"))

INTRODUCTION = """
PowerWriter open communication interface

The PowerWriter AT open interface lets you control PowerWriter behavior for highly
flexible personalization and customization, with native hardware support and
cross-platform operation.
More information: https://docs.powerwriter.com/docs/powerwriter_for_arm/reference/ATCommand

ICWorkshop HPT Dep Team(PowerWriter)
Technical support: csh@icworkshop.com
https://www.icworkshop.com / https://www.powerwriter.com
""".strip()

GUIDE_TEXT = """
PowerWriter AT Operation Order and Dependencies
===============================================

1. Open the device
   - The Python client automatically runs powerwriter_at_init and starts the serial read thread.

2. Device information and configuration
   - Read the writer information (get_writer_info) and configuration (get_writer_config) first.
   - Use set_writer_config to change configuration; some fields (target name, offline count) are read-only.
   - Use set_baudrate to change the AT baud rate: the device replies at the old baud rate, then
     switches to the new baud rate, and the client automatically switches the host serial port rate.

3. Prerequisites for online operations (important)
   - Before any online operation or offline programming, an offline project matching the target chip
     must already be loaded on the device.
   - For example, when using an STM32F071, first load stm32f071.pkg onto the device and confirm
     that project-info reports active=1.
   - The project must match the device model/OEM/firmware. If loading returns
     ATErrorOfflineOem(33), use the official PowerWriter software to confirm the project OEM and
     export it again; do not modify the raw .pkg data.
   - If the device has no valid project, run "Load Project" first; do not run online operations
     directly.

4. Connect the target chip
   - The connect command sends only one target_connect command.
   - To confirm the connection state, run status (target_status), then read target_get_id.

5. Read, write, and erase
   - Read: target_read (at most 256 bytes per request; the client splits it into chunks automatically).
   - Write: call target_write_prepare(total length) first, then target_write(address, data); the sample
     calls write prepare explicitly, and the client also offers an automatic write prepare option.
   - Erase: target_erase (full chip) or target_erase_sector (sector).
   - OptionByte: target_read_ob / target_write_vendor_ob / target_write_user_ob.

6. Reset
   - The target chip disconnects after target_reset.
   - Before continuing online operations, call target_connect again and wait for target_status to succeed.

7. Offline project
   - project_load loads a project (with a per-chunk progress callback).
   - project_info reports whether the project is valid, its size, and its CRC32.
   - offline_start starts offline programming; then call offline_status in a loop until the state
     is OK or ERROR.
   - project_switch switches projects (documented as supported only on PWX1).
   - project_disable disables the current project.

8. Broadcast and factory tests
   - broadcast(..., wait_rsp=False) maps to easy_broadcast_no_rsp.
   - broadcast(..., wait_rsp=True) waits for the device response.
   - factory_run_sram_fw / factory_run_flash_fw run the factory firmware.

Note: erase/write/OptionByte/offline programming modify target chip or writer data; confirm before proceeding.
""".strip()


LogFn = Callable[[str, str], None]       # (level, message)
ProgressFn = Callable[[str, int, int], None]  # (label, processed, total)
StopFn = Callable[[], bool]


def wait_target_connected(
    device,
    timeout_s: float = 10.0,
    should_stop: Optional[StopFn] = None,
) -> bool:
    """Poll target status, matching the 10-second wait in the C sample."""
    deadline = time.monotonic() + timeout_s
    while time.monotonic() < deadline:
        if should_stop and should_stop():
            raise InterruptedError("Stopped by user")
        if device.target_status():
            return True
        time.sleep(0.05)
    return False


def run_sample_workflow(
    device,
    destructive: bool = False,
    project_path: Path | str = DEFAULT_PROJECT,
    project_name: str = DEFAULT_PROJECT_NAME,
    log: Optional[LogFn] = None,
    progress: Optional[ProgressFn] = None,
    should_stop: Optional[StopFn] = None,
    settings: Optional[SampleWorkflowSettings] = None,
    project_password: str = "",
    project_name_encoding: Optional[str] = None,
) -> None:
    """
    Run the workflow corresponding to powerwriter_at_samples.c.

    With destructive=False only safe steps are executed (information, connect,
    chip ID, memory reads). With destructive=True the full erase/write/
    OptionByte/offline-project sequence is executed. ``settings`` allows the
    GUI to enable/disable individual steps and supply hardware-specific
    addresses, sizes and timeouts.
    """
    cfg = settings or SampleWorkflowSettings()

    def emit(level: str, message: str) -> None:
        if log:
            log(level, message)

    def report(label: str, processed: int, total: int) -> None:
        if progress:
            progress(label, processed, total)

    def check_stop() -> None:
        if should_stop and should_stop():
            raise InterruptedError("Stopped by user")

    emit("info", "=== 1. Read writer information ===")
    info = device.get_writer_info()
    emit("info", str(info))

    emit("info", "=== 2. Read writer configuration ===")
    try:
        emit("info", device.get_writer_config().describe())
    except PowerWriterATError as exc:
        emit("warn", "Failed to read configuration: %s" % exc)

    check_stop()
    emit("info", "=== 3. Connect target chip ===")
    device.target_connect()
    if not wait_target_connected(device, cfg.connect_timeout_s, should_stop):
        raise PowerWriterATError(ATError.TARGET_CONNECT, "Timed out connecting to target chip")
    emit("info", "Target chip connected")

    emit("info", "=== 4. Read target chip ID ===")
    cid = device.target_get_id()
    emit("info", "Chip ID: %s" % cid.hex)

    emit("info", "=== 5. Target memory read example ===")
    for address, size, name in [
        (item.address, item.size, item.label)
        for item in cfg.read_ranges if item.enabled and item.size > 0
    ]:
        try:
            data = device.target_read(address, size)
            emit("info", "%s @ 0x%08X: %s" % (name, address,
                                             " ".join("%02X" % b for b in data)))
        except PowerWriterATError as exc:
            emit("warn", "Failed to read 0x%08X: %s" % (address, exc))

    check_stop()
    if not destructive:
        emit("info", "Safe workflow complete (target chip not modified).")
        return

    if cfg.reset_enabled:
        emit("info", "=== 6. Reset target chip and reconnect ===")
        device.target_reset(cfg.reset_type)
        time.sleep(max(0, cfg.reset_delay_ms) / 1000.0)
        device.target_connect()
        if not wait_target_connected(device, cfg.reconnect_timeout_s, should_stop):
            raise PowerWriterATError(ATError.TARGET_CONNECT, "Failed to reconnect to target chip after reset")
        emit("info", "Target chip reconnected")

    check_stop()
    if cfg.write_vendor_ob_enabled:
        emit("info", "=== 7. Write vendor default OptionByte ===")
        device.target_write_vendor_ob(cfg.write_vendor_ob_timeout_ms)

    if cfg.full_erase_enabled:
        emit("info", "=== 8. Full-chip erase ===")
        device.target_erase(cfg.full_erase_timeout_ms)

    if cfg.sector_erase_enabled:
        emit("info", "=== 9. Sector erase ===")
        device.target_erase_sector(
            cfg.sector_erase_address, cfg.sector_erase_size,
            cfg.sector_erase_timeout_ms)

    check_stop()
    if cfg.write_enabled:
        emit("info", "=== 10. Write test data (write prepare + chunked write) ===")
        blob = os.urandom(max(1, cfg.write_size))
        device.target_write_prepare(len(blob))
        device.target_write(cfg.write_address, blob, prepare=False,
                            progress=lambda p, t: report("Write", p, t))
        report("Write", len(blob), len(blob))

    if cfg.read_ob_enabled:
        emit("info", "=== 11. Read target OptionByte ===")
        ob = device.target_read_ob()
        emit("info", "OptionByte (%d bytes): %s" % (
            len(ob.data), " ".join("%02X" % b for b in ob.data)))

    if cfg.write_user_ob_enabled:
        emit("info", "=== 12. Write user OptionByte ===")
        device.target_write_user_ob(cfg.write_user_ob_timeout_ms)

    if cfg.broadcast_enabled:
        emit("info", "=== 13. Broadcast ===")
        broadcast_data = _decode_escapes(cfg.broadcast_data).encode("utf-8")
        response = device.broadcast(
            broadcast_data,
            direction=cfg.broadcast_direction,
            keep_frame=cfg.broadcast_keep_frame,
            wait_rsp=cfg.broadcast_wait_rsp,
            timeout_ms=cfg.broadcast_timeout_ms,
        )
        if cfg.broadcast_wait_rsp and response is not None:
            emit("info", "Broadcast response: %s" % response.data.hex())
        else:
            emit("info", "Broadcast sent")

    if cfg.factory_sram_enabled:
        emit("info", "=== 14. Run factory SRAM firmware ===")
        device.factory_run_sram_fw(cfg.factory_sram_timeout_ms)
    if cfg.factory_flash_enabled:
        emit("info", "=== 14. Run factory Flash firmware ===")
        device.factory_run_flash_fw(cfg.factory_flash_timeout_ms)

    check_stop()
    project_info = None
    if cfg.load_project_enabled:
        emit("info", "=== 15. Load offline project ===")
        project = Path(project_path)
        if not project.is_file():
            raise FileNotFoundError("Offline project file not found: %s" % project)
        device.project_load(
            project_name,
            project.read_bytes(),
            password=project_password,
            progress=lambda p, t: report("Load project", p, t),
            name_encoding=project_name_encoding,
        )
    if (cfg.load_project_enabled or cfg.offline_start_enabled
            or cfg.switch_project_enabled):
        project_info = device.project_info()
        emit("info", "Project status: %s, %d bytes, CRC32=0x%08X" % (
            "valid" if project_info.active else "invalid",
            project_info.size, project_info.crc32))

    check_stop()
    if cfg.offline_start_enabled:
        emit("info", "=== 16. Start offline programming and poll status ===")
        device.offline_start()
        deadline = time.monotonic() + max(1, cfg.offline_timeout_s)
        while time.monotonic() < deadline:
            check_stop()
            status = device.offline_status()
            if status.state == OfflineState.OK:
                emit("info", "Offline programming complete")
                break
            if status.failed:
                raise PowerWriterATError(status.error_code, "Offline programming failed")
            if status.progress and status.progress.total:
                if status.progress.processed > status.progress.total:
                    emit("info", "Preparing offline programming...")
                else:
                    report("Offline programming", status.progress.processed,
                           status.progress.total)
            time.sleep(0.3)
        else:
            raise TimeoutError("Timed out waiting for offline programming status")

    if cfg.switch_project_enabled:
        emit("info", "=== 17. Switch offline project ===")
        device.project_switch(
            project_name,
            password=project_password,
            reload=cfg.switch_reload,
            name_encoding=project_name_encoding,
        )
    emit("info", "Full sample workflow complete.")
