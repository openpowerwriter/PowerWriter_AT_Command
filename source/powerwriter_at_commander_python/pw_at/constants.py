# -*- coding: utf-8 -*-
"""
Constants used by the PowerWriter AT Python binding.

- Error codes match E_ATCmdError in powerwriter_at_core/powerwriter_at_error.h.
- Configuration/reset/broadcast enumerations match powerwriter_at_type.h.
- All protocol framing, CRC and AES work is performed by the C core; this
  module contains no protocol implementation.
"""

from enum import IntEnum

# Protocol and business constants (mirror powerwriter_at_config.h)
PW_PACKAGE_SIZE = 256          # Bytes per read/write block
PW_OB_MAX = 1024               # Maximum OptionByte size
PW_MAX_FILE_NAME = 255         # Maximum project file name length
PW_PROJECT_PWD_SIZE = 16       # Maximum project password length
PW_TARGET_ID_MAX = 16          # Maximum target chip ID length
PW_TARGET_NAME_MAX = 16        # Target chip name length
PW_AT_DEFAULT_BAUDRATE = 9600  # Default AT serial baud rate
PW_AT_TIMEOUT_BASE = 5000      # Default command timeout (ms)


# ---------------------------------------------------------------------------
# Error codes (E_ATCmdError)
# ---------------------------------------------------------------------------
class ATError(IntEnum):
    """Device/communication error codes; values match powerwriter_at_error.h."""

    NONE = 0
    CRC = 1
    TYPE = 2
    BUSY = 3
    USED = 4
    PRIVATE_HD = 5
    WRITER_CONFIG = 6
    PRIVATE_ALG = 7

    TARGET_OB = 8
    TARGET_CONNECT = 9
    TARGET_ERASE = 10
    TARGET_WRITE = 11
    TARGET_READ = 12

    TIMEOUT = 13
    EXT_FLASH_INIT = 14
    EXT_FLASH_ERASE = 15
    EXT_FLASH_WRITE = 16
    EXT_FLASH_VERIFY = 17
    EXT_FLASH_READ = 18

    PACKET_SIZE = 19
    CHIP_TYPE = 20
    READ_CHIP_ID = 21
    UPDATE = 22
    RDP = 23

    WFLASH_DATA = 24
    WRITE_OB = 25
    WRITE_SN = 26
    WRITE_UID = 27
    WRITE_UKEY = 28

    GET_UID = 29
    GET_UKEY = 30

    WRITE_TIMES = 31
    OFFLINE_VER = 32
    OFFLINE_OEM = 33
    OFFLINE_MAGIC = 34
    OFFLINE_DATA = 35
    OFFLINE_DISABLE = 36

    SIZE = 37
    PORT = 38
    PACKET = 39
    NEED_DISCONNECT = 40
    COM_SEND = 41
    COM_REC = 42
    CMD = 43
    NULL_VALUE = 44
    ALGO = 45
    KEY = 46
    RUN_ENV = 47

    ICWKEY_CONNECT = 48
    VOLTAGE_OUTPUT = 49
    WARN_DEBUGGER_CONNECT = 50
    WARN_WIRELESS_ONLINE = 51

    PRIVATE_1 = 52
    PRIVATE_2 = 53
    PRIVATE_3 = 54
    PRIVATE_4 = 55
    PRIVATE_5 = 56
    PKG_SN_LIMIT = 57
    PKG_UID_LIMIT = 58

    PKG_VERSION = 59
    PRIVATE_6 = 60
    NON_MASS_PDC = 61
    KPROM_CONFIG = 62
    SPI_FLASH = 63
    ABNORMAL_ACCESS_DETECTED = 64

    UPDATE_KPROM = 65
    UPDATE_XOM = 66
    UPDATE_SECURE_SETTING = 67
    UPDATE_MTP = 68

    FUS_NOT_RUNNING = 69
    STACK_NOT_RUNNING = 70
    UPGRADE_FUS = 71
    UPGRADE_STACK = 72
    FUS_STATE_IMAGE_NONE = 73
    FUS_STATE_IMAGE_CORRUPT = 74
    FUS_STATE_IMAGE_NOT_AUTHENTIC = 75
    FUS_STATE_IMAGE_NOT_ENOUGH_SPACE = 76
    FUS_STATE_USRABORT = 77
    FUS_STATE_ERSERROR = 78
    FUS_STATE_WRTERROR = 79
    FUS_AUTH_TAG_ST_NOTFOUND = 80
    AUTH_TAG_CUST_NOTFOUND = 81
    AUTH_KEY_LOCKED = 82
    FUS_UFB_CORRUPT = 83
    FUS_STATE_OTHER_ERROR = 84
    STACK_TYPE_ERROR = 85

    PRIVATE_SOF = 86
    VENDOR_SIGN_CRUSH = 87
    VENDOR_NO_SIGN = 88

    FACTORY_TEST_DISABLE = 89
    FACTORY_TEST_SRAM_FW_NONE = 90
    FACTORY_TEST_FLASH_FW_NONE = 91
    WRITE_SRAM = 92
    BAUDRATE = 93
    BROADCAST_DIR = 94
    BROADCAST_KEEP = 95
    AT_UART_DISABLE = 96
    FACTORY_TEST_FAILED = 97
    INITIAL_FAILED = 98
    FW_EXCEEDED = 99


