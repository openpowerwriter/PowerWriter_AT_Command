# -*- coding: utf-8 -*-
"""
Load and bind the PowerWriter AT C shared library with ctypes.

Platform selection:
    Windows : powerwriter_at.dll
    Linux   : libpowerwriter_at.so
    macOS   : libpowerwriter_at.dylib

Search order (POWERWRITER_AT_LIB may point to a file or directory):
    <project>/lib/<platform>/<arch>/
    <project>/lib/<platform>/
    <project>/lib/<arch>/
    <project>/lib/
    <project>/build/lib/Release/
    current working directory and its lib/

Protocol framing, CRC32, AES128-CBC and timeout handling are implemented by
the C core. This module only converts parameters and structures.
"""

from __future__ import annotations

import ctypes
import os
import platform
import sys
import threading
from ctypes import (
    CFUNCTYPE,
    POINTER,
    Structure,
    byref,
    c_char_p,
    c_int,
    c_int32,
    c_uint8,
    c_uint32,
    c_void_p,
    string_at,
)
from pathlib import Path
from typing import Callable, Iterable, List, Optional, Tuple

from .constants import ATError, describe_error
from .errors import ATLibraryLoadError, ATLibraryNotFound, PowerWriterATError
from .utils import resource_root
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

# ---------------------------------------------------------------------------
# Platform detection and library lookup
# ---------------------------------------------------------------------------
def platform_tag() -> str:
    if sys.platform.startswith("win"):
        return "windows"
    if sys.platform == "darwin":
        return "macos"
    if sys.platform.startswith("linux"):
        return "linux"
    return sys.platform.replace(" ", "_")


def arch_tags() -> List[str]:
    machine = (platform.machine() or "").lower()
    if machine in ("amd64", "x86_64"):
        return ["x64", "amd64", "x86_64"]
    if machine in ("arm64", "aarch64"):
        return ["arm64", "aarch64"]
    if machine in ("x86", "i386", "i486", "i586", "i686"):
        return ["x86", "win32"]
    return [machine] if machine else []


def library_names() -> List[str]:
    """Return candidate library names for this platform (arch-specific first)."""
    names: List[str] = []
    if sys.platform.startswith("win"):
        for arch in arch_tags():
            names.append("powerwriter_at_%s.dll" % arch)
        names.append("powerwriter_at.dll")
    elif sys.platform == "darwin":
        for arch in arch_tags():
            names.append("libpowerwriter_at_%s.dylib" % arch)
        names.extend(["libpowerwriter_at.dylib", "powerwriter_at.dylib"])
    else:
        for arch in arch_tags():
            names.append("libpowerwriter_at_%s.so" % arch)
        names.extend(["libpowerwriter_at.so", "powerwriter_at.so"])
    return names


def candidate_dirs() -> List[Path]:
    root = resource_root()
    dirs: List[Path] = []
    plat = platform_tag()
    for arch in arch_tags():
        dirs.append(root / "lib" / plat / arch)
    dirs.append(root / "lib" / plat)
    for arch in arch_tags():
        dirs.append(root / "lib" / arch)
    dirs.extend([
        root / "lib",
        root / "native" / plat,
        root / "build" / "lib" / "Release",
        root / "build" / "lib" / "Debug",
        root / "build" / "lib",
        Path.cwd(),
        Path.cwd() / "lib",
        Path.cwd() / "lib" / plat,
    ])
    # Remove duplicates while preserving order.
    unique: List[Path] = []
    seen = set()
    for d in dirs:
        key = str(d.resolve()) if d.exists() else str(d)
        if key not in seen:
            seen.add(key)
            unique.append(d)
    return unique


