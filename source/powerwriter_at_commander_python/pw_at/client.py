# -*- coding: utf-8 -*-
"""
PowerWriter AT client.

This class is an object-oriented wrapper around the ctypes bridge:
- opens/closes a serial port or a custom transport;
- exposes high-level methods mirroring powerwriter_at_api.h;
- provides chunked I/O, file-name encoding and progress callbacks.

AT framing, CRC32, AES128-CBC and timeout handling are implemented by the
C core library.
"""

from __future__ import annotations

import logging
import struct
import threading
import time
from typing import Callable, List, Optional, Union

from .constants import (
    ATError,
    PW_AT_DEFAULT_BAUDRATE,
    PW_MAX_FILE_NAME,
    PW_PACKAGE_SIZE,
    PW_PROJECT_PWD_SIZE,
    BroadcastDir,
    ResetType,
    SwitchReloadType,
    describe_error,
)
from .errors import PowerWriterATError
from .ffi import Bridge, load_library
from .models import (
    BroadcastResponse,
    MemoryBlock,
    OfflineStatus,
    OptionByte,
    ProjectInfo,
    TargetChipID,
    WriterConfig,
    WriterInfo,
)

logger = logging.getLogger(__name__)

LogCallback = Callable[[str, str], None]       # (level, message)
ProgressCallback = Callable[[int, int], None]  # (processed, total)

_LOG_LEVELS = {
    "debug": logging.DEBUG,
    "info": logging.INFO,
    "warn": logging.WARNING,
    "error": logging.ERROR,
}


