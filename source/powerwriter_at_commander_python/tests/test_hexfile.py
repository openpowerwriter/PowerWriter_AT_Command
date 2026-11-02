# -*- coding: utf-8 -*-
"""Tests for the Intel HEX parser."""

import tempfile
import unittest
from pathlib import Path

from pw_at.hexfile import HexError, parse_intel_hex


def record(address, record_type, payload):
    body = bytes([len(payload), (address >> 8) & 0xFF, address & 0xFF, record_type]) + bytes(payload)
    checksum = (-sum(body)) & 0xFF
    return ":" + (body + bytes([checksum])).hex().upper()


def hex_file(*lines):
    return "\n".join(lines) + "\n"


class HexFileTests(unittest.TestCase):
    def test_simple_data_record(self):
        image = parse_intel_hex(hex_file(
            record(0x0000, 0x00, b"\x01\x02\x03\x04"),
            record(0, 0x01, b""),
        ))
        self.assertEqual(image.segments, [(0, b"\x01\x02\x03\x04")])
        self.assertEqual(image.total_size, 4)
        self.assertEqual(image.start_address, 0)
        self.assertEqual(image.end_address, 3)

    def test_extended_linear_address(self):
        image = parse_intel_hex(hex_file(
            record(0x0000, 0x04, b"\x08\x00"),
            record(0x0010, 0x00, b"\xAA\xBB"),
            record(0, 0x01, b""),
        ))
        self.assertEqual(image.segments, [(0x08000010, b"\xAA\xBB")])

    def test_extended_segment_address(self):
        image = parse_intel_hex(hex_file(
            record(0x0000, 0x02, b"\x10\x00"),
            record(0x0004, 0x00, b"\x10\x20"),
            record(0, 0x01, b""),
        ))
        self.assertEqual(image.segments, [(0x10004, b"\x10\x20")])

    def test_multiple_segments(self):
        image = parse_intel_hex(hex_file(
            record(0x0000, 0x04, b"\x08\x00"),
            record(0x0000, 0x00, b"\x01\x02"),
            record(0x0010, 0x00, b"\x03\x04"),
            record(0x0020, 0x00, b"\x05"),
            record(0, 0x01, b""),
        ))
        self.assertEqual(
            image.segments,
            [(0x08000000, b"\x01\x02"),
             (0x08000010, b"\x03\x04"),
             (0x08000020, b"\x05")],
        )
        self.assertEqual(image.total_size, 5)

    def test_checksum_error(self):
        line = record(0x0000, 0x00, b"\x01\x02")
        bad = line[:-2] + "00"
        with self.assertRaises(HexError):
            parse_intel_hex(hex_file(bad, record(0, 0x01, b"")))

    def test_overlapping_data_is_rejected(self):
        with self.assertRaises(HexError):
            parse_intel_hex(hex_file(
                record(0x0000, 0x00, b"\x01\x02"),
                record(0x0001, 0x00, b"\x03"),
                record(0, 0x01, b""),
            ))

    def test_empty_file_is_rejected(self):
        with self.assertRaises(HexError):
            parse_intel_hex(hex_file(record(0, 0x01, b"")))

    def test_path_input(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "test.hex"
            path.write_text(hex_file(
                record(0x0100, 0x00, b"\xAB"),
                record(0, 0x01, b""),
            ), encoding="ascii")
            image = parse_intel_hex(path)
            self.assertEqual(image.segments, [(0x0100, b"\xAB")])


if __name__ == "__main__":
    unittest.main(verbosity=2)