# Human-readable descriptions for common errors. These are user-facing strings.
ERROR_MESSAGES = {
    ATError.NONE: "No error",
    ATError.CRC: "Data CRC check failed",
    ATError.TYPE: "Product type mismatch",
    ATError.BUSY: "Device busy",
    ATError.USED: "Device is in use",
    ATError.WRITER_CONFIG: "Configuration error",
    ATError.TARGET_OB: "Target chip OptionByte configuration error",
    ATError.TARGET_CONNECT: "Target chip not connected",
    ATError.TARGET_ERASE: "Target chip erase failed",
    ATError.TARGET_WRITE: "Target chip write failed",
    ATError.TARGET_READ: "Target chip read failed",
    ATError.TIMEOUT: "Timed out waiting for device response",
    ATError.PACKET_SIZE: "Invalid packet length",
    ATError.CHIP_TYPE: "Invalid target chip type",
    ATError.READ_CHIP_ID: "Failed to read target chip ID",
    ATError.RDP: "Target chip read protection is enabled",
    ATError.WFLASH_DATA: "Failed to write Flash data",
    ATError.WRITE_OB: "Failed to write OptionByte",
    ATError.WRITE_SN: "Writer SN is invalid or mismatched",
    ATError.WRITE_TIMES: "Offline programming count exhausted",
    ATError.OFFLINE_VER: "Invalid offline project version",
    ATError.OFFLINE_OEM: "Invalid offline project OEM",
    ATError.OFFLINE_MAGIC: "Invalid offline project Magic tag",
    ATError.OFFLINE_DATA: "Offline project data is corrupted",
    ATError.OFFLINE_DISABLE: "Offline project is disabled",
    ATError.SIZE: "Invalid data length",
    ATError.PORT: "Communication port error",
    ATError.PACKET: "Communication packet error",
    ATError.NEED_DISCONNECT: "Disconnect the online connection first",
    ATError.COM_SEND: "Serial port send failed",
    ATError.COM_REC: "Timed out waiting for serial port response",
    ATError.CMD: "Unsupported command or invalid response type",
    ATError.NULL_VALUE: "Parameter is empty",
    ATError.ALGO: "Invalid target Flash algorithm configuration",
    ATError.KEY: "Authentication password is incorrect",
    ATError.RUN_ENV: "Disconnect the device and power-cycle it to complete the upgrade",
    ATError.VOLTAGE_OUTPUT: "Abnormal voltage (power supply fault)",
    ATError.WARN_DEBUGGER_CONNECT: "Debugger connected",
    ATError.FACTORY_TEST_DISABLE: "Factory test is not enabled",
    ATError.BAUDRATE: "Invalid AT baud rate",
    ATError.BROADCAST_DIR: "Invalid broadcast direction",
    ATError.BROADCAST_KEEP: "The AT frame must be retained before sending",
    ATError.AT_UART_DISABLE: "AT UART feature is not enabled",
    ATError.FACTORY_TEST_FAILED: "Factory test failed",
    ATError.INITIAL_FAILED: "AT command initialization failed",
    ATError.FW_EXCEEDED: "Firmware count exceeds the limit",
}


def describe_error(code: int) -> str:
    """Return a human-readable description for an error code."""
    try:
        err = ATError(code)
    except ValueError:
        return "Unknown error (0x%08X)" % (code & 0xFFFFFFFF)
    return ERROR_MESSAGES.get(err, err.name)