def _iter_library_files(explicit: Optional[str] = None) -> Iterable[Path]:
    names = library_names()
    env = explicit or os.environ.get("POWERWRITER_AT_LIB")
    if env:
        p = Path(env).expanduser()
        if p.is_file():
            yield p
            return
        if p.is_dir():
            for name in names:
                f = p / name
                if f.is_file():
                    yield f
            return
        # If the environment path does not exist, continue with the normal search.
        if p.suffix.lower() in (".dll", ".so", ".dylib"):
            yield p

    for directory in candidate_dirs():
        if not directory.is_dir():
            continue
        for name in names:
            f = directory / name
            if f.is_file():
                yield f


# ---------------------------------------------------------------------------
# ctypes structures (one-to-one with csrc/pwat_bridge.h, packed to 1 byte)
# ---------------------------------------------------------------------------
class WriterInfoStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("oem", c_uint8 * 8),
        ("sn", c_uint8 * 32),
        ("hardware_version", c_uint8 * 8),
        ("bootloader_version", c_uint8 * 8),
        ("interface_version", c_uint8 * 8),
    ]


class WriterConfigStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("target_vendor", c_uint8 * 16),
        ("target_series", c_uint8 * 16),
        ("target_model", c_uint8 * 16),
        ("erase_type", c_uint8),
        ("output_vext_type", c_uint8),
        ("clock_type", c_uint8),
        ("buzzer_enable", c_uint8),
        ("ob_update_type", c_uint8),
        ("limit_number_enable", c_uint8),
        ("limit_number", c_uint32),
        ("target_auto_enable", c_uint8),
        ("target_auto_in_debounce", ctypes.c_uint16),
        ("target_auto_out_debounce", ctypes.c_uint16),
        ("disable_power_ap", c_uint8),
        ("run_ap", c_uint8),
        ("power_on_debounce", ctypes.c_uint16),
        ("power_off_debounce", ctypes.c_uint16),
        ("reset_type", c_uint8),
    ]


class ChipIDStruct(Structure):
    _pack_ = 1
    _fields_ = [("size", c_uint8), ("data", c_uint8 * 16)]


class MemBlockStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("address", c_uint32),
        ("size", c_uint32),
        ("data", c_uint8 * 256),
    ]


class OptionByteStruct(Structure):
    _pack_ = 1
    _fields_ = [("size", c_uint32), ("data", c_uint8 * 1024)]


class ProjectInfoStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("activate", c_uint8),
        ("size", c_uint32),
        ("crc32", c_uint32),
    ]


class OfflineStatusStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("status", c_int32),
        ("total", c_uint32),
        ("processed", c_uint32),
        ("error", c_uint32),
    ]


class BroadcastStruct(Structure):
    _pack_ = 1
    _fields_ = [
        ("keep_frame", c_uint8),
        ("direction", c_int32),
        ("size", c_uint32),
        ("data", c_uint8 * 256),
    ]


WRITE_CB = CFUNCTYPE(c_int, c_void_p, POINTER(c_uint8), c_uint32, c_int)
EVENT_CB = CFUNCTYPE(None, c_void_p, c_int)
PROGRESS_CB = CFUNCTYPE(None, c_void_p, c_uint32, c_uint32)

# Structures must match csrc/pwat_bridge.h; a mismatch means the headers changed.
_EXPECTED_SIZES = {
    "WriterInfoStruct": (WriterInfoStruct, 64),
    "WriterConfigStruct": (WriterConfigStruct, 70),
    "ChipIDStruct": (ChipIDStruct, 17),
    "MemBlockStruct": (MemBlockStruct, 264),
    "OptionByteStruct": (OptionByteStruct, 1028),
    "ProjectInfoStruct": (ProjectInfoStruct, 9),
    "OfflineStatusStruct": (OfflineStatusStruct, 16),
    "BroadcastStruct": (BroadcastStruct, 265),
}
for _name, (_struct, _size) in _EXPECTED_SIZES.items():
    if ctypes.sizeof(_struct) != _size:
        raise ImportError(
            "Unexpected ctypes structure size for %s: %d != %d; check pwat_bridge.h"
            % (_name, ctypes.sizeof(_struct), _size)
        )


