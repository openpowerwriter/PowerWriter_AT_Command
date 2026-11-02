# -*- coding: utf-8 -*-
"""
Standard-library serial port backend.

No third-party dependency is required at runtime:

- Windows: Win32 API through ctypes (CreateFileW / ReadFile / WriteFile / DCB)
- Linux/macOS: POSIX termios + select

Only 8N1 framing is supported, which is what the PowerWriter AT interface uses.
"""

from __future__ import annotations

import os
import re
import sys
import threading
import time
from dataclasses import dataclass
from typing import List, Optional

# USB identifiers used by PowerWriter devices. VID 0x0D28 is the ARM/DAPLink
# vendor ID; the PowerWriter CDC interface uses PID 0x0204. Additional models
# can be added through POWERWRITER_VID_PID="VID:PID,VID:PID".
POWERWRITER_VID_PID = {(0x0D28, 0x0204)}
POWERWRITER_KEYWORDS = ("powerwriter", "icworkshop")


def _load_vid_pid_environment() -> None:
    raw = os.environ.get("POWERWRITER_VID_PID", "")
    for item in raw.split(","):
        item = item.strip().replace("0x", "")
        if not item or ":" not in item:
            continue
        try:
            vid_text, pid_text = item.split(":", 1)
            POWERWRITER_VID_PID.add((int(vid_text, 16), int(pid_text, 16)))
        except ValueError:
            pass


_load_vid_pid_environment()


@dataclass
class SerialPortInfo:
    """A serial port entry with optional USB VID/PID information."""

    device: str
    description: str = ""
    hwid: str = ""
    vid: Optional[int] = None
    pid: Optional[int] = None

    @property
    def vid_pid(self) -> str:
        if self.vid is None or self.pid is None:
            return ""
        return "%04X:%04X" % (self.vid, self.pid)

    @property
    def is_powerwriter(self) -> bool:
        """Best-effort PowerWriter detection by VID/PID or description."""
        if self.vid is not None and self.pid is not None:
            if (self.vid, self.pid) in POWERWRITER_VID_PID:
                return True
        text = ("%s %s" % (self.description, self.hwid)).lower()
        return any(keyword in text for keyword in POWERWRITER_KEYWORDS)

    def __str__(self) -> str:
        parts = [self.device]
        if self.description:
            parts.append(self.description)
        if self.vid_pid:
            parts.append("VID:PID=%s" % self.vid_pid)
        if self.is_powerwriter:
            parts.append("[PowerWriter]")
        return " - ".join(parts)


def serial_available() -> bool:
    """The standard-library backend is always available."""
    return True