class PowerWriterAT:
    """PowerWriter AT client."""

    def __init__(
        self,
        encrypt: bool = False,
        log: Optional[LogCallback] = None,
    ) -> None:
        self.encrypt = bool(encrypt)
        self.writer_info: Optional[WriterInfo] = None
        self.port: Optional[str] = None
        self.baudrate = PW_AT_DEFAULT_BAUDRATE

        self._log_cb = log
        self._lib = None
        self._bridge: Optional[Bridge] = None
        self._transport = None
        self._library_path = None
        self._op_lock = threading.RLock()

    # ------------------------------------------------------------------
    # Lifecycle
    # ------------------------------------------------------------------
    def __enter__(self) -> "PowerWriterAT":
        return self

    def __exit__(self, exc_type, exc, tb) -> None:
        self.close()

    @property
    def is_open(self) -> bool:
        return bool(
            self._bridge is not None and
            self._transport is not None and
            self._transport.is_open
        )

    @property
    def library_path(self):
        """Path of the loaded shared library (None before connecting)."""
        return self._library_path

    @property
    def library_version(self) -> int:
        """ABI version of the C binding library."""
        if self._lib is None:
            return 0
        return int(self._lib.pwat_version())

    def open_serial(
        self,
        port: str,
        baudrate: int = PW_AT_DEFAULT_BAUDRATE,
        on_error: Optional[Callable[[Exception], None]] = None,
    ) -> None:
        """Open a serial port. USB-CDC ignores baud rate; hardware UART defaults to 9600."""
        from .transport import SerialTransport

        with self._op_lock:
            self._open_transport(
                lambda feed: SerialTransport(port, baudrate, feed, on_error),
                "serial port %s @ %d" % (port, baudrate),
            )
            self.port = port
            self.baudrate = int(baudrate)

    def open_transport(
        self,
        factory: Callable[[Callable[[bytes], None]], object],
        description: str = "custom transport",
    ) -> None:
        """
        Use a custom transport (Bluetooth, TCP-to-serial, a test stub, ...).

        factory receives a feed(bytes) callback and returns a transport with:
        write(data), close(), an is_open property and optional set_baudrate(baud).
        """
        with self._op_lock:
            self._open_transport(factory, description)

    def _open_transport(self, factory, description: str) -> None:
        self.close()
        lib, path = load_library()
        self._lib = lib
        self._library_path = path

        bridge = Bridge(
            lib,
            self.encrypt,
            self._write_frame,
            self._on_event,
            library_path=path,
        )
        self._bridge = bridge
        try:
            self._transport = factory(bridge.feed)
        except Exception as exc:
            bridge.close()
            self._bridge = None
            raise PowerWriterATError(
                ATError.PORT, "Failed to open %s: %s" % (description, exc)
            ) from exc
        self._log("info", "Opened %s (C library: %s)" % (description, path))

    def close(self) -> None:
        with self._op_lock:
            if self._transport is not None:
                try:
                    self._transport.close()
                except Exception:
                    pass
            self._transport = None
            if self._bridge is not None:
                self._bridge.close()
            self._bridge = None

    # ------------------------------------------------------------------
    # Logging and callbacks
    # ------------------------------------------------------------------
    def _log(self, level: str, message: str) -> None:
        if self._log_cb:
            try:
                self._log_cb(level, message)
            except Exception:
                pass
        else:
            logger.log(_LOG_LEVELS.get(level, logging.INFO), message)

    def _write_frame(self, frame: bytes, timeout_ms: int) -> bool:
        transport = self._transport
        if transport is None or not transport.is_open:
            raise IOError("Transport is not open")
        command = -1
        if len(frame) >= 12:
            command = struct.unpack_from("<i", frame, 8)[0]
        self._log("debug", "TX AT frame %d bytes (cmd=0x%08X)"
                  % (len(frame), command & 0xFFFFFFFF))
        if command == 0xCA and len(frame) >= 295:
            # Debug-only view of the LoadProject header.
            size, crc = struct.unpack_from("<II", frame, 32)
            name = frame[40:295].split(b"\x00", 1)[0]
            self._log("debug",
                      "LoadProject header: password=%s size=%d crc=0x%08X name=%r"
                      % (frame[16:32].hex(), size, crc, name))
        transport.write(frame)
        return True

    def _on_event(self, event: int) -> None:
        if event == 2:
            self._log("debug", "AT event: communication error")
        elif event == 1:
            self._log("debug", "AT event: command received")
        else:
            self._log("debug", "AT event: %d" % event)

    def _require_open(self) -> None:
        if not self.is_open or self._bridge is None:
            raise PowerWriterATError(ATError.PORT, "Device is not connected")

    @property
    def last_error(self) -> int:
        if self._bridge is not None:
            return self._bridge.last_error()
        return int(ATError.NONE)

    @property
    def last_error_text(self) -> str:
        return describe_error(self.last_error)

    # ------------------------------------------------------------------
    # Writer information and configuration
    # ------------------------------------------------------------------
    def get_writer_info(self) -> WriterInfo:
        with self._op_lock:
            self._require_open()
            info = self._bridge.get_writer_info()
            self.writer_info = info
            self._log("info", "Writer info: %s" % info)
            return info

    def get_writer_config(self) -> WriterConfig:
        with self._op_lock:
            self._require_open()
            cfg = self._bridge.get_writer_config()
            self._log("info", "Read writer configuration")
            return cfg

    def set_writer_config(self, cfg: WriterConfig) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.set_writer_config(cfg)
            self._log("info", "Writer configuration updated")

    def set_baudrate(self, baudrate: int) -> None:
        """Change the device AT baud rate and switch the host port to match."""
        with self._op_lock:
            self._require_open()
            self._bridge.set_baudrate(baudrate)
            # The device replies at the old baud rate, then switches.
            time.sleep(0.1)
            self._transport.set_baudrate(baudrate)
            self.baudrate = int(baudrate)
            self._log("info", "AT baud rate switched to %d" % baudrate)

    # ------------------------------------------------------------------
    # Online operations
    # ------------------------------------------------------------------
    def target_connect(self) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_connect()
            self._log("info", "Sent target chip connect command")

    def target_status(self) -> bool:
        """Return whether the target is connected; on failure last_error is TARGET_CONNECT."""
        with self._op_lock:
            self._require_open()
            return self._bridge.target_status()

    def target_get_id(self) -> TargetChipID:
        with self._op_lock:
            self._require_open()
            cid = self._bridge.target_get_id()
            self._log("info", "Target chip ID: %s" % cid.hex)
            return cid

    def target_read_block(self, address: int, size: int) -> MemoryBlock:
        """Single read request, at most 256 bytes."""
        with self._op_lock:
            self._require_open()
            return self._bridge.target_read(address, min(size, PW_PACKAGE_SIZE))

    def target_read(
        self,
        address: int,
        size: int,
        progress: Optional[ProgressCallback] = None,
    ) -> bytes:
        """Read arbitrary-length target memory in 256-byte chunks."""
        with self._op_lock:
            self._require_open()
            if size <= 0:
                return b""
            out = bytearray()
            while len(out) < size:
                chunk_size = min(PW_PACKAGE_SIZE, size - len(out))
                block = self._bridge.target_read(address + len(out), chunk_size)
                if not block.data:
                    raise PowerWriterATError(
                        ATError.TARGET_READ, "Device returned 0 bytes of data"
                    )
                out.extend(block.data)
                if progress:
                    progress(len(out), size)
            return bytes(out)

    def target_erase(self, timeout_ms: int = 10000) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_erase(timeout_ms)
            self._log("info", "Target chip erase complete")

    def target_erase_sector(
        self, address: int, size: int, timeout_ms: int = 10000
    ) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_erase_sector(address, size, timeout_ms)
            self._log("info", "Target sector erase complete: 0x%08X+0x%X" % (address, size))

    def target_write_prepare(self, total: int) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_write_prepare(total)

    def target_write_block(self, address: int, data: bytes) -> None:
        """Single write request, at most 256 bytes."""
        with self._op_lock:
            self._require_open()
            self._bridge.target_write(address, data[:PW_PACKAGE_SIZE])

    def target_write(
        self,
        address: int,
        data: bytes,
        prepare: bool = True,
        progress: Optional[ProgressCallback] = None,
    ) -> None:
        """Write target memory in chunks; sends write-prepare first by default."""
        data = bytes(data)
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Write data is empty")
        with self._op_lock:
            self._require_open()
            if prepare:
                self._bridge.target_write_prepare(len(data))
            sent = 0
            while sent < len(data):
                chunk = data[sent:sent + PW_PACKAGE_SIZE]
                self._bridge.target_write(address + sent, chunk)
                sent += len(chunk)
                if progress:
                    progress(sent, len(data))
            self._log("info", "Write complete: 0x%08X, %d bytes" % (address, len(data)))

    def target_read_ob(self) -> OptionByte:
        with self._op_lock:
            self._require_open()
            ob = self._bridge.target_read_ob()
            self._log("info", "Read target OptionByte (%d bytes)" % len(ob.data))
            return ob

    def target_write_vendor_ob(self, timeout_ms: int = 5000) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_write_vendor_ob(timeout_ms)
            self._log("info", "Wrote vendor default OptionByte")

    def target_write_user_ob(self, timeout_ms: int = 5000) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_write_user_ob(timeout_ms)
            self._log("info", "Wrote user OptionByte")

    def target_reset(
        self, reset_type: Union[int, ResetType] = ResetType.HW_CORE_RESET
    ) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.target_reset(int(reset_type))
            self._log("info", "Sent target reset command (type=%d)" % int(reset_type))

    # ------------------------------------------------------------------
    # Offline project
    # ------------------------------------------------------------------
    def project_info(self) -> ProjectInfo:
        with self._op_lock:
            self._require_open()
            info = self._bridge.project_info()
            self._log("info", "Offline project: %s, %d bytes, CRC32=0x%08X" % (
                "active" if info.active else "inactive", info.size, info.crc32))
            return info

    def project_disable(self) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.project_disable()
            self._log("info", "Offline project disabled")

    def _resolve_name_encoding(self, name_encoding: Optional[str]) -> str:
        if name_encoding and name_encoding.lower() not in ("auto", ""):
            enc = name_encoding.lower()
            if enc in ("gbk", "gb2312", "gb18030"):
                return "gb18030"
            return "utf-8"
        if self.writer_info is None:
            try:
                self.get_writer_info()
            except PowerWriterATError:
                pass
        # PWX1 uses UTF-8 file names; PW200/PW300 use GB2312/GBK.
        if self.writer_info and self.writer_info.oem.upper().startswith("PWX1"):
            return "utf-8"
        return "gb18030"

    def _encode_filename(self, name: str, name_encoding: Optional[str]) -> bytes:
        enc = self._resolve_name_encoding(name_encoding)
        raw = name.encode(enc, "replace")[:PW_MAX_FILE_NAME - 1]
        return raw.split(b"\x00", 1)[0]

    @staticmethod
    def _encode_password(password: str) -> bytes:
        raw = (password or "").encode("utf-8").split(b"\x00", 1)[0]
        if len(raw) > PW_PROJECT_PWD_SIZE:
            raise PowerWriterATError(
                ATError.KEY, "Project password too long: at most %d bytes" % PW_PROJECT_PWD_SIZE
            )
        return raw

    def project_load(
        self,
        name: str,
        data: bytes,
        password: str = "",
        progress: Optional[ProgressCallback] = None,
        name_encoding: Optional[str] = None,
    ) -> None:
        """Load an offline project into the PowerWriter."""
        data = bytes(data)
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Project file is empty")
        with self._op_lock:
            self._require_open()
            name_bytes = self._encode_filename(name, name_encoding)
            password_bytes = self._encode_password(password)
            wrapped = None
            if progress:
                wrapped = lambda total, processed: progress(processed, total)
            self._bridge.project_load(name_bytes, password_bytes, data, wrapped)
            self._log("info", "Offline project loaded: %s (%d bytes)" % (name, len(data)))

    def project_switch(
        self,
        name: str,
        password: str = "",
        reload: bool = False,
        name_encoding: Optional[str] = None,
    ) -> None:
        with self._op_lock:
            self._require_open()
            reload_type = SwitchReloadType.RELOAD if reload else SwitchReloadType.RESUME
            self._bridge.project_switch(
                self._encode_filename(name, name_encoding),
                self._encode_password(password),
                int(reload_type),
            )
            self._log("info", "Switched offline project: %s" % name)

    def offline_start(self) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.offline_start()
            self._log("info", "Offline write started")

    def offline_status(self) -> OfflineStatus:
        with self._op_lock:
            self._require_open()
            return self._bridge.offline_status()

    # ------------------------------------------------------------------
    # Broadcast and factory test
    # ------------------------------------------------------------------
    def broadcast(
        self,
        data: bytes,
        direction: Union[int, BroadcastDir] = BroadcastDir.CDC2UART,
        keep_frame: bool = False,
        wait_rsp: bool = False,
        timeout_ms: int = 5000,
    ) -> Optional[BroadcastResponse]:
        data = bytes(data)
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Broadcast data is empty")
        with self._op_lock:
            self._require_open()
            response = None
            packets = 0
            for offset in range(0, len(data), PW_PACKAGE_SIZE):
                chunk = data[offset:offset + PW_PACKAGE_SIZE]
                response = self._bridge.broadcast(
                    chunk, int(direction), keep_frame, wait_rsp, timeout_ms
                )
                packets += 1
                if wait_rsp and response is None:
                    return None
            self._log("info", "Broadcast sent: %d bytes (%d packets)" % (len(data), packets))
            return response

    def factory_run_sram_fw(self, timeout_ms: int = 5000) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.factory_run_sram_fw(timeout_ms)
            self._log("info", "Ran factory SRAM firmware")

    def factory_run_flash_fw(self, timeout_ms: int = 5000) -> None:
        with self._op_lock:
            self._require_open()
            self._bridge.factory_run_flash_fw(timeout_ms)
            self._log("info", "Ran factory Flash firmware")
