# -*- coding: utf-8 -*-
"""Tests for the standard-library serial backend and the transport thread."""

import os
import queue
import sys
import time
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)

import pw_at.transport as transport_module
from pw_at import serial_backend
from pw_at.serial_backend import SerialPortInfo
from pw_at.transport import SerialTransport


class SerialBackendTests(unittest.TestCase):
    def test_list_ports_returns_entries(self):
        ports = serial_backend.list_serial_ports()
        self.assertIsInstance(ports, list)
        for item in ports:
            self.assertTrue(item.device)
            self.assertIsInstance(str(item), str)

    def test_invalid_port_raises(self):
        with self.assertRaises(OSError):
            serial_backend.open_backend("PWAT_NO_SUCH_PORT_12345", 9600)

    @unittest.skipUnless(sys.platform.startswith("win"), "Windows only")
    def test_win32_structure_sizes(self):
        import ctypes
        self.assertEqual(ctypes.sizeof(serial_backend._DCB), 28)
        self.assertEqual(ctypes.sizeof(serial_backend._COMMTIMEOUTS), 20)

    def test_powerwriter_identification(self):
        powerwriter = SerialPortInfo(
            "COM22", "PowerWriter Serial Port",
            "USB\\VID_0D28&PID_0204", 0x0D28, 0x0204,
        )
        self.assertTrue(powerwriter.is_powerwriter)
        self.assertEqual(powerwriter.vid_pid, "0D28:0204")
        self.assertIn("[PowerWriter]", str(powerwriter))

        self.assertFalse(SerialPortInfo("COM1", "Communications Port").is_powerwriter)
        self.assertFalse(
            SerialPortInfo("COM5", "Other", "", 0x1234, 0x5678).is_powerwriter)
        self.assertTrue(
            SerialPortInfo("COM9", "PowerWriter Serial Port").is_powerwriter)

    def test_powerwriter_filter(self):
        filtered = serial_backend.list_serial_ports(powerwriter_only=True)
        for item in filtered:
            self.assertTrue(item.is_powerwriter)

        for item in serial_backend.list_serial_ports():
            if item.is_powerwriter:
                self.assertTrue(item.vid_pid or "powerwriter" in item.description.lower())


class TransportTests(unittest.TestCase):
    def test_reader_writer_and_baudrate(self):
        class FakeBackend:
            def __init__(self):
                self.is_open = True
                self.received = []
                self.incoming = queue.Queue()
                self.baudrate = 9600
                self.closed = False

            def read(self, timeout_s):
                try:
                    return self.incoming.get(timeout=min(timeout_s, 0.02))
                except queue.Empty:
                    return b""

            def write(self, data):
                self.received.append(bytes(data))

            def set_baudrate(self, baudrate):
                self.baudrate = baudrate

            def close(self):
                self.closed = True
                self.is_open = False

        fake = FakeBackend()
        original = transport_module.open_backend
        transport_module.open_backend = lambda port, baud: fake
        try:
            received = []
            transport = SerialTransport("FAKE", 9600, received.append)
            self.assertTrue(transport.is_open)

            fake.incoming.put(b"abc")
            deadline = time.time() + 2.0
            while not received and time.time() < deadline:
                time.sleep(0.01)
            self.assertEqual(b"".join(received), b"abc")

            transport.write(b"xyz")
            self.assertEqual(fake.received, [b"xyz"])

            transport.set_baudrate(115200)
            self.assertEqual(fake.baudrate, 115200)

            transport.close()
            self.assertFalse(transport.is_open)
            self.assertTrue(fake.closed)
        finally:
            transport_module.open_backend = original


if __name__ == "__main__":
    unittest.main(verbosity=2)
