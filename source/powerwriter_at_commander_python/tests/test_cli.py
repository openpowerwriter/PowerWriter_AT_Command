# -*- coding: utf-8 -*-
"""Tests for command-line argument parsing and command coverage."""

import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)

import powerwriter_at_cli as cli
from powerwriter_at_cli import build_parser
from pw_at.serial_backend import SerialPortInfo


class CliParserTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.parser = build_parser()

    def test_global_options_before_command(self):
        args = self.parser.parse_args(["--port", "COM3", "info"])
        self.assertEqual(args.command, "info")
        self.assertEqual(args.port, "COM3")
        self.assertEqual(args.baud, 9600)

    def test_global_options_after_command(self):
        args = self.parser.parse_args(
            ["read", "0x08000000", "256", "--port", "COM4", "--baud", "115200"]
        )
        self.assertEqual(args.command, "read")
        self.assertEqual(args.port, "COM4")
        self.assertEqual(args.baud, 115200)
        self.assertEqual(args.address, 0x08000000)
        self.assertEqual(args.size, 256)

    def test_online_and_offline_commands_exist(self):
        actions = self.parser._subparsers._group_actions[0].choices
        for name in [
            "info", "config-get", "config-set", "set-baud",
            "connect", "status", "id", "read", "write", "write-prepare",
            "erase", "erase-sector", "ob-read", "ob-write-vendor",
            "ob-write-user", "reset",
            "project-info", "project-load", "project-disable",
            "offline-start", "offline-status", "project-switch",
            "broadcast", "factory-sram", "factory-flash", "benchmark",
            "about", "guide", "doctor", "list",
        ]:
            self.assertIn(name, actions)

    def test_write_prepare_accepts_size(self):
        args = self.parser.parse_args(
            ["write-prepare", "0x1000", "--port", "COM3"]
        )
        self.assertEqual(args.total, 0x1000)
        self.assertEqual(args.port, "COM3")

    def test_list_powerwriter_option(self):
        args = self.parser.parse_args(["list", "--powerwriter"])
        self.assertTrue(args.powerwriter)
        args = self.parser.parse_args(["list", "--pw"])
        self.assertTrue(args.powerwriter)

    def test_choose_port_prefers_powerwriter(self):
        powerwriter = SerialPortInfo(
            "COM22", "PowerWriter Serial Port",
            "USB\\VID_0D28&PID_0204", 0x0D28, 0x0204,
        )
        plain = SerialPortInfo("COM1", "Serial port")
        original = cli.list_serial_ports
        try:
            cli.list_serial_ports = lambda powerwriter_only=False: [powerwriter]
            self.assertEqual(cli.choose_port(None), "COM22")

            cli.list_serial_ports = lambda powerwriter_only=False: [plain]
            self.assertEqual(cli.choose_port(None), "COM1")

            cli.list_serial_ports = lambda powerwriter_only=False: [plain, powerwriter]
            self.assertEqual(cli.choose_port(None), "COM22")

            cli.list_serial_ports = lambda powerwriter_only=False: [
                powerwriter,
                SerialPortInfo("COM23", "PowerWriter", "", 0x0D28, 0x0204),
            ]
            with self.assertRaises(SystemExit):
                cli.choose_port(None)

            cli.list_serial_ports = lambda powerwriter_only=False: []
            with self.assertRaises(SystemExit):
                cli.choose_port(None)
        finally:
            cli.list_serial_ports = original


if __name__ == "__main__":
    unittest.main(verbosity=2)
