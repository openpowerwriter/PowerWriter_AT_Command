# -*- coding: utf-8 -*-
"""
pw_at - Python binding for the PowerWriter AT interface.

Architecture:
    Python (ctypes) -> libpowerwriter_at (C bridge + powerwriter_at_core)
                    -> serial port (standard-library backend)

AT framing, CRC32, AES128-CBC and timeout handling are all provided by the C
core. Python only handles serial I/O, the CLI/GUI and parameter conversion.
"""

from .client import PowerWriterAT
from .constants import (
    ATError,
    BroadcastDir,
    ClockType,
    EraseType,
    OBUpdateType,
    OutputVext,
    ResetType,
    SwitchReloadType,
    describe_error,
)
from .errors import ATLibraryLoadError, ATLibraryNotFound, PowerWriterATError
from .ffi import Bridge, arch_tags, library_names, load_library, platform_tag
from .models import (
    BroadcastResponse,
    MemoryBlock,
    OfflineState,
    OfflineStatus,
    OptionByte,
    ProjectInfo,
    StatusProgress,
    TargetChipID,
    WriterConfig,
    WriterInfo,
)
from .transport import list_serial_ports, serial_available

__version__ = "1.0.0"

__all__ = [
    "__version__",
    "PowerWriterAT",
    "PowerWriterATError",
    "ATLibraryNotFound",
    "ATLibraryLoadError",
    "ATError",
    "BroadcastDir",
    "ClockType",
    "EraseType",
    "OutputVext",
    "OBUpdateType",
    "ResetType",
    "SwitchReloadType",
    "describe_error",
    "WriterInfo",
    "WriterConfig",
    "TargetChipID",
    "ProjectInfo",
    "StatusProgress",
    "OfflineStatus",
    "OfflineState",
    "MemoryBlock",
    "OptionByte",
    "BroadcastResponse",
    "Bridge",
    "load_library",
    "library_names",
    "platform_tag",
    "arch_tags",
    "list_serial_ports",
    "serial_available",
]