def error_name(code: int) -> str:
    """Return a C-style error name for cross-referencing powerwriter_at_error.h."""
    try:
        err = ATError(code)
    except ValueError:
        return "Unknown"
    return "ATError" + "".join(part.capitalize() for part in err.name.split("_"))


# ---------------------------------------------------------------------------
# User configuration enumerations (values match the C struct fields)
# ---------------------------------------------------------------------------
class EraseType(IntEnum):
    NONE = 0    # No erase
    CHIP = 1    # Full chip erase
    SECTOR = 2  # Sector erase


class OutputVext(IntEnum):
    V1_8 = 0      # 1.8 V
    V3_3 = 1      # 3.3 V
    V5_0 = 2      # 5.0 V
    EXTERNAL = 3  # External supply


class ClockType(IntEnum):
    MHZ20 = 0  # 20 MHz fast mode
    MHZ10 = 1  # 10 MHz default
    MHZ5 = 2
    MHZ2 = 3
    MHZ1 = 4


class OBUpdateType(IntEnum):
    NONE = 0
    USER_AFTER = 1
    VENDOR_BEFORE = 2
    VENDOR_BEFORE_USER_AFTER = 3


class ResetType(IntEnum):
    HW_KEEP_LOW = 0
    HW_NONE_RESET = 1
    HW_RESET = 2
    HW_CORE_RESET = 3
    CORE_RESET = 4
    VECTOR_RESET = 5
    POR_ONLY = 6
    POR_AND_RELEASE = 7


class BroadcastDir(IntEnum):
    CDC2UART = 0  # USB-CDC -> hardware UART
    UART2CDC = 1  # Hardware UART -> USB-CDC


class SwitchReloadType(IntEnum):
    RESUME = 0  # Resume previous programming progress
    RELOAD = 1  # Reload the project


# User-facing English labels used by the CLI and GUI.
RESET_TYPE_NAMES = {
    "hw-keep-low": ResetType.HW_KEEP_LOW,
    "hw-none-reset": ResetType.HW_NONE_RESET,
    "hw-reset": ResetType.HW_RESET,
    "hw-core-reset": ResetType.HW_CORE_RESET,
    "core-reset": ResetType.CORE_RESET,
    "vector-reset": ResetType.VECTOR_RESET,
    "por-only": ResetType.POR_ONLY,
    "por-and-release": ResetType.POR_AND_RELEASE,
}

RESET_TYPE_LABELS = {
    ResetType.HW_KEEP_LOW: "Hold hardware reset pin low",
    ResetType.HW_NONE_RESET: "Hardware reset pin high-Z (no reset)",
    ResetType.HW_RESET: "Hardware reset",
    ResetType.HW_CORE_RESET: "Hardware reset + core reset",
    ResetType.CORE_RESET: "Software core reset",
    ResetType.VECTOR_RESET: "Software vector reset",
    ResetType.POR_ONLY: "Power-on reset only",
    ResetType.POR_AND_RELEASE: "Power-on reset and release ports",
}

ERASE_TYPE_LABELS = {
    EraseType.NONE: "No erase",
    EraseType.CHIP: "Full-chip erase",
    EraseType.SECTOR: "Sector erase",
}

VEXT_LABELS = {
    OutputVext.V1_8: "1.8V",
    OutputVext.V3_3: "3.3V",
    OutputVext.V5_0: "5.0V",
    OutputVext.EXTERNAL: "External supply",
}

CLOCK_LABELS = {
    ClockType.MHZ20: "20MHz (high speed)",
    ClockType.MHZ10: "10MHz (default)",
    ClockType.MHZ5: "5MHz",
    ClockType.MHZ2: "2MHz",
    ClockType.MHZ1: "1MHz",
}

OB_UPDATE_LABELS = {
    OBUpdateType.NONE: "No action",
    OBUpdateType.USER_AFTER: "Write user OptionByte after programming",
    OBUpdateType.VENDOR_BEFORE: "Restore default OptionByte before programming",
    OBUpdateType.VENDOR_BEFORE_USER_AFTER: "Restore default before programming, write user OptionByte after",
}

BROADCAST_DIR_LABELS = {
    BroadcastDir.CDC2UART: "USB-CDC -> UART",
    BroadcastDir.UART2CDC: "UART -> USB-CDC",
}
