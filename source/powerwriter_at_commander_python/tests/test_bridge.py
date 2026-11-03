# -*- coding: utf-8 -*-
"""
Self-tests for the C shared library and ctypes binding.

A minimal responder builds response frames inside the write callback and feeds
them back to the C core. This verifies callback bridging, frame parsing, CRC,
chunked I/O and progress callbacks without hardware. The responder exists only
in tests; production code contains no protocol implementation.
"""

import contextlib
import io
import os
import struct
import sys
import tempfile
import threading
import unittest
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)

from pw_at import (
    ATError,
    Bridge,
    OfflineState,
    PowerWriterAT,
    PowerWriterATError,
    WriterConfig,
    load_library,
)
from pw_at.demo import SampleWorkflowSettings, run_sample_workflow
import powerwriter_at_cli as cli

DEMO_PKG = os.path.join(ROOT, "assets", "powerwriter_at_demo_project.pkg")

# Test-only AES key/IV, matching powerwriter_at_config.h in the C core
ENC_KEY = bytes.fromhex("72C634F2CF2EF3D5F740DA5CEEBE4018")
ENC_IV = bytes.fromhex("4BFEB618B2F1F1C92C7E4C376DF0B28A")
CUSTOM_ENC_KEY = bytes.fromhex("00112233445566778899AABBCCDDEEFF")
CUSTOM_ENC_IV = bytes.fromhex("0102030405060708090A0B0C0D0E0F10")

STATUS_OK = 0x7FFFFFFF - 100
STATUS_ERROR = STATUS_OK + 1
STATUS_PROGRESS = STATUS_OK + 2

# Test-only command codes (values match E_ATCmdType)
CMD_GET_WRITER_INFO = 1
CMD_RSP_WRITER_INFO = 2
CMD_GET_WRITER_CFG = 3
CMD_RSP_WRITER_CFG = 4
CMD_SET_WRITER_CFG = 5
CMD_SET_BAUDRATE = 6
CMD_CONNECT_TARGET = 100
CMD_GET_TARGET_STATUS = 101
CMD_GET_TARGET_CHIP_ID = 102
CMD_RSP_TARGET_CHIP_ID = 103
CMD_READ_TARGET_MEMORY = 104
CMD_RSP_TARGET_MEMORY = 105
CMD_ERASE_TARGET = 106
CMD_ERASE_TARGET_SECTORS = 107
CMD_WRITE_TARGET_MEMORY_PREPARE = 108
CMD_WRITE_TARGET_MEMORY = 109
CMD_READ_TARGET_OPTION_BYTE = 110
CMD_RSP_TARGET_OPTION_BYTE = 111
CMD_WRITE_TARGET_VENDOR_OPTION_BYTE = 112
CMD_WRITE_TARGET_USER_OPTION_BYTE = 113
CMD_TARGET_RESET = 114
CMD_FACTORY_RUN_SRAM_FW = 300
CMD_FACTORY_RUN_FLASH_FW = 301
CMD_GET_PROJECT_INFO = 200
CMD_RSP_PROJECT_INFO = 201
CMD_LOAD_PROJECT = 202
CMD_LOAD_PROJECT_SEND = 203
CMD_DISABLE_PROJECT = 204
CMD_START_OFFLINE = 205
CMD_GET_OFFLINE_STATUS = 206
CMD_SWITCH_OFFLINE_PROJECT = 207
CMD_BROADCAST = 400


def make_frame(cmd, prop=b""):
    payload = struct.pack("<iI", cmd, len(prop)) + prop
    body = b"PWAT" + struct.pack("<I", 8 + len(payload) + 4) + payload
    return body + struct.pack("<I", zlib.crc32(body) & 0xFFFFFFFF)


def ok_frame():
    return make_frame(STATUS_OK, struct.pack("<I", 0))


def err_frame(code):
    return make_frame(STATUS_ERROR, struct.pack("<I", int(code)))


def parse_request(frame):
    cmd, size = struct.unpack_from("<iI", frame, 8)
    return cmd, frame[16:16 + size]


def make_encrypted_frame(cmd, prop=b"", key=ENC_KEY, iv=ENC_IV):
    """Build an encrypted response frame (test only). CRC covers padded plaintext."""
    try:
        from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
    except ImportError:
        raise unittest.SkipTest("cryptography is not installed")

    def make_cipher():
        try:
            # cryptography >= 3.x
            return Cipher(algorithms.AES(key), modes.CBC(iv))
        except TypeError:
            # older cryptography releases require an explicit backend
            from cryptography.hazmat.backends import default_backend
            return Cipher(algorithms.AES(key), modes.CBC(iv),
                          backend=default_backend())

    plain = struct.pack("<iI", cmd, len(prop)) + prop
    padded = plain + b"\x00" * (-len(plain) % 16)
    encryptor = make_cipher().encryptor()
    cipher = encryptor.update(padded) + encryptor.finalize()
    # CRC covers the complete zero-padded plaintext payload, as in the C core.
    body = b"PWAT" + struct.pack("<I", 8 + len(cipher) + 4) + padded
    crc = zlib.crc32(body) & 0xFFFFFFFF
    return b"PWAT" + struct.pack("<I", 8 + len(cipher) + 4) + cipher + struct.pack("<I", crc)