# ===========================================================================
# Windows backend
# ===========================================================================
if sys.platform.startswith("win"):
    import ctypes
    import winreg
    from ctypes import wintypes as _w

    _kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)

    _GENERIC_READ = 0x80000000
    _GENERIC_WRITE = 0x40000000
    _OPEN_EXISTING = 3
    _FILE_ATTRIBUTE_NORMAL = 0x80
    _INVALID_HANDLE_VALUE = ctypes.c_void_p(-1).value
    _PURGE_TXCLEAR = 0x0004
    _PURGE_RXCLEAR = 0x0008
    _ERROR_OPERATION_ABORTED = 995
    _ERROR_INVALID_HANDLE = 6
    _MAXDWORD = 0xFFFFFFFF

    class _DCB(ctypes.Structure):
        """Win32 DCB structure (device control block)."""

        _fields_ = [
            ("DCBlength", _w.DWORD),
            ("BaudRate", _w.DWORD),
            ("fBinary", _w.DWORD, 1),
            ("fParity", _w.DWORD, 1),
            ("fOutxCtsFlow", _w.DWORD, 1),
            ("fOutxDsrFlow", _w.DWORD, 1),
            ("fDtrControl", _w.DWORD, 2),
            ("fDsrSensitivity", _w.DWORD, 1),
            ("fTXContinueOnXoff", _w.DWORD, 1),
            ("fOutX", _w.DWORD, 1),
            ("fInX", _w.DWORD, 1),
            ("fErrorChar", _w.DWORD, 1),
            ("fNull", _w.DWORD, 1),
            ("fRtsControl", _w.DWORD, 2),
            ("fAbortOnError", _w.DWORD, 1),
            ("fDummy2", _w.DWORD, 17),
            ("wReserved", _w.WORD),
            ("XonLim", _w.WORD),
            ("XoffLim", _w.WORD),
            ("ByteSize", _w.BYTE),
            ("Parity", _w.BYTE),
            ("StopBits", _w.BYTE),
            ("XonChar", ctypes.c_char),
            ("XoffChar", ctypes.c_char),
            ("ErrorChar", ctypes.c_char),
            ("EofChar", ctypes.c_char),
            ("EvtChar", ctypes.c_char),
            ("wReserved1", _w.WORD),
        ]

    class _COMMTIMEOUTS(ctypes.Structure):
        _fields_ = [
            ("ReadIntervalTimeout", _w.DWORD),
            ("ReadTotalTimeoutMultiplier", _w.DWORD),
            ("ReadTotalTimeoutConstant", _w.DWORD),
            ("WriteTotalTimeoutMultiplier", _w.DWORD),
            ("WriteTotalTimeoutConstant", _w.DWORD),
        ]

    _kernel32.CreateFileW.argtypes = [
        _w.LPCWSTR, _w.DWORD, _w.DWORD, _w.LPVOID,
        _w.DWORD, _w.DWORD, _w.HANDLE,
    ]
    _kernel32.CreateFileW.restype = _w.HANDLE
    _kernel32.CloseHandle.argtypes = [_w.HANDLE]
    _kernel32.CloseHandle.restype = _w.BOOL
    _kernel32.ReadFile.argtypes = [
        _w.HANDLE, ctypes.c_void_p, _w.DWORD,
        ctypes.POINTER(_w.DWORD), ctypes.c_void_p,
    ]
    _kernel32.ReadFile.restype = _w.BOOL
    _kernel32.WriteFile.argtypes = [
        _w.HANDLE, ctypes.c_void_p, _w.DWORD,
        ctypes.POINTER(_w.DWORD), ctypes.c_void_p,
    ]
    _kernel32.WriteFile.restype = _w.BOOL
    _kernel32.GetCommState.argtypes = [_w.HANDLE, ctypes.POINTER(_DCB)]
    _kernel32.GetCommState.restype = _w.BOOL
    _kernel32.SetCommState.argtypes = [_w.HANDLE, ctypes.POINTER(_DCB)]
    _kernel32.SetCommState.restype = _w.BOOL
    _kernel32.SetCommTimeouts.argtypes = [_w.HANDLE, ctypes.POINTER(_COMMTIMEOUTS)]
    _kernel32.SetCommTimeouts.restype = _w.BOOL
    _kernel32.SetupComm.argtypes = [_w.HANDLE, _w.DWORD, _w.DWORD]
    _kernel32.SetupComm.restype = _w.BOOL
    _kernel32.PurgeComm.argtypes = [_w.HANDLE, _w.DWORD]
    _kernel32.PurgeComm.restype = _w.BOOL
    _kernel32.FlushFileBuffers.argtypes = [_w.HANDLE]
    _kernel32.FlushFileBuffers.restype = _w.BOOL
    try:
        _kernel32.CancelIoEx.argtypes = [_w.HANDLE, ctypes.c_void_p]
        _kernel32.CancelIoEx.restype = _w.BOOL
        _cancel_io_ex = _kernel32.CancelIoEx
    except AttributeError:  # pragma: no cover
        _cancel_io_ex = None

    _WIN_ERRORS = {
        2: "The system cannot find the file specified.",
        5: "Access is denied.",
        22: "The device does not recognize the command.",
        31: "A device attached to the system is not functioning.",
        87: "The parameter is incorrect.",
        121: "The semaphore timeout period has expired.",
        123: "The filename, directory name, or volume label syntax is incorrect.",
        233: "No process is on the other end of the pipe.",
        995: "The I/O operation has been aborted.",
        1167: "The device is not connected.",
    }

    def _win_error(code: int) -> str:
        # Use fixed English text so the message is not localized by Windows.
        return _WIN_ERRORS.get(code, "Windows error %d" % code)

    class WindowsSerialBackend:
        """Serial port backend implemented with the Win32 communication API."""

        def __init__(self, port: str, baudrate: int) -> None:
            self.port = port
            self.baudrate = int(baudrate)
            self._handle = None
            self._lock = threading.Lock()
            self._open()

        @property
        def is_open(self) -> bool:
            return bool(self._handle)

        def _open(self) -> None:
            path = (self.port if self.port.startswith("\\\\.\\")
                    else "\\\\.\\" + self.port)
            handle = _kernel32.CreateFileW(
                path,
                _GENERIC_READ | _GENERIC_WRITE,
                0,
                None,
                _OPEN_EXISTING,
                _FILE_ATTRIBUTE_NORMAL,
                None,
            )
            if not handle or handle == _INVALID_HANDLE_VALUE:
                code = ctypes.get_last_error()
                raise OSError(code, "Cannot open serial port %s: %s" % (self.port, _win_error(code)))
            self._handle = handle
            _kernel32.SetupComm(handle, 4096, 4096)
            _kernel32.PurgeComm(handle, _PURGE_RXCLEAR | _PURGE_TXCLEAR)
            timeouts = _COMMTIMEOUTS(_MAXDWORD, 0, 0, 0, 0)
            if not _kernel32.SetCommTimeouts(handle, ctypes.byref(timeouts)):
                self.close()
                code = ctypes.get_last_error()
                raise OSError(code, "Failed to set serial port timeouts: %s" % _win_error(code))
            self._apply_dcb(self.baudrate)

        def _apply_dcb(self, baudrate: int) -> None:
            dcb = _DCB()
            dcb.DCBlength = ctypes.sizeof(_DCB)
            if not _kernel32.GetCommState(self._handle, ctypes.byref(dcb)):
                code = ctypes.get_last_error()
                raise OSError(code, "Failed to read serial port state: %s" % _win_error(code))
            dcb.BaudRate = int(baudrate)
            dcb.ByteSize = 8
            dcb.Parity = 0       # NOPARITY
            dcb.StopBits = 0     # ONESTOPBIT
            dcb.fBinary = 1
            dcb.fParity = 0
            dcb.fOutxCtsFlow = 0
            dcb.fOutxDsrFlow = 0
            dcb.fDtrControl = 1  # DTR_CONTROL_ENABLE
            dcb.fDsrSensitivity = 0
            dcb.fTXContinueOnXoff = 1
            dcb.fOutX = 0
            dcb.fInX = 0
            dcb.fErrorChar = 0
            dcb.fNull = 0
            dcb.fRtsControl = 1  # RTS_CONTROL_ENABLE
            dcb.fAbortOnError = 0
            if not _kernel32.SetCommState(self._handle, ctypes.byref(dcb)):
                code = ctypes.get_last_error()
                raise OSError(code, "Failed to set serial port parameters: %s" % _win_error(code))

        def read(self, timeout_s: float) -> bytes:
            if not self._handle:
                return b""
            buffer = ctypes.create_string_buffer(4096)
            read = _w.DWORD(0)
            ok = _kernel32.ReadFile(
                self._handle, buffer, len(buffer), ctypes.byref(read), None
            )
            if ok:
                if read.value:
                    return buffer.raw[: read.value]
                # No data available: avoid a busy loop.
                time.sleep(min(max(timeout_s, 0.001), 0.02))
                return b""
            code = ctypes.get_last_error()
            if code in (_ERROR_OPERATION_ABORTED, _ERROR_INVALID_HANDLE):
                return b""
            raise OSError(code, "Failed to read serial port: %s" % _win_error(code))

        def write(self, data: bytes) -> None:
            if not self._handle:
                raise IOError("Serial port is not open")
            if not data:
                return
            buffer = ctypes.create_string_buffer(data, len(data))
            written = _w.DWORD(0)
            ok = _kernel32.WriteFile(
                self._handle, buffer, len(data), ctypes.byref(written), None
            )
            if not ok:
                code = ctypes.get_last_error()
                raise OSError(code, "Failed to write serial port: %s" % _win_error(code))
            if written.value != len(data):
                raise IOError("Incomplete serial write: %d/%d" % (written.value, len(data)))
            _kernel32.FlushFileBuffers(self._handle)

        def set_baudrate(self, baudrate: int) -> None:
            self._apply_dcb(int(baudrate))
            self.baudrate = int(baudrate)

        def close(self) -> None:
            with self._lock:
                handle, self._handle = self._handle, None
            if not handle:
                return
            if _cancel_io_ex:
                try:
                    _cancel_io_ex(handle, None)
                except Exception:
                    pass
            _kernel32.CloseHandle(handle)

    def _win_read_value(key, name):
        try:
            return winreg.QueryValueEx(key, name)[0]
        except OSError:
            return None

    def _clean_windows_description(value: str) -> str:
        if not value:
            return ""
        if ";" in value:
            value = value.rsplit(";", 1)[-1]
        return value.strip()

    def _windows_usb_port_map():
        """
        Map active COM port names to USB VID/PID and descriptions.

        The authoritative list of active ports is SERIALCOMM; the USB Enum
        tree also contains stale instances from devices that were unplugged,
        so only active COM names are returned.
        """
        result = {}
        try:
            base = winreg.OpenKey(
                winreg.HKEY_LOCAL_MACHINE,
                r"SYSTEM\CurrentControlSet\Enum\USB",
            )
        except OSError:
            return result
        try:
            for index in range(winreg.QueryInfoKey(base)[0]):
                try:
                    interface = winreg.EnumKey(base, index)
                except OSError:
                    break
                match = re.match(
                    r"VID_([0-9A-Fa-f]{4})&PID_([0-9A-Fa-f]{4})", interface
                )
                if not match:
                    continue
                vid = int(match.group(1), 16)
                pid = int(match.group(2), 16)
                try:
                    interface_key = winreg.OpenKey(base, interface)
                except OSError:
                    continue
                try:
                    for sub_index in range(winreg.QueryInfoKey(interface_key)[0]):
                        try:
                            instance = winreg.EnumKey(interface_key, sub_index)
                        except OSError:
                            break
                        try:
                            instance_key = winreg.OpenKey(interface_key, instance)
                        except OSError:
                            continue
                        try:
                            friendly = _win_read_value(instance_key, "FriendlyName")
                            desc = _win_read_value(instance_key, "DeviceDesc")
                            port = _win_read_value(instance_key, "PortName")
                            if not port:
                                try:
                                    params = winreg.OpenKey(
                                        instance_key, "Device Parameters"
                                    )
                                except OSError:
                                    params = None
                                if params is not None:
                                    try:
                                        port = _win_read_value(params, "PortName")
                                    finally:
                                        winreg.CloseKey(params)
                            if not port:
                                continue
                            description = _clean_windows_description(
                                friendly or desc or "")
                            hwid = "USB\\%s\\%s" % (interface, instance)
                            result.setdefault(port, []).append(SerialPortInfo(
                                device=port,
                                description=description,
                                hwid=hwid,
                                vid=vid,
                                pid=pid,
                            ))
                        finally:
                            winreg.CloseKey(instance_key)
                finally:
                    winreg.CloseKey(interface_key)
        finally:
            winreg.CloseKey(base)
        return result

    def _list_serial_ports_raw() -> List[SerialPortInfo]:
        active = {}
        try:
            key = winreg.OpenKey(
                winreg.HKEY_LOCAL_MACHINE, r"HARDWARE\DEVICEMAP\SERIALCOMM"
            )
        except OSError:
            return []
        try:
            index = 0
            while True:
                try:
                    name, value, _ = winreg.EnumValue(key, index)
                except OSError:
                    break
                index += 1
                if isinstance(value, bytes):
                    value = value.decode("ascii", "replace")
                active[value] = name
        finally:
            winreg.CloseKey(key)

        usb_map = _windows_usb_port_map()
        ports = []
        for device, system_name in active.items():
            candidates = usb_map.get(device, [])
            chosen = None
            for candidate in candidates:
                if candidate.is_powerwriter:
                    chosen = candidate
                    break
            if chosen is None and candidates:
                chosen = candidates[0]
            if chosen is None:
                chosen = SerialPortInfo(device=device, description=system_name)
            ports.append(chosen)

        def sort_key(item: SerialPortInfo):
            digits = "".join(ch for ch in item.device if ch.isdigit())
            return (0, int(digits)) if digits else (1, item.device)

        ports.sort(key=sort_key)
        return ports