def _configure(lib: ctypes.CDLL) -> None:
    """Declare exported function signatures. Safe to call multiple times."""
    lib.pwat_version.argtypes = []
    lib.pwat_version.restype = c_uint32

    lib.pwat_create.argtypes = [c_int, WRITE_CB, EVENT_CB, c_void_p]
    lib.pwat_create.restype = c_void_p
    lib.pwat_destroy.argtypes = [c_void_p]
    lib.pwat_destroy.restype = None
    lib.pwat_feed.argtypes = [c_void_p, POINTER(c_uint8), c_uint32]
    lib.pwat_feed.restype = c_int
    lib.pwat_last_error.argtypes = [c_void_p]
    lib.pwat_last_error.restype = c_uint32

    lib.pwat_get_writer_info.argtypes = [c_void_p, POINTER(WriterInfoStruct)]
    lib.pwat_get_writer_info.restype = c_int
    lib.pwat_get_writer_config.argtypes = [c_void_p, POINTER(WriterConfigStruct)]
    lib.pwat_get_writer_config.restype = c_int
    lib.pwat_set_writer_config.argtypes = [c_void_p, POINTER(WriterConfigStruct)]
    lib.pwat_set_writer_config.restype = c_int
    lib.pwat_set_baudrate.argtypes = [c_void_p, c_uint32]
    lib.pwat_set_baudrate.restype = c_int

    lib.pwat_target_connect.argtypes = [c_void_p]
    lib.pwat_target_connect.restype = c_int
    lib.pwat_target_status.argtypes = [c_void_p]
    lib.pwat_target_status.restype = c_int
    lib.pwat_target_get_id.argtypes = [c_void_p, POINTER(ChipIDStruct)]
    lib.pwat_target_get_id.restype = c_int
    lib.pwat_target_read.argtypes = [c_void_p, c_uint32, c_uint32, POINTER(MemBlockStruct)]
    lib.pwat_target_read.restype = c_int
    lib.pwat_target_erase.argtypes = [c_void_p, c_int]
    lib.pwat_target_erase.restype = c_int
    lib.pwat_target_erase_sector.argtypes = [c_void_p, c_uint32, c_uint32, c_int]
    lib.pwat_target_erase_sector.restype = c_int
    lib.pwat_target_write_prepare.argtypes = [c_void_p, c_uint32]
    lib.pwat_target_write_prepare.restype = c_int
    lib.pwat_target_write.argtypes = [c_void_p, c_uint32, POINTER(c_uint8), c_uint32]
    lib.pwat_target_write.restype = c_int
    lib.pwat_target_read_ob.argtypes = [c_void_p, POINTER(OptionByteStruct)]
    lib.pwat_target_read_ob.restype = c_int
    lib.pwat_target_write_vendor_ob.argtypes = [c_void_p, c_int]
    lib.pwat_target_write_vendor_ob.restype = c_int
    lib.pwat_target_write_user_ob.argtypes = [c_void_p, c_int]
    lib.pwat_target_write_user_ob.restype = c_int
    lib.pwat_target_reset.argtypes = [c_void_p, c_uint32]
    lib.pwat_target_reset.restype = c_int

    lib.pwat_project_info.argtypes = [c_void_p, POINTER(ProjectInfoStruct)]
    lib.pwat_project_info.restype = c_int
    lib.pwat_project_disable.argtypes = [c_void_p]
    lib.pwat_project_disable.restype = c_int
    lib.pwat_project_load.argtypes = [
        c_void_p, c_char_p, c_char_p, POINTER(c_uint8), c_uint32,
        PROGRESS_CB, c_void_p,
    ]
    lib.pwat_project_load.restype = c_int
    lib.pwat_offline_start.argtypes = [c_void_p]
    lib.pwat_offline_start.restype = c_int
    lib.pwat_offline_status.argtypes = [c_void_p, POINTER(OfflineStatusStruct)]
    lib.pwat_offline_status.restype = c_int
    lib.pwat_project_switch.argtypes = [c_void_p, c_int, c_char_p, c_char_p]
    lib.pwat_project_switch.restype = c_int

    lib.pwat_broadcast.argtypes = [
        c_void_p, POINTER(c_uint8), c_uint32, c_int, c_int, c_int, c_int,
        POINTER(BroadcastStruct),
    ]
    lib.pwat_broadcast.restype = c_int
    lib.pwat_factory_run_sram_fw.argtypes = [c_void_p, c_int]
    lib.pwat_factory_run_sram_fw.restype = c_int
    lib.pwat_factory_run_flash_fw.argtypes = [c_void_p, c_int]
    lib.pwat_factory_run_flash_fw.restype = c_int


