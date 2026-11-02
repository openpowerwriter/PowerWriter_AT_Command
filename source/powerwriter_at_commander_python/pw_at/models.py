# -*- coding: utf-8 -*-
"""
PowerWriter AT data models.

These classes convert C structure contents into convenient Python objects.
They contain no protocol serialization logic; that is handled by the C core.
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import IntEnum
from typing import Optional


class OfflineState(IntEnum):
    """Offline programming state; values match the C E_ATStatus enum."""

    UNKNOWN = -1
    OK = 0
    PROGRESS = 1
    ERROR = 2


@dataclass
class WriterInfo:
    """Writer information (S_ATCmdRspWriterInfo)."""

    oem: str = ""
    sn: str = ""
    hardware_version: str = ""
    bootloader_version: str = ""
    interface_version: str = ""

    def __str__(self) -> str:
        return (
            "Model: %s | SN: %s | Hardware: %s | Bootloader: %s | Interface firmware: %s"
            % (self.oem or "-", self.sn or "-", self.hardware_version or "-",
               self.bootloader_version or "-", self.interface_version or "-")
        )


@dataclass
class WriterConfig:
    """Writer configuration (S_ATCmdRspWriterCfg / S_ATCmdSetWriterCfg)."""

    target_vendor: str = ""
    target_series: str = ""
    target_model: str = ""

    erase_type: int = 0          # EraseType
    output_vext_type: int = 0    # OutputVext
    clock_type: int = 0          # ClockType
    buzzer_enable: int = 0
    ob_update_type: int = 0      # OBUpdateType

    limit_number_enable: int = 0  # Read-only
    limit_number: int = 0         # Remaining count, read-only
    target_auto_enable: int = 0
    target_auto_in_debounce: int = 0
    target_auto_out_debounce: int = 0

    disable_power_ap: int = 0
    run_ap: int = 0
    power_on_debounce: int = 0
    power_off_debounce: int = 0
    reset_type: int = 0

    def describe(self) -> str:
        """Return a user-facing multi-line description."""
        from .constants import (
            CLOCK_LABELS, ERASE_TYPE_LABELS, OB_UPDATE_LABELS,
            VEXT_LABELS, ClockType, EraseType, OBUpdateType, OutputVext,
        )

        def label(mapping, enum_cls, value):
            try:
                return mapping[enum_cls(value)]
            except (ValueError, KeyError):
                return str(value)

        return "\n".join([
            "Target chip: %s / %s / %s" % (self.target_vendor or "-",
                                            self.target_series or "-",
                                            self.target_model or "-"),
            "Erase mode: %s" % label(ERASE_TYPE_LABELS, EraseType, self.erase_type),
            "Output VEXT: %s" % label(VEXT_LABELS, OutputVext, self.output_vext_type),
            "Clock: %s" % label(CLOCK_LABELS, ClockType, self.clock_type),
            "Buzzer: %s" % ("On" if self.buzzer_enable else "Off"),
            "OptionByte update: %s" % label(OB_UPDATE_LABELS, OBUpdateType, self.ob_update_type),
            "Offline programming limit: %s (remaining %d)" % (
                "On" if self.limit_number_enable else "Off", self.limit_number),
            "Target auto-detection: %s (insert debounce %dms / removal %dms)" % (
                "On" if self.target_auto_enable else "Off",
                self.target_auto_in_debounce, self.target_auto_out_debounce),
            "Power off after programming: %s" % ("Yes" if self.disable_power_ap else "No"),
            "Run after programming: %s" % ("Yes" if self.run_ap else "No"),
            "Power-on/off debounce: %dms / %dms" % (self.power_on_debounce, self.power_off_debounce),
            "Reset pin control: %d" % self.reset_type,
        ])


@dataclass
class TargetChipID:
    """Target chip ID (S_ATCmdRspTargetChipID)."""

    data: bytes = b""

    @property
    def hex(self) -> str:
        return " ".join("%02X" % b for b in self.data)

    @property
    def value(self) -> int:
        return int.from_bytes(self.data, "big") if self.data else 0


@dataclass
class ProjectInfo:
    """Offline project information (S_ATCmdRspProjectInfo)."""

    activate: int = 0
    size: int = 0
    crc32: int = 0

    @property
    def active(self) -> bool:
        return bool(self.activate)


@dataclass
class StatusProgress:
    """Programming progress (S_ATCmdStatusProgress)."""

    total: int = 0
    processed: int = 0

    @property
    def fraction(self) -> float:
        if not self.total:
            return 0.0
        return max(0.0, min(1.0, self.processed / self.total))


@dataclass
class OfflineStatus:
    """Result of an offline programming status query."""

    state: OfflineState = OfflineState.UNKNOWN
    progress: Optional[StatusProgress] = None
    error_code: int = 0

    @property
    def done(self) -> bool:
        return self.state in (OfflineState.OK, OfflineState.ERROR)

    @property
    def failed(self) -> bool:
        return self.state == OfflineState.ERROR


@dataclass
class MemoryBlock:
    """One target memory read block."""

    address: int = 0
    data: bytes = b""


@dataclass
class OptionByte:
    """Target option byte data."""

    data: bytes = b""


@dataclass
class BroadcastResponse:
    """Broadcast response."""

    keep_frame: int = 0
    direction: int = 0
    data: bytes = b""
