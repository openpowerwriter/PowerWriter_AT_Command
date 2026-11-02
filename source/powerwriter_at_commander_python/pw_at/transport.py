# -*- coding: utf-8 -*-
"""
Serial transport for the PowerWriter AT client.

This module only handles raw byte I/O:
- a background reader thread forwards received bytes to ATChannel.feed();
- write() is serialized by a lock;
- the platform-specific work is delegated to pw_at.serial_backend.

Framing, CRC verification and AES decryption happen in the C core.
"""

from __future__ import annotations

import logging
import threading
from typing import Callable, Optional

from .serial_backend import (
    SerialPortInfo,
    list_serial_ports,
    open_backend,
    serial_available,
)

logger = logging.getLogger(__name__)

__all__ = [
    "SerialPortInfo",
    "SerialTransport",
    "list_serial_ports",
    "serial_available",
]


class SerialTransport:
    """Byte-stream transport over a serial port."""

    def __init__(
        self,
        port: str,
        baudrate: int,
        on_bytes: Callable[[bytes], None],
        on_error: Optional[Callable[[Exception], None]] = None,
    ) -> None:
        self.port = port
        self.baudrate = int(baudrate)
        self._on_bytes = on_bytes
        self._on_error = on_error
        self._write_lock = threading.Lock()
        self._running = True
        self._backend = open_backend(port, self.baudrate)
        self._thread = threading.Thread(
            target=self._reader_loop, name="pw-at-serial-reader", daemon=True
        )
        self._thread.start()

    @property
    def is_open(self) -> bool:
        return bool(self._running and self._backend.is_open)

    def write(self, data: bytes) -> None:
        if not self.is_open:
            raise IOError("Serial port is not open")
        with self._write_lock:
            self._backend.write(data)

    def set_baudrate(self, baudrate: int) -> None:
        self._backend.set_baudrate(int(baudrate))
        self.baudrate = int(baudrate)

    def close(self) -> None:
        if not self._running and not self._backend.is_open:
            return
        self._running = False
        try:
            self._backend.close()
        except Exception:
            pass
        if (
            self._thread.is_alive()
            and threading.current_thread() is not self._thread
        ):
            self._thread.join(timeout=1.0)

    def _reader_loop(self) -> None:
        while self._running:
            try:
                data = self._backend.read(0.05)
                if data:
                    self._on_bytes(data)
            except Exception as exc:
                if not self._running:
                    break
                self._running = False
                try:
                    self._backend.close()
                except Exception:
                    pass
                logger.debug("Serial read error: %s", exc)
                if self._on_error:
                    self._on_error(exc)
                break