_library_cache: Optional[Tuple[ctypes.CDLL, Path]] = None
_library_lock = threading.Lock()


def load_library(explicit_path: Optional[str] = None,
                 force: bool = False) -> Tuple[ctypes.CDLL, Path]:
    """
    Load (and cache) the PowerWriter AT shared library.

    Returns (cdll, path). Raises ATLibraryNotFound when no candidate exists
    and ATLibraryLoadError when a file is found but cannot be loaded (for
    example, a 32/64-bit architecture mismatch).
    """
    global _library_cache
    with _library_lock:
        if _library_cache is not None and explicit_path is None and not force:
            return _library_cache

        tried: List[str] = []
        errors: List[str] = []
        for path in _iter_library_files(explicit_path):
            tried.append(str(path))
            if not path.is_file():
                continue
            try:
                lib = ctypes.CDLL(str(path))
                _configure(lib)
                version = lib.pwat_version()
            except (OSError, AttributeError) as exc:
                errors.append("%s: %s" % (path, exc))
                continue
            _library_cache = (lib, path)
            return _library_cache

        message = [
            "No usable PowerWriter AT shared library found (%s/%s)." %
            (platform_tag(), "/".join(arch_tags()) or "unknown"),
            "Build the C binding library first:",
            "  Windows: build_windows.bat",
            "  Linux  : ./build_linux.sh",
            "  macOS  : ./build_macos.sh",
            "Or set the POWERWRITER_AT_LIB environment variable to the library file.",
        ]
        if tried:
            message.append("Locations tried:")
            message.extend("  " + p for p in tried)
        if errors:
            message.append("Load errors:")
            message.extend("  " + e for e in errors)
        text = "\n".join(message)
        if errors:
            raise ATLibraryLoadError(text)
        raise ATLibraryNotFound(text)


# ---------------------------------------------------------------------------
# Conversion helpers
# ---------------------------------------------------------------------------
def _cstr(raw: bytes) -> str:
    raw = raw.split(b"\x00", 1)[0]
    try:
        return raw.decode("utf-8")
    except UnicodeDecodeError:
        return raw.decode("gb18030", "replace")


def _set_cstr(array, value: str, size: int) -> None:
    raw = value.encode("utf-8", "replace")[: size - 1]
    if raw:
        ctypes.memmove(array, raw, len(raw))


def _u8_buffer(data: bytes):
    return (c_uint8 * len(data)).from_buffer_copy(data)


