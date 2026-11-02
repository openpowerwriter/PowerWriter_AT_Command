# -*- coding: utf-8 -*-
"""Formatting helpers shared by the CLI and GUI (protocol independent)."""

from __future__ import annotations

import sys
from pathlib import Path


def resource_root() -> Path:
    """
    Return the root directory that contains the ``lib/`` and ``assets/`` folders.

    For a normal source checkout this is the project directory. For a
    PyInstaller one-file bundle it is the temporary extraction directory
    (``sys._MEIPASS``).
    """
    bundle_root = getattr(sys, "_MEIPASS", None)
    if bundle_root:
        return Path(bundle_root)
    return Path(__file__).resolve().parent.parent


def hexdump(data: bytes, base: int = 0, width: int = 16) -> str:
    """Return a classic hexadecimal + ASCII dump."""
    lines = []
    for offset in range(0, len(data), width):
        chunk = data[offset:offset + width]
        hex_part = " ".join("%02X" % b for b in chunk).ljust(width * 3 - 1)
        ascii_part = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        lines.append("%08X  %s  |%s|" % (base + offset, hex_part, ascii_part))
    return "\n".join(lines)


def format_bytes(data: bytes, encoding: str = "utf-8") -> str:
    """Try to display response data as text; fall back to a hex dump."""
    try:
        return data.decode(encoding)
    except UnicodeDecodeError:
        return hexdump(data)