class FakeDevice:
    """Test responder: returns correctly formatted frames for AT commands."""

    def __init__(self):
        self.connected = False
        self.flash = bytearray(b"\xFF" * 0x20000)
        self.config = bytearray(70)
        self.config[0:8] = b"Vendor\x00\x00"
        self.config[16:24] = b"Series\x00\x00"
        self.config[32:40] = b"Model\x00\x00\x00"
        self.project_active = False
        self.project_size = 0
        self.project_crc = 0
        self.offline_running = False
        self.offline_error = False
        self.packets = []
        self.broadcast = None
        self.baudrate = 9600
        self.last_switch_prop = b""
        self.erase_count = 0
        self.commands = []
        # Map command -> error code to simulate abnormal device responses.
        self.error_overrides = {}

    def handle(self, frame):
        cmd, prop = parse_request(frame)
        self.commands.append(cmd)
        if cmd in self.error_overrides:
            return err_frame(self.error_overrides[cmd])
        if cmd == CMD_GET_WRITER_INFO:
            info = (b"PWTEST\x00\x00" + b"SN-0001".ljust(32, b"\x00") +
                    b"1.0.0\x00\x00\x00" + b"2.0.0\x00\x00\x00" + b"3.0.0\x00\x00\x00")
            return make_frame(CMD_RSP_WRITER_INFO, info)
        if cmd == CMD_GET_WRITER_CFG:
            return make_frame(CMD_RSP_WRITER_CFG, bytes(self.config))
        if cmd == CMD_SET_WRITER_CFG:
            self.config = bytearray(prop[:70].ljust(70, b"\x00"))
            return ok_frame()
        if cmd == CMD_SET_BAUDRATE:
            self.baudrate = struct.unpack_from("<I", prop, 0)[0]
            return ok_frame()
        if cmd == CMD_CONNECT_TARGET:
            self.connected = True
            return ok_frame()
        if cmd == CMD_GET_TARGET_STATUS:
            return ok_frame() if self.connected else err_frame(ATError.TARGET_CONNECT)
        if cmd == CMD_GET_TARGET_CHIP_ID:
            if not self.connected:
                return err_frame(ATError.TARGET_CONNECT)
            cid = bytes([4, 0x1B, 0xA0, 0x5A, 0xC3])
            return make_frame(CMD_RSP_TARGET_CHIP_ID, cid.ljust(17, b"\x00"))
        if cmd == CMD_READ_TARGET_MEMORY:
            if not self.connected:
                return err_frame(ATError.TARGET_CONNECT)
            addr, size = struct.unpack_from("<II", prop, 0)
            size = min(size, 256)
            data = bytes(self.flash[addr:addr + size])
            block = data.ljust(256, b"\x00")
            return make_frame(CMD_RSP_TARGET_MEMORY,
                              struct.pack("<II", addr, size) + block)
        if cmd == CMD_WRITE_TARGET_MEMORY:
            if not self.connected:
                return err_frame(ATError.TARGET_CONNECT)
            addr, size = struct.unpack_from("<II", prop, 0)
            self.flash[addr:addr + size] = prop[8:8 + size]
            return ok_frame()
        if cmd == CMD_ERASE_TARGET:
            self.erase_count += 1
            return ok_frame() if self.connected else err_frame(ATError.TARGET_CONNECT)
        if cmd == CMD_WRITE_TARGET_MEMORY_PREPARE:
            return ok_frame() if self.connected else err_frame(ATError.TARGET_CONNECT)
        if cmd == CMD_ERASE_TARGET_SECTORS:
            addr, size = struct.unpack_from("<II", prop, 0)
            self.flash[addr:addr + size] = b"\xFF" * size
            return ok_frame()
        if cmd == CMD_READ_TARGET_OPTION_BYTE:
            ob = bytes([1, 2, 3, 4]).ljust(1024, b"\x00")
            return make_frame(CMD_RSP_TARGET_OPTION_BYTE, struct.pack("<I", 4) + ob)
        if cmd in (CMD_WRITE_TARGET_VENDOR_OPTION_BYTE,
                   CMD_WRITE_TARGET_USER_OPTION_BYTE):
            return ok_frame() if self.connected else err_frame(ATError.TARGET_CONNECT)
        if cmd in (CMD_FACTORY_RUN_SRAM_FW, CMD_FACTORY_RUN_FLASH_FW):
            return ok_frame()
        if cmd == CMD_TARGET_RESET:
            self.connected = False
            return ok_frame()
        if cmd == CMD_GET_PROJECT_INFO:
            return make_frame(CMD_RSP_PROJECT_INFO, struct.pack(
                "<BII", 1 if self.project_active else 0,
                self.project_size, self.project_crc))
        if cmd == CMD_LOAD_PROJECT:
            self.project_size = struct.unpack_from("<I", prop, 16)[0]
            self.project_crc = struct.unpack_from("<I", prop, 20)[0]
            self.project_active = True
            self.packets = []
            return ok_frame()
        if cmd == CMD_LOAD_PROJECT_SEND:
            offset, size = struct.unpack_from("<II", prop, 0)
            self.packets.append((offset, size))
            return ok_frame()
        if cmd == CMD_DISABLE_PROJECT:
            self.project_active = False
            return ok_frame()
        if cmd == CMD_START_OFFLINE:
            self.offline_running = True
            return ok_frame()
        if cmd == CMD_GET_OFFLINE_STATUS:
            if self.offline_error:
                return err_frame(ATError.WRITE_TIMES)
            if not self.offline_running:
                return ok_frame()
            self.offline_running = False
            return make_frame(STATUS_PROGRESS,
                              struct.pack("<II", self.project_size, self.project_size // 2))
        if cmd == CMD_SWITCH_OFFLINE_PROJECT:
            self.last_switch_prop = prop
            return ok_frame()
        if cmd == CMD_BROADCAST:
            keep, direction, size = struct.unpack_from("<BiI", prop, 0)
            return make_frame(CMD_BROADCAST, prop[:9 + size])
        return err_frame(ATError.CMD)


class LoopTransport:
    """Test transport: frames go to FakeDevice and responses feed the C core."""

    def __init__(self, feed, device):
        self.feed = feed
        self.device = device
        self.is_open = True
        self.baudrate = 9600

    def write(self, data):
        response = self.device.handle(bytes(data))
        if response:
            self.feed(response)

    def close(self):
        self.is_open = False

    def set_baudrate(self, baudrate):
        self.baudrate = baudrate


class FFITests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.lib, cls.path = load_library()

    def test_library_version(self):
        self.assertEqual(self.lib.pwat_version(), 0x00010000)

    def test_bridge_writer_info(self):
        device = FakeDevice()
        holder = {}

        def write_fn(frame, timeout):
            response = device.handle(frame)
            if response:
                holder["bridge"].feed(response)
            return True

        bridge = Bridge(self.lib, False, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            info = bridge.get_writer_info()
            self.assertEqual(info.oem, "PWTEST")
            self.assertEqual(info.hardware_version, "1.0.0")
            self.assertEqual(info.interface_version, "3.0.0")
        finally:
            bridge.close()

    def test_bridge_error_status(self):
        device = FakeDevice()
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(device.handle(frame))
            return True

        bridge = Bridge(self.lib, False, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            self.assertFalse(bridge.target_status())
            self.assertEqual(bridge.last_error(), int(ATError.TARGET_CONNECT))
        finally:
            bridge.close()

    def test_encrypted_writer_info(self):
        info = (b"PWENC\x00\x00\x00" + b"SN-ENC".ljust(32, b"\x00") +
                b"1.0.0\x00\x00\x00" + b"2.0.0\x00\x00\x00" + b"3.0.0\x00\x00\x00")
        response = make_encrypted_frame(CMD_RSP_WRITER_INFO, info)
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(response)
            return True

        bridge = Bridge(self.lib, True, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            value = bridge.get_writer_info()
            self.assertEqual(value.oem, "PWENC")
            self.assertEqual(value.interface_version, "3.0.0")
        finally:
            bridge.close()

    def test_encrypted_writer_info_custom_key(self):
        info = (b"PWCUS\x00\x00\x00" + b"SN-CUSTOM".ljust(32, b"\x00") +
                b"1.0.0\x00\x00\x00" + b"2.0.0\x00\x00\x00" + b"3.0.0\x00\x00\x00")
        response = make_encrypted_frame(
            CMD_RSP_WRITER_INFO, info, CUSTOM_ENC_KEY, CUSTOM_ENC_IV)
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(response)
            return True

        bridge = Bridge(
            self.lib, True, write_fn, library_path=self.path,
            encrypt_key=CUSTOM_ENC_KEY, encrypt_iv=CUSTOM_ENC_IV)
        holder["bridge"] = bridge
        try:
            value = bridge.get_writer_info()
            self.assertEqual(value.oem, "PWCUS")
            self.assertEqual(value.sn, "SN-CUSTOM")
        finally:
            bridge.close()
            # Restore the compile-time defaults for any later test.
            Bridge(self.lib, True, lambda frame, timeout: True,
                   library_path=self.path).close()

    def test_encrypted_writer_config_custom_key(self):
        config = bytearray(70)
        config[0:8] = b"Vendor\x00\x00"
        config[16:24] = b"Series\x00\x00"
        config[32:40] = b"Model\x00\x00\x00"
        response = make_encrypted_frame(
            CMD_RSP_WRITER_CFG, bytes(config), CUSTOM_ENC_KEY, CUSTOM_ENC_IV)
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(response)
            return True

        bridge = Bridge(
            self.lib, True, write_fn, library_path=self.path,
            encrypt_key=CUSTOM_ENC_KEY, encrypt_iv=CUSTOM_ENC_IV)
        holder["bridge"] = bridge
        try:
            value = bridge.get_writer_config()
            self.assertEqual(value.target_vendor, "Vendor")
            self.assertEqual(value.target_series, "Series")
            self.assertEqual(value.target_model, "Model")
        finally:
            bridge.close()
            Bridge(self.lib, True, lambda frame, timeout: True,
                   library_path=self.path).close()

    def test_custom_key_requires_encryption_and_both_values(self):
        with self.assertRaises(ValueError):
            PowerWriterAT(encrypt_key=CUSTOM_ENC_KEY, encrypt_iv=CUSTOM_ENC_IV)
        with self.assertRaises(ValueError):
            PowerWriterAT(
                encrypt=True, encrypt_key=CUSTOM_ENC_KEY, encrypt_iv=None)
        client = PowerWriterAT(
            encrypt=True, encrypt_key=CUSTOM_ENC_KEY.hex(),
            encrypt_iv=CUSTOM_ENC_IV.hex())
        self.assertEqual(client.encrypt_key, CUSTOM_ENC_KEY)
        self.assertEqual(client.encrypt_iv, CUSTOM_ENC_IV)

    def test_command_timeout_matches_core(self):
        # No response is provided; the C core must report ATErrorTimeout
        # after the requested 100 ms timeout.
        bridge = Bridge(self.lib, False, lambda frame, timeout: True,
                        library_path=self.path)
        try:
            with self.assertRaises(PowerWriterATError) as ctx:
                bridge.target_erase(100)
            self.assertEqual(ctx.exception.code, int(ATError.TIMEOUT))
        finally:
            bridge.close()


class ClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.lib, cls.path = load_library()

    def setUp(self):
        self.device = FakeDevice()
        self.logs = []
        self.pw = PowerWriterAT(log=lambda lvl, msg: self.logs.append((lvl, msg)))
        self.transport = LoopTransport(None, self.device)

        def factory(feed):
            self.transport.feed = feed
            return self.transport

        self.pw.open_transport(factory, "test transport")

    def tearDown(self):
        self.pw.close()

    def test_info_and_config(self):
        info = self.pw.get_writer_info()
        self.assertEqual(info.oem, "PWTEST")
        cfg = self.pw.get_writer_config()
        self.assertEqual(cfg.target_vendor, "Vendor")
        cfg.erase_type = 2
        cfg.output_vext_type = 3
        cfg.clock_type = 4
        cfg.buzzer_enable = 0
        cfg.ob_update_type = 3
        cfg.target_auto_enable = 1
        cfg.target_auto_in_debounce = 123
        cfg.target_auto_out_debounce = 456
        cfg.disable_power_ap = 1
        cfg.run_ap = 1
        cfg.power_on_debounce = 12
        cfg.power_off_debounce = 34
        cfg.reset_type = 2
        self.pw.set_writer_config(cfg)
        cfg2 = self.pw.get_writer_config()
        for field in [
            "target_vendor", "target_series", "target_model",
            "erase_type", "output_vext_type", "clock_type", "buzzer_enable",
            "ob_update_type", "target_auto_enable",
            "target_auto_in_debounce", "target_auto_out_debounce",
            "disable_power_ap", "run_ap", "power_on_debounce",
            "power_off_debounce", "reset_type",
        ]:
            self.assertEqual(getattr(cfg2, field), getattr(cfg, field), field)

    def test_connect_sends_single_command(self):
        self.device.commands.clear()
        self.pw.target_connect()
        self.assertEqual(self.device.commands, [CMD_CONNECT_TARGET])

    def test_target_flow(self):
        self.assertFalse(self.pw.target_status())
        self.assertEqual(self.pw.last_error, int(ATError.TARGET_CONNECT))
        self.pw.target_connect()
        self.assertTrue(self.pw.target_status())
        cid = self.pw.target_get_id()
        self.assertEqual(cid.hex, "1B A0 5A C3")

        payload = bytes((i * 3) & 0xFF for i in range(600))
        progress = []
        self.pw.target_write(0x0000, payload, progress=lambda p, t: progress.append((p, t)))
        self.assertEqual(progress[-1], (600, 600))
        self.assertEqual(bytes(self.device.flash[:600]), payload)
        self.assertEqual(self.pw.target_read(0x0000, 600), payload)

        self.pw.target_erase_sector(0x0000, 0x100)
        self.assertEqual(self.pw.target_read(0x0000, 16), b"\xFF" * 16)
        self.pw.target_reset()
        self.assertFalse(self.pw.target_status())

    def test_project_flow(self):
        with open(DEMO_PKG, "rb") as fp:
            data = fp.read()
        progress = []
        self.pw.project_load(
            "demo.pkg", data, progress=lambda p, t: progress.append((p, t))
        )
        self.assertEqual(progress[-1], (len(data), len(data)))
        self.assertEqual(len(self.device.packets), (len(data) + 255) // 256)

        info = self.pw.project_info()
        self.assertTrue(info.active)
        self.assertEqual(info.size, len(data))

        self.pw.offline_start()
        status = self.pw.offline_status()
        self.assertEqual(status.state, OfflineState.PROGRESS)
        self.assertIsNotNone(status.progress)
        status = self.pw.offline_status()
        self.assertEqual(status.state, OfflineState.OK)

        self.pw.project_switch("demo.pkg", reload=True)

    def test_set_baudrate(self):
        self.pw.set_baudrate(115200)
        self.assertEqual(self.device.baudrate, 115200)
        self.assertEqual(self.transport.baudrate, 115200)
        self.assertEqual(self.pw.baudrate, 115200)

    def test_erase_and_write_prepare(self):
        self.pw.target_connect()
        self.pw.target_erase(1000)
        self.assertEqual(self.device.erase_count, 1)
        self.pw.target_write_prepare(4096)

    def test_project_disable_and_switch_layout(self):
        self.pw.project_load("demo.pkg", b"1234")
        self.assertTrue(self.device.project_active)
        self.pw.project_disable()
        self.assertFalse(self.device.project_active)

        self.pw.project_switch("\u9879\u76ee.pkg", password="pw", reload=True)
        prop = self.device.last_switch_prop
        self.assertEqual(struct.unpack_from("<i", prop, 0)[0], 1)
        self.assertEqual(prop[4:6], b"pw")
        name = prop[20:].split(b"\x00", 1)[0]
        self.assertEqual(name, "\u9879\u76ee.pkg".encode("gb18030"))

    def test_offline_error_status(self):
        self.device.offline_error = True
        status = self.pw.offline_status()
        self.assertEqual(status.state, OfflineState.ERROR)
        self.assertEqual(status.error_code, int(ATError.WRITE_TIMES))

    def test_broadcast(self):
        self.assertIsNone(self.pw.broadcast(b"hello"))
        response = self.pw.broadcast(b"hello", wait_rsp=True)
        self.assertIsNotNone(response)
        self.assertEqual(response.data, b"hello")

    def test_safe_sample_workflow(self):
        logs = []
        run_sample_workflow(self.pw, destructive=False,
                            log=lambda level, msg: logs.append((level, msg)))
        self.assertTrue(any("Safe workflow complete" in msg for _, msg in logs))

    def test_destructive_sample_workflow(self):
        logs = []
        progress = []
        run_sample_workflow(
            self.pw,
            destructive=True,
            project_path=DEMO_PKG,
            project_name="demo.pkg",
            log=lambda level, msg: logs.append((level, msg)),
            progress=lambda label, p, t: progress.append((label, p, t)),
        )
        self.assertTrue(any("Full sample workflow complete" in msg for _, msg in logs))
        self.assertTrue(any(label == "Write" and p == t for label, p, t in progress))
        self.assertTrue(any(label == "Offline programming" for label, _, _ in progress))

    def test_destructive_sample_workflow_respects_step_switches(self):
        logs = []
        settings = SampleWorkflowSettings()
        settings.reset_enabled = False
        settings.write_vendor_ob_enabled = False
        settings.full_erase_enabled = False
        settings.sector_erase_enabled = False
        settings.write_enabled = False
        settings.read_ob_enabled = False
        settings.write_user_ob_enabled = False
        settings.broadcast_enabled = False
        settings.factory_sram_enabled = False
        settings.factory_flash_enabled = False
        settings.load_project_enabled = False
        settings.offline_start_enabled = False
        settings.switch_project_enabled = False
        run_sample_workflow(
            self.pw, destructive=True, settings=settings,
            log=lambda level, msg: logs.append((level, msg)))
        text = "\n".join(msg for _level, msg in logs)
        for marker in (
            "=== 6.", "=== 7.", "=== 8.", "=== 9.", "=== 10.",
            "=== 11.", "=== 12.", "=== 13.", "=== 14.", "=== 15.",
            "=== 16.", "=== 17.",
        ):
            self.assertNotIn(marker, text)
        self.assertIn("Full sample workflow complete", text)


class ErrorMatrixTests(unittest.TestCase):
    """Every client API must propagate a simulated device error code."""

    @classmethod
    def setUpClass(cls):
        cls.lib, cls.path = load_library()

    def setUp(self):
        self.device = FakeDevice()
        self.client = PowerWriterAT(log=lambda level, msg: None)
        self.transport = LoopTransport(None, self.device)

        def factory(feed):
            self.transport.feed = feed
            return self.transport

        self.client.open_transport(factory, "simulated")
        self.device.connected = True

    def tearDown(self):
        self.client.close()

    def assert_error(self, command, code, func):
        self.device.error_overrides = {command: int(code)}
        try:
            with self.assertRaises(PowerWriterATError) as ctx:
                func()
            self.assertEqual(ctx.exception.code, int(code),
                             "command %d" % command)
        finally:
            self.device.error_overrides = {}

    def test_error_code_matrix(self):
        cases = [
            (CMD_GET_WRITER_INFO, ATError.CRC,
             lambda: self.client.get_writer_info()),
            (CMD_GET_WRITER_CFG, ATError.OFFLINE_DISABLE,
             lambda: self.client.get_writer_config()),
            (CMD_SET_WRITER_CFG, ATError.WRITER_CONFIG,
             lambda: self.client.set_writer_config(WriterConfig())),
            (CMD_SET_BAUDRATE, ATError.BAUDRATE,
             lambda: self.client.set_baudrate(115200)),
            (CMD_CONNECT_TARGET, ATError.TARGET_CONNECT,
             lambda: self.client.target_connect()),
            (CMD_GET_TARGET_CHIP_ID, ATError.READ_CHIP_ID,
             lambda: self.client.target_get_id()),
            (CMD_READ_TARGET_MEMORY, ATError.TARGET_READ,
             lambda: self.client.target_read(0, 16)),
            (CMD_ERASE_TARGET, ATError.TARGET_ERASE,
             lambda: self.client.target_erase(1000)),
            (CMD_ERASE_TARGET_SECTORS, ATError.TARGET_ERASE,
             lambda: self.client.target_erase_sector(0, 0x100, 1000)),
            (CMD_WRITE_TARGET_MEMORY_PREPARE, ATError.TARGET_WRITE,
             lambda: self.client.target_write_prepare(16)),
            (CMD_WRITE_TARGET_MEMORY, ATError.TARGET_WRITE,
             lambda: self.client.target_write(0, b"\xAA", prepare=False)),
            (CMD_READ_TARGET_OPTION_BYTE, ATError.TARGET_OB,
             lambda: self.client.target_read_ob()),
            (CMD_WRITE_TARGET_VENDOR_OPTION_BYTE, ATError.WRITE_OB,
             lambda: self.client.target_write_vendor_ob()),
            (CMD_WRITE_TARGET_USER_OPTION_BYTE, ATError.WRITE_OB,
             lambda: self.client.target_write_user_ob()),
            (CMD_TARGET_RESET, ATError.TARGET_CONNECT,
             lambda: self.client.target_reset()),
            (CMD_GET_PROJECT_INFO, ATError.OFFLINE_DISABLE,
             lambda: self.client.project_info()),
            (CMD_DISABLE_PROJECT, ATError.OFFLINE_DISABLE,
             lambda: self.client.project_disable()),
            (CMD_LOAD_PROJECT, ATError.OFFLINE_DATA,
             lambda: self.client.project_load("x.pkg", b"1234")),
            (CMD_START_OFFLINE, ATError.OFFLINE_DISABLE,
             lambda: self.client.offline_start()),
            (CMD_SWITCH_OFFLINE_PROJECT, ATError.OFFLINE_OEM,
             lambda: self.client.project_switch("x.pkg")),
            (CMD_BROADCAST, ATError.AT_UART_DISABLE,
             lambda: self.client.broadcast(b"hi", wait_rsp=True)),
            (CMD_FACTORY_RUN_SRAM_FW, ATError.FACTORY_TEST_DISABLE,
             lambda: self.client.factory_run_sram_fw()),
            (CMD_FACTORY_RUN_FLASH_FW, ATError.FACTORY_TEST_FLASH_FW_NONE,
             lambda: self.client.factory_run_flash_fw()),
        ]
        for command, code, func in cases:
            self.assert_error(command, code, func)

    def test_status_queries_return_error_state(self):
        self.device.error_overrides = {
            CMD_GET_TARGET_STATUS: int(ATError.TARGET_CONNECT)}
        self.assertFalse(self.client.target_status())
        self.assertEqual(self.client.last_error, int(ATError.TARGET_CONNECT))
        self.device.error_overrides = {
            CMD_GET_OFFLINE_STATUS: int(ATError.WRITE_TIMES)}
        status = self.client.offline_status()
        self.assertEqual(status.state, OfflineState.ERROR)
        self.assertEqual(status.error_code, int(ATError.WRITE_TIMES))
        self.device.error_overrides = {}

    def test_unexpected_response_type(self):
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(ok_frame())
            return True

        bridge = Bridge(self.lib, False, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            with self.assertRaises(PowerWriterATError) as ctx:
                bridge.get_writer_info()
            self.assertEqual(ctx.exception.code, int(ATError.CMD))
        finally:
            bridge.close()

    def test_bad_crc_is_rejected(self):
        bad = bytearray(ok_frame())
        bad[-1] ^= 0xFF
        holder = {}

        def write_fn(frame, timeout):
            holder["bridge"].feed(bytes(bad))
            return True

        bridge = Bridge(self.lib, False, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            with self.assertRaises(PowerWriterATError) as ctx:
                bridge.target_erase(100)
            self.assertEqual(ctx.exception.code, int(ATError.TIMEOUT))
        finally:
            bridge.close()

    def test_bad_crc_then_good_frame_recovers(self):
        bad = bytearray(ok_frame())
        bad[-1] ^= 0xFF
        good = ok_frame()
        holder = {}
        timers = []

        def write_fn(frame, timeout):
            bridge = holder["bridge"]
            # The C core resets its RX buffer when a CRC error is detected.
            # Deliver the good frame separately after the reset.
            bridge.feed(bytes(bad))
            timer = threading.Timer(0.02, lambda: bridge.feed(good))
            timer.start()
            timers.append(timer)
            return True

        bridge = Bridge(self.lib, False, write_fn, library_path=self.path)
        holder["bridge"] = bridge
        try:
            bridge.target_erase(500)
            self.assertEqual(bridge.last_error(), int(ATError.NONE))
        finally:
            for timer in timers:
                timer.cancel()
            bridge.close()


class _CliTestBase(unittest.TestCase):
    """Shared setup for CLI simulation tests."""

    def setUp(self):
        self.device = FakeDevice()
        self.client = PowerWriterAT(log=lambda level, msg: None)
        self.transport = LoopTransport(None, self.device)

        def factory(feed):
            self.transport.feed = feed
            return self.transport

        self.client.open_transport(factory, "simulated")

        @contextlib.contextmanager
        def fake_open_device(args, log=None):
            yield self.client

        self._original_open = cli.open_device
        cli.open_device = fake_open_device

    def tearDown(self):
        cli.open_device = self._original_open
        self.client.close()

    def run_cli(self, *args, expected=0):
        argv = ["--port", "FAKE", "--quiet"] + list(args)
        out, err = io.StringIO(), io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
            code = cli.main(argv)
        if code != expected:
            self.fail("CLI %r returned %d (expected %d)\nstdout:\n%s\nstderr:\n%s"
                      % (args, code, expected, out.getvalue(), err.getvalue()))
        return out.getvalue(), err.getvalue()


class CliSimulationTests(_CliTestBase):
    """
    Run every CLI command against a device that returns normal responses.

    This checks the CLI handlers (argument handling, confirmation, output,
    exit codes) without hardware.
    """

    def test_all_cli_commands_with_normal_responses(self):
        self.run_cli("info")
        self.run_cli("config-get")
        self.run_cli("config-set", "--clock", "5", "--buzzer", "off")
        self.run_cli("connect")
        self.run_cli("status")
        self.run_cli("id")
        self.run_cli("read", "0x0000", "16")
        self.run_cli("write-prepare", "256")

        with tempfile.NamedTemporaryFile(delete=False, suffix=".bin") as fp:
            fp.write(bytes(range(32)))
            temp_path = fp.name
        try:
            self.run_cli("write", "0x0000", temp_path, "--verify", "-y")
            self.run_cli("read", "0x0000", "32")
        finally:
            os.unlink(temp_path)

        self.run_cli("erase", "-y")
        self.run_cli("erase-sector", "0x0000", "0x100", "-y")
        self.run_cli("ob-read")
        self.run_cli("ob-write-vendor", "-y")
        self.run_cli("ob-write-user", "-y")
        self.run_cli("reset")

        self.run_cli("connect")
        self.run_cli("project-info")
        self.run_cli("project-load", DEMO_PKG, "--name", "demo.pkg", "-y")
        self.run_cli("project-info")
        self.run_cli("project-disable", "-y")
        self.run_cli("project-load", DEMO_PKG, "--name", "demo.pkg", "-y")
        self.run_cli("offline-status")
        self.run_cli("offline-start", "-y")
        self.run_cli("offline-status")
        self.run_cli("offline-status")
        self.run_cli("project-switch", "demo.pkg", "--reload")

        self.run_cli("broadcast", "hello")
        self.run_cli("broadcast", "01 02 03", "--hex", "--wait-rsp")
        self.run_cli("factory-sram")
        self.run_cli("factory-flash")
        self.run_cli("set-baud", "115200")

        self.run_cli("benchmark")
        self.run_cli("benchmark", "--destructive", "-y")

        self.run_cli("about")
        self.run_cli("guide")
        self.run_cli("doctor")

    def test_cpp_style_commands(self):
        self.run_cli("-info")
        self.run_cli("-cfg")
        self.run_cli("-connect")
        self.run_cli("-status")
        self.run_cli("-cid")
        self.run_cli("-read", "-addr", "0x0000", "-s", "16")
        self.run_cli("-erase", "-t", "1000")
        self.run_cli("-erase", "-t", "1000", "-addr", "0x0000", "-s", "0x100")
        self.run_cli("-read-ob")
        self.run_cli("-write-vob", "-t", "1000")
        self.run_cli("-write-uob", "-t", "1000")
        self.run_cli("-reset", "-type", "3")
        self.run_cli("-prj-info")
        self.run_cli("-prj-ld", "-f", DEMO_PKG)
        self.run_cli("-prj-dis")
        self.run_cli("-prj-ld", "-f", DEMO_PKG)
        self.run_cli("-start")
        self.run_cli("-offline-status")
        self.run_cli("-prj-sw", "-mode", "1", "-f", DEMO_PKG)
        self.run_cli("-bcst", "-data", "hello", "-dir", "usbtouart")
        self.run_cli("-bcst", "-data", "hello", "-dir", "uarttousb",
                     "-wtrsp", "true")
        self.run_cli("-factory-sram-fw", "-t", "1000")
        self.run_cli("-factory-flash-fw", "-t", "1000")
        self.run_cli("-sleep", "-t", "1")

        with tempfile.NamedTemporaryFile(
                mode="w", suffix=".json", delete=False) as fp:
            fp.write('''{
  "names": {"vendor": "Vendor", "series": "Series", "model": "Model"},
  "base config": {"erase": 1, "vext": 1, "clock": 1,
                  "buzzer": false, "option byte type": 3},
  "offline config": {"limit enable": false, "limit number": 1,
                     "auto": false, "in debounce(ms)": 250,
                     "out debounce(ms)": 250},
  "output config": {"disable power after programming": false,
                    "run target after programming": true,
                    "power on debounce(ms)": 100,
                    "power off debounce(ms)": 100,
                    "reset pin ctrl": 1}
}''')
            cfg_path = fp.name
        try:
            self.run_cli("-setcfg", "-f", cfg_path)
        finally:
            os.unlink(cfg_path)

        self.run_cli("-help")

    def test_cpp_style_command_sequences(self):
        self.device.commands.clear()
        self.run_cli("-connect")
        self.assertEqual(self.device.commands, [CMD_CONNECT_TARGET])

        self.device.commands.clear()
        self.run_cli("-read", "-addr", "0x0000", "-s", "16")
        self.assertEqual(self.device.commands, [CMD_READ_TARGET_MEMORY])

        self.device.commands.clear()
        self.run_cli("-start")
        self.assertEqual(self.device.commands, [CMD_START_OFFLINE])

        self.device.commands.clear()
        self.run_cli("-offline-status")
        self.assertEqual(self.device.commands, [CMD_GET_OFFLINE_STATUS])

    def test_command_sequences_match_cpp_cli(self):
        """Each CLI command must send only the AT commands it represents."""
        self.device.commands.clear()
        self.run_cli("connect")
        self.assertEqual(self.device.commands, [CMD_CONNECT_TARGET])

        self.device.commands.clear()
        self.run_cli("read", "0x0000", "16")
        self.assertEqual(self.device.commands, [CMD_READ_TARGET_MEMORY])

        self.device.commands.clear()
        self.run_cli("reset")
        self.assertEqual(self.device.commands, [CMD_TARGET_RESET])

        self.device.commands.clear()
        self.run_cli("offline-start", "-y")
        self.assertEqual(self.device.commands, [CMD_START_OFFLINE])

        self.device.commands.clear()
        self.run_cli("offline-status")
        self.assertEqual(self.device.commands, [CMD_GET_OFFLINE_STATUS])
        self.run_cli("list")


class CliErrorTests(_CliTestBase):
    """Every CLI command must surface a simulated device error correctly."""

    def run_error(self, args, command, code, expected_text):
        self.device.error_overrides = {command: int(code)}
        try:
            out, err = self.run_cli(*args, expected=1)
        finally:
            self.device.error_overrides = {}
        self.assertIn(expected_text, out + err)

    def test_error_messages(self):
        self.run_error(("info",), CMD_GET_WRITER_INFO,
                       ATError.CRC, "Data CRC check failed")
        self.run_error(("config-get",), CMD_GET_WRITER_CFG,
                       ATError.OFFLINE_DISABLE, "Offline project is disabled")
        self.run_error(("config-set", "--clock", "5"), CMD_SET_WRITER_CFG,
                       ATError.WRITER_CONFIG, "Configuration error")
        self.run_error(("set-baud", "115200"), CMD_SET_BAUDRATE,
                       ATError.BAUDRATE, "Invalid AT baud rate")
        self.run_error(("connect",), CMD_CONNECT_TARGET,
                       ATError.TARGET_CONNECT, "Target chip not connected")
        self.run_error(("status",), CMD_GET_TARGET_STATUS,
                       ATError.TARGET_CONNECT, "Target chip not connected")
        self.run_error(("id",), CMD_GET_TARGET_CHIP_ID,
                       ATError.TARGET_CONNECT, "Target chip not connected")
        self.run_error(("read", "0x0000", "16"), CMD_READ_TARGET_MEMORY,
                       ATError.TARGET_READ, "Target chip read failed")
        self.run_error(("erase", "-y"), CMD_ERASE_TARGET,
                       ATError.TARGET_ERASE, "Target chip erase failed")
        self.run_error(("erase-sector", "0x0000", "0x100", "-y"),
                       CMD_ERASE_TARGET_SECTORS,
                       ATError.TARGET_ERASE, "Target chip erase failed")
        self.run_error(("ob-read",), CMD_READ_TARGET_OPTION_BYTE,
                       ATError.TARGET_OB, "Target chip OptionByte configuration error")
        self.run_error(("ob-write-vendor", "-y"),
                       CMD_WRITE_TARGET_VENDOR_OPTION_BYTE,
                       ATError.WRITE_OB, "Failed to write OptionByte")
        self.run_error(("reset",), CMD_TARGET_RESET,
                       ATError.TARGET_CONNECT, "Target chip not connected")
        self.run_error(("project-info",), CMD_GET_PROJECT_INFO,
                       ATError.OFFLINE_DISABLE, "Offline project is disabled")
        self.run_error(("project-disable", "-y"), CMD_DISABLE_PROJECT,
                       ATError.OFFLINE_DISABLE, "Offline project is disabled")
        self.run_error(("project-load", DEMO_PKG, "-y"), CMD_LOAD_PROJECT,
                       ATError.OFFLINE_DATA, "Offline project data is corrupted")
        self.run_error(("offline-start", "-y"), CMD_START_OFFLINE,
                       ATError.OFFLINE_DISABLE, "Offline project is disabled")
        self.run_error(("offline-status",), CMD_GET_OFFLINE_STATUS,
                       ATError.WRITE_TIMES, "Offline programming count exhausted")
        self.run_error(("project-switch", "demo.pkg"),
                       CMD_SWITCH_OFFLINE_PROJECT,
                       ATError.OFFLINE_OEM, "Invalid offline project OEM")
        self.run_error(("broadcast", "hi", "--wait-rsp"), CMD_BROADCAST,
                       ATError.AT_UART_DISABLE, "AT UART feature is not enabled")
        self.run_error(("factory-sram",), CMD_FACTORY_RUN_SRAM_FW,
                       ATError.FACTORY_TEST_DISABLE, "Factory test is not enabled")
        self.run_error(("factory-flash",), CMD_FACTORY_RUN_FLASH_FW,
                       ATError.FACTORY_TEST_FLASH_FW_NONE,
                       "FACTORY_TEST_FLASH_FW_NONE")

        with tempfile.NamedTemporaryFile(delete=False, suffix=".bin") as fp:
            fp.write(b"\xAA" * 16)
            temp_path = fp.name
        try:
            self.run_error(("write", "0x0000", temp_path, "-y"),
                           CMD_WRITE_TARGET_MEMORY_PREPARE,
                           ATError.TARGET_WRITE, "Target chip write failed")
        finally:
            os.unlink(temp_path)


if __name__ == "__main__":
    unittest.main(verbosity=2)