# ---------------------------------------------------------------------------
# Bridge object
# ---------------------------------------------------------------------------
class Bridge:
    """
    Object-oriented wrapper around the C shared library.

    write_fn(frame: bytes, timeout_ms: int) -> bool is supplied by the caller
    and writes a complete AT frame to the serial port. event_fn(event: int)
    is optional and is used only for notifications.
    """

    def __init__(
        self,
        lib: ctypes.CDLL,
        encrypt: bool,
        write_fn: Callable[[bytes, int], bool],
        event_fn: Optional[Callable[[int], None]] = None,
        library_path: Optional[Path] = None,
    ) -> None:
        self.library = lib
        self.library_path: Optional[Path] = library_path
        self._write_fn = write_fn
        self._event_fn = event_fn
        self._progress_fn: Optional[Callable[[int, int], None]] = None

        # Keep callback references alive to prevent garbage collection.
        self._write_cb = WRITE_CB(self._on_write)
        self._event_cb = EVENT_CB(self._on_event)
        self._progress_cb = PROGRESS_CB(self._on_progress)

        self._handle = lib.pwat_create(
            1 if encrypt else 0, self._write_cb, self._event_cb, None
        )
        if not self._handle:
            raise PowerWriterATError(ATError.INITIAL_FAILED, "Failed to create AT channel")

    # ------------------------------------------------------------------
    def close(self) -> None:
        if self._handle:
            self.library.pwat_destroy(self._handle)
            self._handle = None

    def __enter__(self) -> "Bridge":
        return self

    def __exit__(self, exc_type, exc, tb) -> None:
        self.close()

    # ------------------------------------------------------------------
    # Callbacks
    # ------------------------------------------------------------------
    def _on_write(self, user, data, size, timeout_ms) -> int:
        try:
            frame = string_at(data, size)
            return 1 if self._write_fn(frame, int(timeout_ms)) else 0
        except Exception:
            return 0

    def _on_event(self, user, event) -> None:
        if self._event_fn:
            try:
                self._event_fn(int(event))
            except Exception:
                pass

    def _on_progress(self, user, total, processed) -> None:
        if self._progress_fn:
            try:
                self._progress_fn(int(total), int(processed))
            except Exception:
                pass

    # ------------------------------------------------------------------
    # Basic operations
    # ------------------------------------------------------------------
    def feed(self, data: bytes) -> None:
        """Feed received serial bytes to the C core for framing/parsing."""
        if not data or not self._handle:
            return
        buf = _u8_buffer(data)
        self.library.pwat_feed(self._handle, buf, len(data))

    def last_error(self) -> int:
        if not self._handle:
            return int(ATError.NULL_VALUE)
        return int(self.library.pwat_last_error(self._handle))

    def _check(self, ok: int, what: str = "") -> None:
        if ok:
            return
        code = self.last_error()
        if code == 0:
            code = int(ATError.CMD)
        description = describe_error(code)
        message = ("%s failed: %s" % (what, description)) if what else description
        raise PowerWriterATError(code, message)

    # ------------------------------------------------------------------
    # Writer information and configuration
    # ------------------------------------------------------------------
    def get_writer_info(self) -> WriterInfo:
        value = WriterInfoStruct()
        self._check(self.library.pwat_get_writer_info(self._handle, byref(value)),
                    "read writer info")
        return WriterInfo(
            oem=_cstr(bytes(value.oem)),
            sn=_cstr(bytes(value.sn)),
            hardware_version=_cstr(bytes(value.hardware_version)),
            bootloader_version=_cstr(bytes(value.bootloader_version)),
            interface_version=_cstr(bytes(value.interface_version)),
        )

    def get_writer_config(self) -> WriterConfig:
        value = WriterConfigStruct()
        self._check(self.library.pwat_get_writer_config(self._handle, byref(value)),
                    "read writer configuration")
        cfg = WriterConfig()
        cfg.target_vendor = _cstr(bytes(value.target_vendor))
        cfg.target_series = _cstr(bytes(value.target_series))
        cfg.target_model = _cstr(bytes(value.target_model))
        cfg.erase_type = value.erase_type
        cfg.output_vext_type = value.output_vext_type
        cfg.clock_type = value.clock_type
        cfg.buzzer_enable = value.buzzer_enable
        cfg.ob_update_type = value.ob_update_type
        cfg.limit_number_enable = value.limit_number_enable
        cfg.limit_number = value.limit_number
        cfg.target_auto_enable = value.target_auto_enable
        cfg.target_auto_in_debounce = value.target_auto_in_debounce
        cfg.target_auto_out_debounce = value.target_auto_out_debounce
        cfg.disable_power_ap = value.disable_power_ap
        cfg.run_ap = value.run_ap
        cfg.power_on_debounce = value.power_on_debounce
        cfg.power_off_debounce = value.power_off_debounce
        cfg.reset_type = value.reset_type
        return cfg

    def set_writer_config(self, cfg: WriterConfig) -> None:
        value = WriterConfigStruct()
        _set_cstr(value.target_vendor, cfg.target_vendor, 16)
        _set_cstr(value.target_series, cfg.target_series, 16)
        _set_cstr(value.target_model, cfg.target_model, 16)
        value.erase_type = cfg.erase_type & 0xFF
        value.output_vext_type = cfg.output_vext_type & 0xFF
        value.clock_type = cfg.clock_type & 0xFF
        value.buzzer_enable = cfg.buzzer_enable & 0xFF
        value.ob_update_type = cfg.ob_update_type & 0xFF
        value.limit_number_enable = cfg.limit_number_enable & 0xFF
        value.limit_number = cfg.limit_number & 0xFFFFFFFF
        value.target_auto_enable = cfg.target_auto_enable & 0xFF
        value.target_auto_in_debounce = cfg.target_auto_in_debounce & 0xFFFF
        value.target_auto_out_debounce = cfg.target_auto_out_debounce & 0xFFFF
        value.disable_power_ap = cfg.disable_power_ap & 0xFF
        value.run_ap = cfg.run_ap & 0xFF
        value.power_on_debounce = cfg.power_on_debounce & 0xFFFF
        value.power_off_debounce = cfg.power_off_debounce & 0xFFFF
        value.reset_type = cfg.reset_type & 0xFF
        self._check(self.library.pwat_set_writer_config(self._handle, byref(value)),
                    "write writer configuration")

    def set_baudrate(self, baudrate: int) -> None:
        self._check(self.library.pwat_set_baudrate(self._handle, baudrate),
                    "set AT baud rate")

    # ------------------------------------------------------------------
    # Online operations
    # ------------------------------------------------------------------
    def target_connect(self) -> None:
        self._check(self.library.pwat_target_connect(self._handle), "connect target chip")

    def target_status(self) -> bool:
        return bool(self.library.pwat_target_status(self._handle))

    def target_get_id(self) -> TargetChipID:
        value = ChipIDStruct()
        self._check(self.library.pwat_target_get_id(self._handle, byref(value)),
                    "read target chip ID")
        size = min(value.size, 16)
        return TargetChipID(data=bytes(value.data[:size]))

    def target_read(self, address: int, size: int) -> MemoryBlock:
        value = MemBlockStruct()
        self._check(self.library.pwat_target_read(
            self._handle, address, size, byref(value)), "read target memory")
        size = min(value.size, 256)
        return MemoryBlock(address=value.address, data=bytes(value.data[:size]))

    def target_erase(self, timeout_ms: int) -> None:
        self._check(self.library.pwat_target_erase(self._handle, timeout_ms),
                    "erase target chip")

    def target_erase_sector(self, address: int, size: int, timeout_ms: int) -> None:
        self._check(self.library.pwat_target_erase_sector(
            self._handle, address, size, timeout_ms), "erase target sector")

    def target_write_prepare(self, total: int) -> None:
        self._check(self.library.pwat_target_write_prepare(self._handle, total),
                    "prepare to write target memory")

    def target_write(self, address: int, data: bytes) -> None:
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Write data is empty")
        buf = _u8_buffer(data[:256])
        self._check(self.library.pwat_target_write(
            self._handle, address, buf, len(buf)), "write target memory")

    def target_read_ob(self) -> OptionByte:
        value = OptionByteStruct()
        self._check(self.library.pwat_target_read_ob(self._handle, byref(value)),
                    "read target OptionByte")
        size = min(value.size, 1024)
        return OptionByte(data=bytes(value.data[:size]))

    def target_write_vendor_ob(self, timeout_ms: int) -> None:
        self._check(self.library.pwat_target_write_vendor_ob(self._handle, timeout_ms),
                    "write vendor default OptionByte")

    def target_write_user_ob(self, timeout_ms: int) -> None:
        self._check(self.library.pwat_target_write_user_ob(self._handle, timeout_ms),
                    "write user OptionByte")

    def target_reset(self, reset_type: int) -> None:
        self._check(self.library.pwat_target_reset(self._handle, reset_type),
                    "reset target chip")

    # ------------------------------------------------------------------
    # Offline project
    # ------------------------------------------------------------------
    def project_info(self) -> ProjectInfo:
        value = ProjectInfoStruct()
        self._check(self.library.pwat_project_info(self._handle, byref(value)),
                    "read offline project info")
        return ProjectInfo(activate=value.activate, size=value.size, crc32=value.crc32)

    def project_disable(self) -> None:
        self._check(self.library.pwat_project_disable(self._handle), "disable offline project")

    def project_load(
        self,
        name: bytes,
        password: bytes,
        data: bytes,
        progress: Optional[Callable[[int, int], None]] = None,
    ) -> None:
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Project file is empty")
        buf = _u8_buffer(data)
        self._progress_fn = progress
        try:
            self._check(self.library.pwat_project_load(
                self._handle,
                c_char_p(name),
                c_char_p(password),
                buf,
                len(data),
                self._progress_cb if progress else PROGRESS_CB(),
                None,
            ), "load offline project")
        finally:
            self._progress_fn = None

    def offline_start(self) -> None:
        self._check(self.library.pwat_offline_start(self._handle), "start offline write")

    def offline_status(self) -> OfflineStatus:
        value = OfflineStatusStruct()
        ok = self.library.pwat_offline_status(self._handle, byref(value))
        if not ok:
            code = self.last_error()
            if code == 0:
                code = int(ATError.CMD)
            raise PowerWriterATError(code, "Failed to query offline write status")
        try:
            state = OfflineState(value.status)
        except ValueError:
            state = OfflineState.UNKNOWN
        progress = None
        if state == OfflineState.PROGRESS:
            progress = StatusProgress(total=value.total, processed=value.processed)
        return OfflineStatus(state=state, progress=progress, error_code=value.error)

    def project_switch(self, name: bytes, password: bytes, reload_type: int) -> None:
        self._check(self.library.pwat_project_switch(
            self._handle, reload_type, c_char_p(name), c_char_p(password)),
            "switch offline project")

    # ------------------------------------------------------------------
    # Broadcast and factory test
    # ------------------------------------------------------------------
    def broadcast(
        self,
        data: bytes,
        direction: int,
        keep_frame: bool,
        wait_rsp: bool,
        timeout_ms: int,
    ) -> Optional[BroadcastResponse]:
        if not data:
            raise PowerWriterATError(ATError.SIZE, "Broadcast data is empty")
        buf = _u8_buffer(data[:256])
        response = BroadcastStruct()
        self._check(self.library.pwat_broadcast(
            self._handle, buf, len(buf), int(direction),
            1 if keep_frame else 0, 1 if wait_rsp else 0,
            int(timeout_ms), byref(response)), "send broadcast")
        if not wait_rsp:
            return None
        size = min(response.size, 256)
        return BroadcastResponse(
            keep_frame=response.keep_frame,
            direction=response.direction,
            data=bytes(response.data[:size]),
        )

    def factory_run_sram_fw(self, timeout_ms: int) -> None:
        self._check(self.library.pwat_factory_run_sram_fw(self._handle, timeout_ms),
                    "run factory SRAM firmware")

    def factory_run_flash_fw(self, timeout_ms: int) -> None:
        self._check(self.library.pwat_factory_run_flash_fw(self._handle, timeout_ms),
                    "run factory Flash firmware")
