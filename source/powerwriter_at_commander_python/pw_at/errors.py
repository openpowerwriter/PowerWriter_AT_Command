# -*- coding: utf-8 -*-
"""Exceptions raised by the PowerWriter AT Python binding."""

from __future__ import annotations

from typing import Optional

from .constants import ATError, describe_error, error_name


class PowerWriterATError(Exception):
    """A device communication error or an error returned by the device."""

    def __init__(self, code: int, message: Optional[str] = None) -> None:
        self.code = int(code)
        try:
            self.error = ATError(self.code)
        except ValueError:
            self.error = None
        if message is None:
            message = describe_error(self.code)
        self.detail = message
        super().__init__(
            "%s: %s (0x%08X)" % (error_name(self.code), message, self.code & 0xFFFFFFFF)
        )


class ATLibraryNotFound(RuntimeError):
    """No usable PowerWriter AT shared library could be found."""


class ATLibraryLoadError(RuntimeError):
    """A library file exists but cannot be loaded (for example, wrong architecture)."""
