# -*- coding: utf-8 -*-
"""
GUI simulation test.

A simulated PowerWriter returns realistic responses for every command. The
test drives the GUI buttons/handlers and verifies the resulting widget state,
so the downstream GUI logic is exercised without hardware.

The test is skipped automatically when Tk cannot create a window (headless CI).
"""

import os
import sys
import tempfile
import time
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)
sys.path.insert(0, HERE)

from pw_at import ATError, PowerWriterAT   # noqa: E402
from pw_at.i18n import LANGUAGE_NAMES      # noqa: E402
from pw_at.models import WriterConfig      # noqa: E402
from test_bridge import (                  # noqa: E402
    CMD_BROADCAST,
    CMD_CONNECT_TARGET,
    CMD_GET_WRITER_INFO,
    CMD_READ_TARGET_MEMORY,
    DEMO_PKG,
    FakeDevice,
    LoopTransport,
)

try:
    import tkinter as tk
    import powerwriter_at_gui as gui_module
    TK_AVAILABLE = True
except Exception:  # ImportError, TclError, ...
    tk = None
    gui_module = None
    TK_AVAILABLE = False


class GuiSimulationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not TK_AVAILABLE:
            raise unittest.SkipTest("tkinter is not available")
        # macOS hangs when a Tk root is destroyed and a new one is created in
        # the same process, so create one root for the whole test class and
        # rebuild only the widgets for each test.
        try:
            cls.root = tk.Tk()
        except tk.TclError as exc:
            raise unittest.SkipTest("Tk display unavailable: %s" % exc)
        cls.root.withdraw()
        cls.root.update_idletasks()

    @classmethod
    def tearDownClass(cls):
        root = getattr(cls, "root", None)
        if root is not None:
            try:
                root.destroy()
            except Exception:
                pass
            cls.root = None

    def setUp(self):
        self.root = self.__class__.root
        self.root.withdraw()

        self.dialogs = []
        self.errors = []
        self._dialog_backup = {
            "askyesno": gui_module.messagebox.askyesno,
            "showinfo": gui_module.messagebox.showinfo,
            "showwarning": gui_module.messagebox.showwarning,
            "showerror": gui_module.messagebox.showerror,
        }
        gui_module.messagebox.askyesno = lambda *a, **k: True
        gui_module.messagebox.showinfo = (
            lambda *a, **k: self.dialogs.append(("info", a)))
        gui_module.messagebox.showwarning = (
            lambda *a, **k: self.dialogs.append(("warning", a)))
        gui_module.messagebox.showerror = (
            lambda *a, **k: self.errors.append(("error", a)))

        self.app = gui_module.PowerWriterGui(
            self.root, language="en", maximized=False)
        self.device = FakeDevice()
        self.client = PowerWriterAT(log=self.app._log_cb)
        self.transport = LoopTransport(None, self.device)

        def factory(feed):
            self.transport.feed = feed
            return self.transport

        self.client.open_transport(factory, "simulated")
        self.app.client = self.client
        self.app._set_conn_status("Simulated device", ok=True)
        self.app._update_conn_buttons()
        self.root.update()

    def tearDown(self):
        app = getattr(self, "app", None)
        if app is not None:
            if getattr(app, "_poll_after_id", None):
                try:
                    self.root.after_cancel(app._poll_after_id)
                except Exception:
                    pass
                app._poll_after_id = None
            try:
                app._on_disconnect()
            except Exception:
                pass
        for name, func in getattr(self, "_dialog_backup", {}).items():
            setattr(gui_module.messagebox, name, func)
        # Keep the single Tk root alive; remove only this test's widgets so
        # the next test starts with a clean window.
        for child in self.root.winfo_children():
            try:
                child.destroy()
            except Exception:
                pass
        try:
            self.root.update_idletasks()
        except Exception:
            pass

    def wait_idle(self, timeout=30.0, expect_errors=False):
        deadline = time.time() + timeout
        while time.time() < deadline:
            self.root.update()
            if not self.app.busy and self.app.queue.empty():
                break
            time.sleep(0.02)
        self.root.update()
        if self.app.busy:
            self.fail("GUI task did not finish within %.1f s" % timeout)
        if self.errors and not expect_errors:
            self.fail("GUI reported errors: %r\nlog:\n%s"
                      % (self.errors, self.app.log_text.get("1.0", "end")))

    def test_all_gui_handlers_with_simulated_responses(self):
        app = self.app

        # Device information and configuration
        app._read_info()
        self.wait_idle()
        self.assertEqual(app.info_vars["oem"].get(), "PWTEST")
        self.assertEqual(app.info_vars["sn"].get(), "SN-0001")
        self.assertEqual(app.cfg_vendor.get(), "Vendor")
        self.assertEqual(app.cfg_series.get(), "Series")
        self.assertEqual(app.cfg_model.get(), "Model")

        app._read_config()
        self.wait_idle()
        app.cfg_buzzer.set(0)
        app._write_config()
        self.wait_idle()
        self.assertEqual(self.device.config[32:37], b"Model")
        app.cfg_buzzer.set(1)
        app._write_config()
        self.wait_idle()

        app.new_baud_var.set("115200")
        app._set_baud()
        self.wait_idle()
        self.assertEqual(app.baud_var.get(), "115200")
        self.assertEqual(self.transport.baudrate, 115200)

        # Target connection, ID, memory, OB
        app._target_connect()
        self.wait_idle()
        self.assertEqual(app.target_status_var.get(), "Connect command sent")

        app._target_id()
        self.wait_idle()
        self.assertEqual(app.target_id_var.get(), "1B A0 5A C3")

        app.read_addr_var.set("0x0000")
        app.read_size_var.set("16")
        app._read_memory()
        self.wait_idle()
        self.assertIsNotNone(app._last_read)
        self.assertEqual(len(app._last_read[1]), 16)
        self.assertIn("FF FF FF FF", app.read_text.get("1.0", "end"))

        app._read_ob()
        self.wait_idle()
        self.assertIn("01 02 03 04", app.ob_label.cget("text"))

        # Writes, erase, OptionByte
        with tempfile.NamedTemporaryFile(delete=False, suffix=".bin") as fp:
            pattern = bytes(range(32))
            fp.write(pattern)
            temp_path = fp.name
        try:
            app.write_addr_var.set("0x0000")
            app.write_file_var.set(temp_path)
            app.write_verify_var.set(True)
            app.write_prepare_var.set(True)
            app._write_memory()
            self.wait_idle()
            self.assertEqual(bytes(self.device.flash[:32]), pattern)
            self.assertIn("passed", app.write_status_var.get())
        finally:
            os.unlink(temp_path)

        app.erase_addr_var.set("0x0000")
        app.erase_size_var.set("0x100")
        app._erase_sector()
        self.wait_idle()
        self.assertEqual(bytes(self.device.flash[:16]), b"\xFF" * 16)

        app._erase_chip()
        self.wait_idle()
        self.assertEqual(self.device.erase_count, 1)

        app._write_vendor_ob()
        self.wait_idle()
        app._write_user_ob()
        self.wait_idle()

        # Offline project flow
        app._project_refresh()
        self.wait_idle()
        app.proj_file_var.set(DEMO_PKG)
        app.proj_name_var.set("demo.pkg")
        app.proj_encoding_var.set("auto")
        app._project_load()
        self.wait_idle()
        self.assertTrue(self.device.project_active)
        self.assertEqual(app.proj_active_var.get(), "Valid")
        self.assertIn("10924", app.proj_size_var.get())

        app._project_disable()
        self.wait_idle()
        self.assertFalse(self.device.project_active)

        app._project_load()
        self.wait_idle()
        app._offline_start()
        self.wait_idle()
        self.assertEqual(app.offline_status_var.get(), "Offline write completed")

        app._offline_query()
        self.wait_idle()
        self.assertEqual(app.offline_status_var.get(), "Offline write completed")
        app.switch_name_var.set("demo.pkg")
        app._project_switch()
        self.wait_idle()
        self.assertTrue(any(
            "Project switched successfully" in dialog[1][1]
            for dialog in self.dialogs))

        # Broadcast
        app.broadcast_text.delete("1.0", "end")
        app.broadcast_text.insert("1.0", "hello")
        app.broadcast_hex_var.set(False)
        app.broadcast_wait_var.set(True)
        app._broadcast_send()
        self.wait_idle()
        response_text = app.broadcast_response.get("1.0", "end")
        self.assertIn("68 65 6C 6C 6F", response_text)

        # Factory firmware and reset
        app._factory_sram()
        self.wait_idle()
        app._factory_flash()
        self.wait_idle()
        app._target_reset()
        self.wait_idle()
        self.assertIn("Not connected", app.target_status_var.get())

        # About dialog
        app._show_about()
        self.assertTrue(self.dialogs)

        # Shared sample workflow (safe and destructive)
        app._run_demo(False)
        self.wait_idle()
        self.assertEqual(app.demo_status_var.get(), "Done")

        app._run_demo(True)
        self.wait_idle(timeout=60.0)
        self.assertEqual(app.demo_status_var.get(), "Done")

    def test_language_switch_updates_widgets(self):
        app = self.app
        app.language_var.set(LANGUAGE_NAMES["zh-CN"])
        app._on_language_change()
        translated = app._t("Connection")
        self.assertNotEqual(translated, "Connection")
        texts = []
        for widget in [app.main, *app._walk_widgets(app.main)]:
            try:
                texts.append(widget.cget("text"))
            except Exception:
                pass
        self.assertTrue(any(translated in text for text in texts))

        app.language_var.set("English")
        app._on_language_change()
        self.assertEqual(app._t("Connection"), "Connection")

    def test_language_selector_lists_all_languages(self):
        app = self.app
        values = list(app.language_combo["values"])
        self.assertEqual(len(values), len(LANGUAGE_NAMES))
        self.assertIn("Русский", values)
        self.assertIn("हिन्दी", values)
        self.assertGreaterEqual(int(app.language_combo.cget("height")), 24)

    def test_reset_pin_config_accepts_all_modes(self):
        app = self.app
        for value in range(8):
            app._apply_config(WriterConfig(reset_type=value))
            self.assertEqual(app._collect_config().reset_type, value)

    def test_hex_multi_segment_write(self):
        def record(address, record_type, payload):
            body = bytes([
                len(payload), (address >> 8) & 0xFF, address & 0xFF,
                record_type,
            ]) + bytes(payload)
            return ":" + (body + bytes([(-sum(body)) & 0xFF])).hex().upper()

        content = "\n".join([
            record(0, 0x00, b"\x11\x22"),
            record(0x10, 0x00, b"\x33\x44"),
            record(0, 0x01, b""),
        ]) + "\n"
        with tempfile.NamedTemporaryFile(
                mode="w", delete=False, suffix=".hex", encoding="ascii") as fp:
            fp.write(content)
            temp_path = fp.name
        try:
            app = self.app
            app._target_connect()
            self.wait_idle()
            app.write_file_var.set(temp_path)
            app.write_addr_var.set("0xDEADBEEF")
            app.write_verify_var.set(True)
            app.write_prepare_var.set(True)
            app._write_memory()
            self.wait_idle()
            self.assertEqual(bytes(self.device.flash[:2]), b"\x11\x22")
            self.assertEqual(bytes(self.device.flash[0x10:0x12]), b"\x33\x44")
            self.assertIn("passed", app.write_status_var.get())
        finally:
            os.unlink(temp_path)

    def test_gui_error_handling_with_simulated_errors(self):
        app = self.app
        device = self.device

        device.error_overrides = {CMD_GET_WRITER_INFO: int(ATError.CRC)}
        app._read_info()
        self.wait_idle(expect_errors=True)
        self.assertTrue(self.errors)
        self.assertIn("Data CRC check failed", self.errors[-1][1][1])
        self.errors.clear()
        device.error_overrides = {}

        device.error_overrides = {
            CMD_CONNECT_TARGET: int(ATError.TARGET_CONNECT)}
        app._target_connect()
        self.wait_idle(expect_errors=True)
        self.assertTrue(self.errors)
        self.assertIn("Target chip not connected", self.errors[-1][1][1])
        self.errors.clear()
        device.error_overrides = {}

        device.connected = True
        device.error_overrides = {
            CMD_READ_TARGET_MEMORY: int(ATError.TARGET_READ)}
        app.read_addr_var.set("0x0000")
        app.read_size_var.set("16")
        app._read_memory()
        self.wait_idle(expect_errors=True)
        self.assertTrue(self.errors)
        self.assertIn("Target chip read failed", self.errors[-1][1][1])
        self.errors.clear()
        device.error_overrides = {}

        device.error_overrides = {CMD_BROADCAST: int(ATError.AT_UART_DISABLE)}
        app.broadcast_text.delete("1.0", "end")
        app.broadcast_text.insert("1.0", "hi")
        app.broadcast_wait_var.set(True)
        app._broadcast_send()
        self.wait_idle(expect_errors=True)
        self.assertTrue(self.errors)
        self.assertIn("AT UART feature is not enabled", self.errors[-1][1][1])
        self.errors.clear()
        device.error_overrides = {}


if __name__ == "__main__":
    unittest.main(verbosity=2)
