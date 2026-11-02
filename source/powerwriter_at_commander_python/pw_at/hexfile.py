# -*- coding: utf-8 -*-
"""Intel HEX parser used by the GUI write-memory action.

The parser returns contiguous address ranges. It supports data records and
the extended segment/linear address records used by multi-segment HEX files.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import List, Tuple, Union


class HexError(ValueError):
    """Raised when an Intel HEX file is malformed or empty."""


@dataclass(frozen=True)
class HexImage:
    segments: List[Tuple[int, bytes]]
    total_size: int
    start_address: int
    end_address: int


def _read_text(source: Union[str, Path, bytes]) -> str:
    if isinstance(source, bytes):
        return source.decode("ascii")
    if isinstance(source, Path):
        return source.read_text(encoding="ascii")
    if "\n" in source or source.startswith(":"):
        return source
    path = Path(source)
    if path.is_file():
        return path.read_text(encoding="ascii")
    return source


def parse_intel_hex(source: Union[str, Path, bytes]) -> HexImage:
    """Parse an Intel HEX file into contiguous segments.

    ``source`` may be a path, a HEX document, or raw ASCII bytes.
    """
    text = _read_text(source)
    data = {}
    base = 0
    saw_eof = False

    for line_number, raw_line in enumerate(text.splitlines(), 1):
        line = raw_line.strip()
        if not line:
            continue
        if not line.startswith(":"):
            raise HexError("line %d: record must start with ':'" % line_number)
        try:
            record = bytes.fromhex(line[1:])
        except ValueError:
            raise HexError("line %d: invalid hexadecimal data" % line_number) from None
        if len(record) < 5:
            raise HexError("line %d: record is too short" % line_number)
        count = record[0]
        if len(record) != count + 5:
            raise HexError("line %d: byte count does not match record" % line_number)
        if sum(record) & 0xFF:
            raise HexError("line %d: checksum mismatch" % line_number)

        offset = (record[1] << 8) | record[2]
        record_type = record[3]
        payload = record[4:4 + count]

        if record_type == 0x00:
            for index, value in enumerate(payload):
                address = base + offset + index
                if address > 0xFFFFFFFF:
                    raise HexError("line %d: address exceeds 32 bits" % line_number)
                if address in data:
                    raise HexError(
                        "line %d: overlapping data at 0x%08X"
                        % (line_number, address))
                data[address] = value
        elif record_type == 0x01:
            saw_eof = True
            break
        elif record_type == 0x02:
            if len(payload) != 2:
                raise HexError("line %d: invalid extended segment address" % line_number)
            base = ((payload[0] << 8) | payload[1]) << 4
        elif record_type == 0x04:
            if len(payload) != 2:
                raise HexError("line %d: invalid extended linear address" % line_number)
            base = ((payload[0] << 8) | payload[1]) << 16
        elif record_type in (0x03, 0x05):
            # Start address records do not describe writable data.
            continue
        else:
            # Unknown record types are ignored, matching common HEX tools.
            continue

    if not data:
        raise HexError("HEX file contains no data records")
    if not saw_eof:
        # Some generators omit EOF; the data is still usable.
        pass

    addresses = sorted(data)
    segments: List[Tuple[int, bytes]] = []
    start = addresses[0]
    previous = start
    chunk = bytearray([data[start]])
    for address in addresses[1:]:
        if address == previous + 1:
            chunk.append(data[address])
        else:
            segments.append((start, bytes(chunk)))
            start = address
            chunk = bytearray([data[address]])
        previous = address
    segments.append((start, bytes(chunk)))
    total = sum(len(segment) for _address, segment in segments)
    return HexImage(
        segments=segments,
        total_size=total,
        start_address=addresses[0],
        end_address=addresses[-1],
    )
