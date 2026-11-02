# -*- coding: utf-8 -*-
"""Capture GUI screenshots for the user manual with simulated device data."""

from __future__ import annotations

import ctypes
import sys
import time
import tkinter as tk
from ctypes import wintypes
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from powerwriter_at_gui import PowerWriterGui  # noqa: E402
from pw_at.models import ProjectInfo, WriterConfig, WriterInfo  # noqa: E402

OUT = ROOT / "docs" / "images"
OUT.mkdir(parents=True, exist_ok=True)


class DummyClient:
    is_open = True
    port = "COM3"
    library_path = "powerwriter_at.dll"
    library_version = 0x00010000
    encrypt = False
    writer_info = None

    def close(self):
        pass


class BITMAPINFOHEADER(ctypes.Structure):
    _fields_ = [
        ("biSize", wintypes.DWORD),
        ("biWidth", wintypes.LONG),
        ("biHeight", wintypes.LONG),
        ("biPlanes", wintypes.WORD),
        ("biBitCount", wintypes.WORD),
        ("biCompression", wintypes.DWORD),
        ("biSizeImage", wintypes.DWORD),
        ("biXPelsPerMeter", wintypes.LONG),
        ("biYPelsPerMeter", wintypes.LONG),
        ("biClrUsed", wintypes.DWORD),
        ("biClrImportant", wintypes.DWORD),
    ]


class BITMAPINFO(ctypes.Structure):
    _fields_ = [
        ("bmiHeader", BITMAPINFOHEADER),
        ("bmiColors", wintypes.DWORD * 3),
    ]


def capture_window(hwnd: int) -> tuple[Image.Image, int]:
    user32 = ctypes.windll.user32
    gdi32 = ctypes.windll.gdi32
    rect = wintypes.RECT()
    user32.GetClientRect(hwnd, ctypes.byref(rect))
    width, height = rect.right, rect.bottom
    hdc = user32.GetDC(hwnd)
    memdc = gdi32.CreateCompatibleDC(hdc)
    bitmap = gdi32.CreateCompatibleBitmap(hdc, width, height)
    old = gdi32.SelectObject(memdc, bitmap)
    ok = user32.PrintWindow(hwnd, memdc, 2)
    info = BITMAPINFO()
    info.bmiHeader.biSize = ctypes.sizeof(BITMAPINFOHEADER)
    info.bmiHeader.biWidth = width
    info.bmiHeader.biHeight = -height
    info.bmiHeader.biPlanes = 1
    info.bmiHeader.biBitCount = 32
    info.bmiHeader.biCompression = 0
    buffer = ctypes.create_string_buffer(width * height * 4)
    gdi32.GetDIBits(memdc, bitmap, 0, height, buffer,
                    ctypes.byref(info), 0)
    gdi32.SelectObject(memdc, old)
    gdi32.DeleteObject(bitmap)
    gdi32.DeleteDC(memdc)
    user32.ReleaseDC(hwnd, hdc)
    return Image.frombuffer("RGB", (width, height), buffer,
                            "raw", "BGRX", 0, 1), ok


def add_log(app: PowerWriterGui, tag: str, text: str) -> None:
    app.log_text.configure(state="normal")
    app.log_text.insert("end", text + "\n", tag)
    app.log_text.see("end")
    app.log_text.configure(state="disabled")


def main() -> int:
    root = tk.Tk()
    root.title("PowerWriter AT Commander")
    root.geometry("1440x920+30+30")
    app = PowerWriterGui(root)
    root.update_idletasks()

    client = DummyClient()
    app.client = client
    app._apply_info(WriterInfo(
        oem="PWX1",
        sn="DEMO000000000000",
        hardware_version="1.2",
        bootloader_version="1.00.02",
        interface_version="1.00.54",
    ))
    app._apply_config(WriterConfig(
        target_vendor="STM32",
        target_series="STM32F0 Series",
        target_model="STM32F071xB",
        erase_type=1,
        output_vext_type=1,
        clock_type=1,
        buzzer_enable=1,
        ob_update_type=3,
        limit_number_enable=0,
        limit_number=1,
        target_auto_enable=0,
        target_auto_in_debounce=100,
        target_auto_out_debounce=100,
        disable_power_ap=0,
        run_ap=1,
        power_on_debounce=100,
        power_off_debounce=100,
        reset_type=1,
    ))
    app._apply_project_info(ProjectInfo(
        activate=1, size=23602, crc32=0xFAFEF9BE))
    app.port_var.set("COM3")
    app._set_conn_status("Connected: COM3 (PWX1)", ok=True)
    app._set_target_status(True)
    app.target_id_var.set("1B A0 5A C3")
    app.read_info_var.set("16 bytes @ 0x08000000")
    app.proj_file_var.set("stm32f071.pkg")
    app.proj_name_var.set("stm32f071.pkg")
    app.proj_encoding_var.set("auto")
    app.switch_name_var.set("stm32f071.pkg")
    app.read_addr_var.set("0x08000000")
    app.read_size_var.set("16")
    app.write_addr_var.set("0x08000000")
    app.write_file_var.set("app.bin")
    app.broadcast_text.delete("1.0", "end")
    app.broadcast_text.insert("1.0", "Hello PowerWriter")
    app.broadcast_response.configure(state="normal")
    app.broadcast_response.delete("1.0", "end")
    app.broadcast_response.insert(
        "1.0", "PowerWriter AT broadcast demo response")
    app.broadcast_response.configure(state="disabled")
    app.read_text.configure(state="normal")
    app.read_text.delete("1.0", "end")
    app.read_text.insert(
        "1.0",
        "08000000  02 03 54 02 26 12 05 07 09 0D 11 02 26 50 A2 3D  |..T.&.......&P.=|",
    )
    app.read_text.configure(state="disabled")
    app.demo_status_var.set("Ready")

    for tag, message in (
        ("info", "[Info] Connected to COM3 (PWX1)"),
        ("info", "[Info] Offline project loaded: stm32f071.pkg (23602 bytes)"),
        ("info", "[Info] Project status: valid, CRC32=0xFAFEF9BE"),
        ("info", "[Info] Target connected"),
        ("info", "[Info] Read 16 bytes @ 0x08000000"),
    ):
        add_log(app, tag, message)

    # Hide the whole log pane so the tab content is fully visible.
    app.log_text.master.master.pack_forget()
    root.attributes("-topmost", True)
    root.lift()
    root.update()

    tabs = [
        (0, "gui_01_device_info.png"),
        (1, "gui_02_device_config.png"),
        (2, "gui_03_target_chip.png"),
        (3, "gui_04_offline_project.png"),
        (4, "gui_05_broadcast.png"),
        (5, "gui_06_sample_workflow.png"),
    ]
    for index, filename in tabs:
        app.notebook.select(index)
        root.update_idletasks()
        root.update()
        time.sleep(0.35)
        hwnd = ctypes.windll.user32.GetAncestor(root.winfo_id(), 2)
        if not hwnd:
            hwnd = root.winfo_id()
        image, ok = capture_window(hwnd)
        image.save(OUT / filename)
        print("saved", OUT / filename, image.size, "PrintWindow", ok)

    root.destroy()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