# ===========================================================================
# POSIX backend (Linux / macOS)
# ===========================================================================
else:
    import errno
    import glob
    import os
    import select
    import termios

    _BAUD_RATES = {}
    for _name in dir(termios):
        if _name.startswith("B") and _name[1:].isdigit():
            _rate = int(_name[1:])
            if _rate > 0:
                _BAUD_RATES[_rate] = getattr(termios, _name)

    class PosixSerialBackend:
        """Serial port backend implemented with termios and select."""

        def __init__(self, port: str, baudrate: int) -> None:
            self.port = port
            self.baudrate = int(baudrate)
            self._fd = None
            self._open()

        @property
        def is_open(self) -> bool:
            return self._fd is not None

        def _open(self) -> None:
            fd = os.open(self.port, os.O_RDWR | os.O_NOCTTY | os.O_NONBLOCK)
            self._fd = fd
            try:
                self._apply_termios(self.baudrate)
            except Exception:
                os.close(fd)
                self._fd = None
                raise

        def _apply_termios(self, baudrate: int) -> None:
            speed = _BAUD_RATES.get(int(baudrate))
            if speed is None:
                raise ValueError("Unsupported baud rate: %d" % baudrate)
            attrs = termios.tcgetattr(self._fd)
            iflag, oflag, cflag, lflag, _, _, cc = attrs
            iflag &= ~(
                termios.IGNBRK | termios.BRKINT | termios.PARMRK |
                termios.ISTRIP | termios.INLCR | termios.IGNCR |
                termios.ICRNL | termios.IXON | termios.IXOFF |
                getattr(termios, "IXANY", 0)
            )
            oflag &= ~termios.OPOST
            lflag &= ~(
                termios.ECHO | termios.ECHONL | termios.ICANON |
                termios.ISIG | termios.IEXTEN
            )
            cflag &= ~(termios.CSIZE | termios.PARENB | termios.CSTOPB)
            cflag |= termios.CS8 | termios.CREAD | termios.CLOCAL
            cc[termios.VMIN] = 0
            cc[termios.VTIME] = 0
            termios.tcsetattr(
                self._fd, termios.TCSANOW,
                [iflag, oflag, cflag, lflag, speed, speed, cc],
            )

        def read(self, timeout_s: float) -> bytes:
            if self._fd is None:
                return b""
            try:
                readable, _, _ = select.select([self._fd], [], [], timeout_s)
            except (OSError, ValueError):
                return b""
            if not readable:
                return b""
            try:
                return os.read(self._fd, 4096)
            except BlockingIOError:
                return b""
            except OSError as exc:
                if exc.errno in (errno.EAGAIN, errno.EWOULDBLOCK):
                    return b""
                raise

        def write(self, data: bytes) -> None:
            if self._fd is None:
                raise IOError("Serial port is not open")
            view = memoryview(data)
            while view:
                _, writable, _ = select.select([], [self._fd], [], 2.0)
                if not writable:
                    raise TimeoutError("Serial write timed out")
                try:
                    written = os.write(self._fd, view)
                except OSError as exc:
                    if exc.errno in (errno.EAGAIN, errno.EWOULDBLOCK):
                        continue
                    raise
                view = view[written:]

        def set_baudrate(self, baudrate: int) -> None:
            self._apply_termios(int(baudrate))
            self.baudrate = int(baudrate)

        def close(self) -> None:
            fd, self._fd = self._fd, None
            if fd is not None:
                try:
                    os.close(fd)
                except OSError:
                    pass

    def _linux_usb_info(path: str):
        """Return (vid, pid, description) from sysfs, or None."""
        try:
            real = os.path.realpath(path)
        except OSError:
            return None
        tty_name = os.path.basename(real)
        current = os.path.realpath(
            os.path.join("/sys/class/tty", tty_name, "device")
        )
        if not os.path.isdir(current):
            current = os.path.dirname(real)
        for _ in range(6):
            vid_path = os.path.join(current, "idVendor")
            pid_path = os.path.join(current, "idProduct")
            if os.path.isfile(vid_path) and os.path.isfile(pid_path):
                try:
                    with open(vid_path, "r", encoding="ascii") as fp:
                        vid = int(fp.read().strip(), 16)
                    with open(pid_path, "r", encoding="ascii") as fp:
                        pid = int(fp.read().strip(), 16)
                except (OSError, ValueError):
                    return None
                description = ""
                for name in ("product", "manufacturer"):
                    value_path = os.path.join(current, name)
                    if os.path.isfile(value_path):
                        try:
                            with open(value_path, "r",
                                      encoding="utf-8", errors="replace") as fp:
                                description = fp.read().strip()
                        except OSError:
                            description = ""
                    if description:
                        break
                return vid, pid, description
            parent = os.path.dirname(current)
            if parent == current:
                break
            current = parent
        return None

    def _list_serial_ports_raw() -> List[SerialPortInfo]:
        if sys.platform == "darwin":
            patterns = ["/dev/cu.*", "/dev/tty.*"]
        else:
            patterns = [
                "/dev/serial/by-id/*",
                "/dev/ttyUSB*", "/dev/ttyACM*", "/dev/ttyAMA*",
                "/dev/ttyS*",
            ]

        seen = set()
        ports = []
        for pattern in patterns:
            for path in sorted(glob.glob(pattern)):
                try:
                    real = os.path.realpath(path)
                except OSError:
                    real = path
                if real in seen:
                    continue
                seen.add(real)
                vid = pid = None
                description = "serial port"
                info = _linux_usb_info(path)
                if info:
                    vid, pid, usb_description = info
                    if usb_description:
                        description = usb_description
                ports.append(SerialPortInfo(
                    device=path,
                    description=description,
                    hwid=real,
                    vid=vid,
                    pid=pid,
                ))
        return ports


# ===========================================================================
# Backend factory
# ===========================================================================
def list_serial_ports(powerwriter_only: bool = False) -> List[SerialPortInfo]:
    """List active serial ports, optionally only detected PowerWriter devices."""
    ports = _list_serial_ports_raw()
    if powerwriter_only:
        ports = [port for port in ports if port.is_powerwriter]
    return ports


def open_backend(port: str, baudrate: int):
    """Create a platform-specific serial backend."""
    if sys.platform.startswith("win"):
        return WindowsSerialBackend(port, baudrate)
    return PosixSerialBackend(port, baudrate)
