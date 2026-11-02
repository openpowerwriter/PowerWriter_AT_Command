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
from pathlib import Path
from typing import Callable, Optional

from .constants import ATError, ResetType
from .errors import PowerWriterATError
from .models import OfflineState
from .utils import resource_root

DEFAULT_PROJECT = resource_root() / "assets" / "powerwriter_at_demo_project.pkg"
DEFAULT_PROJECT_NAME = "PowerWriter_test_project.pkg"

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
) -> None:
    """
    Run the workflow corresponding to powerwriter_at_samples.c.

    With destructive=False only safe steps are executed (information, connect,
    chip ID, memory reads). With destructive=True the full erase/write/
    OptionByte/offline-project sequence is executed.
    """
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
    if not wait_target_connected(device, 10, should_stop):
        raise PowerWriterATError(ATError.TARGET_CONNECT, "Timed out connecting to target chip")
    emit("info", "Target chip connected")

    emit("info", "=== 4. Read target chip ID ===")
    cid = device.target_get_id()
    emit("info", "Chip ID: %s" % cid.hex)

    emit("info", "=== 5. Target memory read example ===")
    for address, size, name in [
        (0x20001000, 2, "2-byte SRAM"),
        (0x08001000, 32, "32-byte Flash"),
        (0x20001020, 32, "32-byte SRAM"),
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

    emit("info", "=== 6. Reset target chip and reconnect ===")
    device.target_reset(ResetType.HW_CORE_RESET)
    time.sleep(0.2)
    device.target_connect()
    if not wait_target_connected(device, 10, should_stop):
        raise PowerWriterATError(ATError.TARGET_CONNECT, "Failed to reconnect to target chip after reset")
    emit("info", "Target chip reconnected")

    check_stop()
    emit("info", "=== 7. Write vendor default OptionByte ===")
    device.target_write_vendor_ob()

    emit("info", "=== 8. Full-chip erase ===")
    device.target_erase(10000)

    emit("info", "=== 9. Sector erase ===")
    device.target_erase_sector(0x080015FF, 0x1002, 10000)

    check_stop()
    emit("info", "=== 10. Write 128 KB test data (write prepare + chunked write) ===")
    blob = os.urandom(0x20000)
    device.target_write_prepare(len(blob))
    device.target_write(0x08000000, blob, prepare=False,
                        progress=lambda p, t: report("Write", p, t))
    report("Write", len(blob), len(blob))

    emit("info", "=== 11. Read target OptionByte ===")
    ob = device.target_read_ob()
    emit("info", "OptionByte (%d bytes): %s" % (
        len(ob.data), " ".join("%02X" % b for b in ob.data)))

    emit("info", "=== 12. Write user OptionByte ===")
    device.target_write_user_ob()

    emit("info", "=== 13. Broadcast (no response required) ===")
    device.broadcast(b"Hello powerwriter AT\r\n", keep_frame=False, wait_rsp=False)
    emit("info", "Broadcast sent")

    emit("info", "=== 14. Run factory SRAM / Flash firmware ===")
    device.factory_run_sram_fw()
    device.factory_run_flash_fw()

    check_stop()
    emit("info", "=== 15. Load offline project ===")
    project = Path(project_path)
    if not project.is_file():
        raise FileNotFoundError("Offline project file not found: %s" % project)
    device.project_load(
        project_name,
        project.read_bytes(),
        progress=lambda p, t: report("Load project", p, t),
    )
    project_info = device.project_info()
    emit("info", "Project status: %s, %d bytes, CRC32=0x%08X" % (
        "valid" if project_info.active else "invalid",
        project_info.size, project_info.crc32))

    check_stop()
    emit("info", "=== 16. Start offline programming and poll status ===")
    device.offline_start()
    deadline = time.monotonic() + 120
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

    emit("info", "=== 17. Switch offline project ===")
    device.project_switch(project_name, reload=True)
    emit("info", "Full sample workflow complete.")
