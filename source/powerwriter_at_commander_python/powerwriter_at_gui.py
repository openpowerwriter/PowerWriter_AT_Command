#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PowerWriter AT Commander - graphical version.

Built with tkinter/ttk from the Python standard library and calls the C core
through ctypes. Long-running operations execute on worker threads and the UI
is refreshed through a queue, so the Tk main loop never blocks.

Before running:
    1. Build the shared library (build_windows.bat / build_linux.sh /
       build_macos.sh).
    2. python powerwriter_at_gui.py
"""

from __future__ import annotations

import queue
import secrets
import sys
import threading
import time
import traceback
from dataclasses import replace
from pathlib import Path
import tkinter as tk
from tkinter import filedialog, font as tkfont, messagebox, simpledialog, ttk
from tkinter import scrolledtext

from pw_at import (
    ATError,
    BroadcastDir,
    ClockType,
    EraseType,
    OBUpdateType,
    OfflineState,
    OutputVext,
    PowerWriterAT,
    PowerWriterATError,
    ResetType,
    __version__,
)
from pw_at.constants import (
    BROADCAST_DIR_LABELS,
    CLOCK_LABELS,
    ERASE_TYPE_LABELS,
    OB_UPDATE_LABELS,
    RESET_TYPE_LABELS,
    VEXT_LABELS,
)
from pw_at.demo import (
    DEFAULT_PROJECT,
    DEFAULT_PROJECT_NAME,
    DEFAULT_READ_RANGES,
    GUIDE_TEXT,
    INTRODUCTION,
    ReadRangeSettings,
    SampleWorkflowSettings,
    run_sample_workflow,
    wait_target_connected,
)
from pw_at.hexfile import HexError, parse_intel_hex
from pw_at.i18n import LANGUAGES, LANGUAGE_NAMES, Translator, save_language
from pw_at.models import WriterConfig
from pw_at.transport import list_serial_ports
from pw_at.utils import hexdump, parse_aes_material
from pw_at.workflow_settings import (
    load_workflow_settings,
    save_workflow_settings,
)

# Chinese labels <-> enumeration values
ERASE_BY_LABEL = {label: int(value) for value, label in ERASE_TYPE_LABELS.items()}
VEXT_BY_LABEL = {label: int(value) for value, label in VEXT_LABELS.items()}
CLOCK_BY_LABEL = {label: int(value) for value, label in CLOCK_LABELS.items()}
OB_BY_LABEL = {label: int(value) for value, label in OB_UPDATE_LABELS.items()}
RESET_BY_LABEL = {label: int(value) for value, label in RESET_TYPE_LABELS.items()}

LOG_TAGS = {
    "debug": ("debug", "#666666"),
    "info": ("info", "#1a1a1a"),
    "warn": ("warn", "#b06000"),
    "error": ("error", "#b00020"),
}
LOG_PREFIX = {"debug": "[Debug]", "info": "[Info]", "warn": "[Warn]", "error": "[Error]"}


class EncryptionDialog(tk.Toplevel):
    """Modal AES key/IV editor used when encryption is enabled."""

    def __init__(self, parent, translate, key_text="", iv_text=""):
        super().__init__(parent)
        self._t = translate
        self.result = None
        self.title(self._t("Encryption settings"))
        self.transient(parent)
        self.resizable(False, False)
        self.protocol("WM_DELETE_WINDOW", self._cancel)

        body = ttk.Frame(self, padding=12)
        body.pack(fill="both", expand=True)

        self.key_var = tk.StringVar(value=key_text)
        self.iv_var = tk.StringVar(value=iv_text)
        self.show_var = tk.BooleanVar(value=False)

        ttk.Label(body, text=self._t("AES128-CBC key (32 hex digits):"))\
            .grid(row=0, column=0, sticky="w", pady=(0, 4))
        self.key_entry = ttk.Entry(
            body, textvariable=self.key_var, width=48,
            font=("Consolas", 10), show="*")
        self.key_entry.grid(row=1, column=0, columnspan=2, sticky="we")

        ttk.Label(body, text=self._t("AES128-CBC IV (32 hex digits):"))\
            .grid(row=2, column=0, sticky="w", pady=(10, 4))
        self.iv_entry = ttk.Entry(
            body, textvariable=self.iv_var, width=48,
            font=("Consolas", 10), show="*")
        self.iv_entry.grid(row=3, column=0, columnspan=2, sticky="we")

        actions = ttk.Frame(body)
        actions.grid(row=4, column=0, columnspan=2, sticky="we", pady=(6, 0))
        ttk.Checkbutton(
            actions, text=self._t("Show"), variable=self.show_var,
            command=self._toggle_show).pack(side="left")
        ttk.Button(
            actions, text=self._t("Generate"),
            command=self._generate).pack(side="left", padx=(12, 0))

        ttk.Label(
            body,
            text=self._t("The key and IV must match the PowerWriter device settings."),
            style="Hint.TLabel", wraplength=420)\
            .grid(row=5, column=0, columnspan=2, sticky="w", pady=(10, 0))

        buttons = ttk.Frame(body)
        buttons.grid(row=6, column=0, columnspan=2, sticky="e", pady=(14, 0))
        ttk.Button(buttons, text=self._t("OK"), command=self._ok)\
            .pack(side="right")
        ttk.Button(buttons, text=self._t("Cancel"), command=self._cancel)\
            .pack(side="right", padx=(0, 8))

        self.bind("<Return>", lambda _event: self._ok())
        self.bind("<Escape>", lambda _event: self._cancel())
        self.update_idletasks()
        try:
            parent.update_idletasks()
            x = parent.winfo_rootx() + max(
                0, (parent.winfo_width() - self.winfo_reqwidth()) // 2)
            y = parent.winfo_rooty() + max(
                0, (parent.winfo_height() - self.winfo_reqheight()) // 2)
            self.geometry("+%d+%d" % (x, y))
        except tk.TclError:
            pass
        self.grab_set()
        self.key_entry.focus_set()
        self.wait_window(self)

    def _toggle_show(self):
        show = "" if self.show_var.get() else "*"
        self.key_entry.configure(show=show)
        self.iv_entry.configure(show=show)

    def _generate(self):
        self.key_var.set(secrets.token_hex(16).upper())
        self.iv_var.set(secrets.token_hex(16).upper())
        self.show_var.set(True)
        self._toggle_show()

    def _ok(self):
        try:
            key = parse_aes_material(self.key_var.get(), "AES key")
        except ValueError as exc:
            messagebox.showerror(
                self._t("Invalid parameter"),
                self._t("Invalid AES key: %s", exc), parent=self)
            return
        try:
            iv = parse_aes_material(self.iv_var.get(), "AES IV")
        except ValueError as exc:
            messagebox.showerror(
                self._t("Invalid parameter"),
                self._t("Invalid AES IV: %s", exc), parent=self)
            return
        self.result = (key.hex().upper(), iv.hex().upper())
        self.destroy()

    def _cancel(self):
        self.result = None
        self.destroy()


class BatchTestSettingsDialog(tk.Toplevel):
    """Modal editor for the safe/full sample workflow parameters."""

    def __init__(self, parent, translate, settings: SampleWorkflowSettings):
        super().__init__(parent)
        self._t = translate
        self.result = None
        self.title(self._t("Batch test settings"))
        self.transient(parent)
        self.resizable(True, True)
        screen_h = self.winfo_screenheight()
        dialog_h = min(760, max(480, screen_h - 160))
        self.geometry("820x%d" % dialog_h)
        self.minsize(720, 480)
        self.protocol("WM_DELETE_WINDOW", self._cancel)

        buttons = ttk.Frame(self, padding=(10, 0, 10, 10))
        buttons.pack(side="bottom", fill="x")
        ttk.Button(buttons, text=self._t("Restore defaults"),
                   command=self._restore_defaults).pack(side="left")
        ttk.Button(buttons, text=self._t("Save"), command=self._save)\
            .pack(side="right")
        ttk.Button(buttons, text=self._t("Cancel"), command=self._cancel)\
            .pack(side="right", padx=(0, 8))

        outer = ttk.Frame(self, padding=10)
        outer.pack(fill="both", expand=True)
        canvas = tk.Canvas(outer, borderwidth=0, highlightthickness=0)
        scroll = ttk.Scrollbar(outer, orient="vertical", command=canvas.yview)
        canvas.configure(yscrollcommand=scroll.set)
        canvas.pack(side="left", fill="both", expand=True)
        scroll.pack(side="right", fill="y")
        content = ttk.Frame(canvas)
        window = canvas.create_window((0, 0), window=content, anchor="nw")
        content.bind(
            "<Configure>",
            lambda _event: canvas.configure(scrollregion=canvas.bbox("all")))
        canvas.bind(
            "<Configure>",
            lambda event: canvas.itemconfigure(window, width=event.width))

        self._build_vars(settings)
        self._build_content(content)
        self._load_settings(settings)

        self.bind("<Escape>", lambda _event: self._cancel())
        self.update_idletasks()
        try:
            parent.update_idletasks()
            screen_w = self.winfo_screenwidth()
            width = 820
            height = dialog_h
            x = parent.winfo_rootx() + max(
                0, (parent.winfo_width() - width) // 2)
            y = parent.winfo_rooty() + max(
                0, (parent.winfo_height() - height) // 2)
            x = max(20, min(x, screen_w - width - 20))
            y = max(20, min(y, screen_h - height - 60))
            self.geometry("%dx%d+%d+%d" % (width, height, x, y))
        except tk.TclError:
            pass
        self.grab_set()
        self.wait_window(self)

    def _build_vars(self, settings):
        def text(value):
            return tk.StringVar(value=str(value))

        self.connect_timeout = text(settings.connect_timeout_s)
        self.reconnect_timeout = text(settings.reconnect_timeout_s)
        self.read_enabled = []
        self.read_address = []
        self.read_size = []
        for item in settings.read_ranges:
            self.read_enabled.append(tk.BooleanVar(value=item.enabled))
            self.read_address.append(text("0x%08X" % item.address))
            self.read_size.append(text(str(item.size)))

        self.reset_enabled = tk.BooleanVar(value=settings.reset_enabled)
        self.reset_type = tk.StringVar()
        self.reset_delay = text(settings.reset_delay_ms)
        self.vendor_ob_enabled = tk.BooleanVar(value=settings.write_vendor_ob_enabled)
        self.vendor_ob_timeout = text(settings.write_vendor_ob_timeout_ms)
        self.full_erase_enabled = tk.BooleanVar(value=settings.full_erase_enabled)
        self.full_erase_timeout = text(settings.full_erase_timeout_ms)
        self.sector_erase_enabled = tk.BooleanVar(value=settings.sector_erase_enabled)
        self.sector_erase_address = text("0x%08X" % settings.sector_erase_address)
        self.sector_erase_size = text("0x%X" % settings.sector_erase_size)
        self.sector_erase_timeout = text(settings.sector_erase_timeout_ms)
        self.write_enabled = tk.BooleanVar(value=settings.write_enabled)
        self.write_address = text("0x%08X" % settings.write_address)
        self.write_size = text("0x%X" % settings.write_size)
        self.read_ob_enabled = tk.BooleanVar(value=settings.read_ob_enabled)
        self.user_ob_enabled = tk.BooleanVar(value=settings.write_user_ob_enabled)
        self.user_ob_timeout = text(settings.write_user_ob_timeout_ms)
        self.broadcast_enabled = tk.BooleanVar(value=settings.broadcast_enabled)
        self.broadcast_data = text(settings.broadcast_data)
        self.broadcast_direction = tk.StringVar()
        self.broadcast_keep = tk.BooleanVar(value=settings.broadcast_keep_frame)
        self.broadcast_wait = tk.BooleanVar(value=settings.broadcast_wait_rsp)
        self.broadcast_timeout = text(settings.broadcast_timeout_ms)
        self.factory_sram_enabled = tk.BooleanVar(value=settings.factory_sram_enabled)
        self.factory_sram_timeout = text(settings.factory_sram_timeout_ms)
        self.factory_flash_enabled = tk.BooleanVar(value=settings.factory_flash_enabled)
        self.factory_flash_timeout = text(settings.factory_flash_timeout_ms)
        self.load_project_enabled = tk.BooleanVar(value=settings.load_project_enabled)
        self.offline_start_enabled = tk.BooleanVar(value=settings.offline_start_enabled)
        self.offline_timeout = text(settings.offline_timeout_s)
        self.switch_enabled = tk.BooleanVar(value=settings.switch_project_enabled)
        self.switch_reload = tk.BooleanVar(value=settings.switch_reload)

    def _build_content(self, content):
        content.columnconfigure(0, weight=1)
        row = 0

        general = ttk.LabelFrame(
            content, text=self._t("Connection"), padding=8)
        general.grid(row=row, column=0, sticky="ew", pady=(0, 8))
        ttk.Label(general, text=self._t("Connect timeout (s):"))\
            .grid(row=0, column=0, sticky="w")
        ttk.Entry(general, textvariable=self.connect_timeout, width=10)\
            .grid(row=0, column=1, sticky="w", padx=(4, 24))
        ttk.Label(general, text=self._t("Reconnect timeout (s):"))\
            .grid(row=0, column=2, sticky="w")
        ttk.Entry(general, textvariable=self.reconnect_timeout, width=10)\
            .grid(row=0, column=3, sticky="w", padx=(4, 0))
        row += 1

        safe = ttk.LabelFrame(
            content, text=self._t("Safe workflow reads"), padding=8)
        safe.grid(row=row, column=0, sticky="ew", pady=(0, 8))
        ttk.Label(safe, text=self._t("Address:"), style="Title.TLabel")\
            .grid(row=0, column=1, sticky="w", padx=(8, 8))
        ttk.Label(safe, text=self._t("Size:"), style="Title.TLabel")\
            .grid(row=0, column=2, sticky="w")
        for index in range(len(self.read_enabled)):
            base = index + 1
            check = ttk.Checkbutton(
                safe, text=self._t("Read range %d", base),
                variable=self.read_enabled[index])
            check.grid(row=base, column=0, sticky="w", pady=2)
            address = ttk.Entry(
                safe, textvariable=self.read_address[index], width=14)
            address.grid(row=base, column=1, padx=(8, 8), pady=2)
            size = ttk.Entry(
                safe, textvariable=self.read_size[index], width=12)
            size.grid(row=base, column=2, padx=(0, 8), pady=2)
            self._bind_enable(self.read_enabled[index], (address, size))
        row += 1

        full = ttk.LabelFrame(
            content, text=self._t("Full workflow steps"), padding=8)
        full.grid(row=row, column=0, sticky="ew", pady=(0, 8))
        full.columnconfigure(0, weight=1)
        step = 0

        frame = ttk.Frame(full)
        frame.grid(row=step, column=0, sticky="ew", pady=2)
        reset_check = ttk.Checkbutton(
            frame, text=self._t("Reset"), variable=self.reset_enabled)
        reset_check.pack(side="left", anchor="w")
        ttk.Label(frame, text=self._t("Reset type:"))\
            .pack(side="left", padx=(12, 4))
        self.reset_type_combo = ttk.Combobox(
            frame, textvariable=self.reset_type, state="readonly", width=32,
            values=[self._t(label) for label in RESET_TYPE_LABELS.values()])
        self.reset_type_combo.pack(side="left")
        ttk.Label(frame, text=self._t("Reset delay (ms):"))\
            .pack(side="left", padx=(12, 4))
        reset_delay = ttk.Entry(frame, textvariable=self.reset_delay, width=8)
        reset_delay.pack(side="left")
        self._bind_enable(
            self.reset_enabled, (self.reset_type_combo, reset_delay),
            combo=self.reset_type_combo)
        step += 1

        self.vendor_ob_timeout_entry = self._step_with_timeout(
            full, step, self._t("Write vendor default OB"),
            self.vendor_ob_enabled, self.vendor_ob_timeout)
        step += 1
        self.full_erase_timeout_entry = self._step_with_timeout(
            full, step, self._t("Chip erase"),
            self.full_erase_enabled, self.full_erase_timeout)
        step += 1

        frame = ttk.Frame(full)
        frame.grid(row=step, column=0, sticky="ew", pady=2)
        sector_check = ttk.Checkbutton(
            frame, text=self._t("Sector erase"),
            variable=self.sector_erase_enabled)
        sector_check.pack(side="left", anchor="w")
        ttk.Label(frame, text=self._t("Address:"))\
            .pack(side="left", padx=(12, 4))
        sector_addr = ttk.Entry(
            frame, textvariable=self.sector_erase_address, width=14)
        sector_addr.pack(side="left")
        ttk.Label(frame, text=self._t("Size:"))\
            .pack(side="left", padx=(8, 4))
        sector_size = ttk.Entry(
            frame, textvariable=self.sector_erase_size, width=10)
        sector_size.pack(side="left")
        ttk.Label(frame, text=self._t("Timeout (ms):"))\
            .pack(side="left", padx=(8, 4))
        sector_timeout = ttk.Entry(
            frame, textvariable=self.sector_erase_timeout, width=8)
        sector_timeout.pack(side="left")
        self._bind_enable(
            self.sector_erase_enabled, (sector_addr, sector_size, sector_timeout))
        step += 1

        frame = ttk.Frame(full)
        frame.grid(row=step, column=0, sticky="ew", pady=2)
        write_check = ttk.Checkbutton(
            frame, text=self._t("Write Target Memory"), variable=self.write_enabled)
        write_check.pack(side="left", anchor="w")
        ttk.Label(frame, text=self._t("Address:"))\
            .pack(side="left", padx=(12, 4))
        write_addr = ttk.Entry(frame, textvariable=self.write_address, width=14)
        write_addr.pack(side="left")
        ttk.Label(frame, text=self._t("Size:"))\
            .pack(side="left", padx=(8, 4))
        write_size = ttk.Entry(frame, textvariable=self.write_size, width=10)
        write_size.pack(side="left")
        self._bind_enable(self.write_enabled, (write_addr, write_size))
        step += 1

        ttk.Checkbutton(
            full, text=self._t("Read OB"), variable=self.read_ob_enabled)\
            .grid(row=step, column=0, sticky="w", pady=2)
        step += 1

        self.user_ob_timeout_entry = self._step_with_timeout(
            full, step, self._t("Write user OB"),
            self.user_ob_enabled, self.user_ob_timeout)
        step += 1

        frame = ttk.Frame(full)
        frame.grid(row=step, column=0, sticky="ew", pady=2)
        bcast_check = ttk.Checkbutton(
            frame, text=self._t("Broadcast"), variable=self.broadcast_enabled)
        bcast_check.pack(side="left", anchor="nw")
        details = ttk.Frame(frame)
        details.pack(side="left", fill="x", expand=True)
        ttk.Label(details, text=self._t("Broadcast data:"))\
            .grid(row=0, column=0, sticky="w", padx=(12, 4))
        bcast_data = ttk.Entry(
            details, textvariable=self.broadcast_data, width=36)
        bcast_data.grid(row=0, column=1, columnspan=4, sticky="we", pady=2)
        ttk.Label(details, text=self._t("Direction:"))\
            .grid(row=1, column=0, sticky="w", padx=(12, 4))
        self.broadcast_direction_combo = ttk.Combobox(
            details, textvariable=self.broadcast_direction, state="readonly",
            width=18,
            values=[self._t(label) for label in BROADCAST_DIR_LABELS.values()])
        self.broadcast_direction_combo.grid(row=1, column=1, sticky="w")
        bcast_keep = ttk.Checkbutton(
            details, text=self._t("Keep full AT frame"),
            variable=self.broadcast_keep)
        bcast_keep.grid(row=1, column=2, sticky="w", padx=(8, 0))
        bcast_wait = ttk.Checkbutton(
            details, text=self._t("Wait for response"), variable=self.broadcast_wait)
        bcast_wait.grid(row=1, column=3, sticky="w", padx=(8, 0))
        ttk.Label(details, text=self._t("Timeout (ms):"))\
            .grid(row=1, column=4, sticky="w", padx=(8, 4))
        bcast_timeout = ttk.Entry(
            details, textvariable=self.broadcast_timeout, width=8)
        bcast_timeout.grid(row=1, column=5, sticky="w")
        self._bind_enable(
            self.broadcast_enabled,
            (bcast_data, bcast_keep, bcast_wait, bcast_timeout),
            combo=self.broadcast_direction_combo)
        step += 1

        factory = ttk.LabelFrame(
            full, text=self._t("Factory Test"), padding=6)
        factory.grid(row=step, column=0, sticky="ew", pady=(6, 0))
        factory.columnconfigure(0, weight=1)
        self.factory_sram_timeout_entry = self._step_with_timeout(
            factory, 0, self._t("Run factory SRAM firmware"),
            self.factory_sram_enabled, self.factory_sram_timeout)
        self.factory_flash_timeout_entry = self._step_with_timeout(
            factory, 1, self._t("Run factory Flash firmware"),
            self.factory_flash_enabled, self.factory_flash_timeout)
        row += 1

        offline = ttk.LabelFrame(
            content, text=self._t("Offline Programming"), padding=8)
        offline.grid(row=row, column=0, sticky="ew")
        offline.columnconfigure(0, weight=1)
        ttk.Checkbutton(
            offline, text=self._t("Load project"),
            variable=self.load_project_enabled)\
            .grid(row=0, column=0, sticky="w", pady=2)
        ttk.Label(
            offline,
            text=self._t(
                "Uses the current Offline Programming project (file, name, password, encoding)."),
            style="Hint.TLabel")\
            .grid(row=1, column=0, sticky="w", padx=(24, 0))
        frame = ttk.Frame(offline)
        frame.grid(row=2, column=0, sticky="ew", pady=2)
        start_check = ttk.Checkbutton(
            frame, text=self._t("Start offline write"),
            variable=self.offline_start_enabled)
        start_check.pack(side="left")
        ttk.Label(frame, text=self._t("Offline timeout (s):"))\
            .pack(side="left", padx=(12, 4))
        offline_timeout = ttk.Entry(
            frame, textvariable=self.offline_timeout, width=10)
        offline_timeout.pack(side="left")
        self._bind_enable(self.offline_start_enabled, (offline_timeout,))
        frame = ttk.Frame(offline)
        frame.grid(row=3, column=0, sticky="ew", pady=2)
        switch_check = ttk.Checkbutton(
            frame, text=self._t("Switch Project (PWX1)"),
            variable=self.switch_enabled)
        switch_check.pack(side="left")
        reload_check = ttk.Checkbutton(
            frame, text=self._t("Reload"), variable=self.switch_reload)
        reload_check.pack(side="left", padx=(12, 0))
        self._bind_enable(self.switch_enabled, (reload_check,))

    def _step_with_timeout(self, parent, row, text, enabled, timeout_var):
        frame = ttk.Frame(parent)
        frame.grid(row=row, column=0, sticky="ew", pady=2)
        ttk.Checkbutton(frame, text=text, variable=enabled).pack(side="left")
        ttk.Label(frame, text=self._t("Timeout (ms):"))\
            .pack(side="left", padx=(12, 4))
        entry = ttk.Entry(frame, textvariable=timeout_var, width=10)
        entry.pack(side="left")
        self._bind_enable(enabled, (entry,))
        return entry

    def _bind_enable(self, variable, widgets, combo=None):
        def update(*_args):
            state = "normal" if variable.get() else "disabled"
            for widget in widgets:
                try:
                    widget.configure(state=state)
                except tk.TclError:
                    pass
            if combo is not None:
                try:
                    combo.configure(state="readonly" if variable.get() else "disabled")
                except tk.TclError:
                    pass
        variable.trace_add("write", update)
        update()

    def _load_settings(self, settings: SampleWorkflowSettings):
        if not 0 <= settings.reset_type <= 7:
            settings = replace(settings, reset_type=int(ResetType.HW_CORE_RESET))
        self.connect_timeout.set(str(settings.connect_timeout_s))
        self.reconnect_timeout.set(str(settings.reconnect_timeout_s))
        for index, item in enumerate(settings.read_ranges):
            self.read_enabled[index].set(item.enabled)
            self.read_address[index].set("0x%08X" % item.address)
            self.read_size[index].set(str(item.size))
        self.reset_enabled.set(settings.reset_enabled)
        self.reset_type.set(self._t(RESET_TYPE_LABELS[ResetType(settings.reset_type)]))
        self.reset_delay.set(str(settings.reset_delay_ms))
        self.vendor_ob_enabled.set(settings.write_vendor_ob_enabled)
        self.vendor_ob_timeout.set(str(settings.write_vendor_ob_timeout_ms))
        self.full_erase_enabled.set(settings.full_erase_enabled)
        self.full_erase_timeout.set(str(settings.full_erase_timeout_ms))
        self.sector_erase_enabled.set(settings.sector_erase_enabled)
        self.sector_erase_address.set("0x%08X" % settings.sector_erase_address)
        self.sector_erase_size.set("0x%X" % settings.sector_erase_size)
        self.sector_erase_timeout.set(str(settings.sector_erase_timeout_ms))
        self.write_enabled.set(settings.write_enabled)
        self.write_address.set("0x%08X" % settings.write_address)
        self.write_size.set("0x%X" % settings.write_size)
        self.read_ob_enabled.set(settings.read_ob_enabled)
        self.user_ob_enabled.set(settings.write_user_ob_enabled)
        self.user_ob_timeout.set(str(settings.write_user_ob_timeout_ms))
        self.broadcast_enabled.set(settings.broadcast_enabled)
        self.broadcast_data.set(settings.broadcast_data)
        direction = BroadcastDir(settings.broadcast_direction) \
            if settings.broadcast_direction in (0, 1) else BroadcastDir.CDC2UART
        self.broadcast_direction.set(self._t(BROADCAST_DIR_LABELS[direction]))
        self.broadcast_keep.set(settings.broadcast_keep_frame)
        self.broadcast_wait.set(settings.broadcast_wait_rsp)
        self.broadcast_timeout.set(str(settings.broadcast_timeout_ms))
        self.factory_sram_enabled.set(settings.factory_sram_enabled)
        self.factory_sram_timeout.set(str(settings.factory_sram_timeout_ms))
        self.factory_flash_enabled.set(settings.factory_flash_enabled)
        self.factory_flash_timeout.set(str(settings.factory_flash_timeout_ms))
        self.load_project_enabled.set(settings.load_project_enabled)
        self.offline_start_enabled.set(settings.offline_start_enabled)
        self.offline_timeout.set(str(settings.offline_timeout_s))
        self.switch_enabled.set(settings.switch_project_enabled)
        self.switch_reload.set(settings.switch_reload)

    def _restore_defaults(self):
        self._load_settings(SampleWorkflowSettings())

    def _read_int(self, var, label):
        text = var.get().strip()
        try:
            return int(text, 0)
        except ValueError:
            raise ValueError(
                self._t("%s must be an integer (0x prefix supported)", label))

    def _read_float(self, var, label):
        text = var.get().strip()
        try:
            return float(text)
        except ValueError:
            raise ValueError(
                self._t("%s must be a number", label))

    def _save(self):
        try:
            reset_label = self.reset_type.get()
            reset_value = next(
                (int(value) for value, label in RESET_TYPE_LABELS.items()
                 if self._t(label) == reset_label), None)
            if reset_value is None:
                raise ValueError(self._t("Invalid parameter"))
            direction_label = self.broadcast_direction.get()
            direction_value = next(
                (int(value) for value, label in BROADCAST_DIR_LABELS.items()
                 if self._t(label) == direction_label), None)
            if direction_value is None:
                raise ValueError(self._t("Invalid parameter"))
            ranges = []
            for index in range(len(self.read_enabled)):
                ranges.append(ReadRangeSettings(
                    enabled=self.read_enabled[index].get(),
                    label=DEFAULT_READ_RANGES[index].label,
                    address=self._read_int(
                        self.read_address[index],
                        self._t("Read range %d", index + 1)),
                    size=self._read_int(
                        self.read_size[index],
                        self._t("Read range %d", index + 1)),
                ))
            settings = SampleWorkflowSettings(
                connect_timeout_s=self._read_float(
                    self.connect_timeout, self._t("Connect timeout (s):")),
                reconnect_timeout_s=self._read_float(
                    self.reconnect_timeout, self._t("Reconnect timeout (s):")),
                read_ranges=ranges,
                reset_enabled=self.reset_enabled.get(),
                reset_type=reset_value,
                reset_delay_ms=self._read_int(
                    self.reset_delay, self._t("Reset delay (ms):")),
                write_vendor_ob_enabled=self.vendor_ob_enabled.get(),
                write_vendor_ob_timeout_ms=self._read_int(
                    self.vendor_ob_timeout, self._t("Timeout (ms):")),
                full_erase_enabled=self.full_erase_enabled.get(),
                full_erase_timeout_ms=self._read_int(
                    self.full_erase_timeout, self._t("Timeout (ms):")),
                sector_erase_enabled=self.sector_erase_enabled.get(),
                sector_erase_address=self._read_int(
                    self.sector_erase_address, self._t("Address:")),
                sector_erase_size=self._read_int(
                    self.sector_erase_size, self._t("Size:")),
                sector_erase_timeout_ms=self._read_int(
                    self.sector_erase_timeout, self._t("Timeout (ms):")),
                write_enabled=self.write_enabled.get(),
                write_address=self._read_int(
                    self.write_address, self._t("Address:")),
                write_size=self._read_int(self.write_size, self._t("Size:")),
                read_ob_enabled=self.read_ob_enabled.get(),
                write_user_ob_enabled=self.user_ob_enabled.get(),
                write_user_ob_timeout_ms=self._read_int(
                    self.user_ob_timeout, self._t("Timeout (ms):")),
                broadcast_enabled=self.broadcast_enabled.get(),
                broadcast_data=self.broadcast_data.get(),
                broadcast_direction=direction_value,
                broadcast_keep_frame=self.broadcast_keep.get(),
                broadcast_wait_rsp=self.broadcast_wait.get(),
                broadcast_timeout_ms=self._read_int(
                    self.broadcast_timeout, self._t("Timeout (ms):")),
                factory_sram_enabled=self.factory_sram_enabled.get(),
                factory_sram_timeout_ms=self._read_int(
                    self.factory_sram_timeout, self._t("Timeout (ms):")),
                factory_flash_enabled=self.factory_flash_enabled.get(),
                factory_flash_timeout_ms=self._read_int(
                    self.factory_flash_timeout, self._t("Timeout (ms):")),
                load_project_enabled=self.load_project_enabled.get(),
                offline_start_enabled=self.offline_start_enabled.get(),
                offline_timeout_s=self._read_int(
                    self.offline_timeout, self._t("Offline timeout (s):")),
                switch_project_enabled=self.switch_enabled.get(),
                switch_reload=self.switch_reload.get(),
            )
            settings.validate()
        except ValueError as exc:
            messagebox.showerror(
                self._t("Invalid parameter"), str(exc), parent=self)
            return
        if not save_workflow_settings(settings):
            messagebox.showerror(
                self._t("File error"),
                self._t("Could not save settings"), parent=self)
            return
        self.result = settings
        self.destroy()

    def _cancel(self):
        self.result = None
        self.destroy()


class PowerWriterGui:
    def __init__(self, root: tk.Tk, language: str | None = None,
                 maximized: bool = True) -> None:
        self.root = root
        self.translator = Translator(language)
        self.language_code = self.translator.language
        self._save_settings = language is None
        self.language_var = tk.StringVar(
            value=LANGUAGE_NAMES.get(self.language_code, "English"))
        self.client: PowerWriterAT | None = None
        self.busy = False
        self.queue: "queue.Queue" = queue.Queue()
        self.offline_stop = threading.Event()
        self.demo_stop = threading.Event()
        self.workflow_settings = load_workflow_settings()
        self._last_read: tuple[int, bytes] | None = None
        self._port_map: dict[str, str] = {}
        self._tab_sources: dict[str, str] = {}
        self._i18n_combos = []
        self._conn_template = "Not connected"
        self._conn_args: tuple = ()
        self._conn_ok = False
        self._conn_busy = False
        self._target_connected: bool | None = None
        self._target_state = "unknown"
        self._target_error = ""
        self._limit_enable_value = False
        self._proj_active_state: bool | None = None

        root.title(self._t("PowerWriter AT Commander (Python) v%s") % __version__)
        root.geometry("1440x900")
        root.minsize(1200, 760)
        style = ttk.Style(root)
        for theme in ("vista", "clam"):
            if theme in style.theme_names():
                style.theme_use(theme)
                break
        style.configure("Hint.TLabel", foreground="#666666")
        style.configure("Ok.TLabel", foreground="#0a7d28")
        style.configure("Bad.TLabel", foreground="#b00020")
        style.configure("Title.TLabel", font=("Segoe UI", 10, "bold"))

        self._build_vars()
        self._build_ui()
        self.write_file_var.trace_add("write", self._on_write_file_changed)
        self._on_write_file_changed()
        self._apply_language(initial=True)
        self._refresh_ports()
        self._update_conn_buttons()
        if maximized:
            self._maximize_window()
        self._poll_after_id = self.root.after(80, self._poll_queue)
        self.root.protocol("WM_DELETE_WINDOW", self._on_close)

    # ==================================================================
    # Localization
    # ==================================================================
    def _t(self, text: str, *args) -> str:
        return self.translator.tr(text, *args)

    def _maximize_window(self) -> None:
        try:
            self.root.update_idletasks()
            if sys.platform == "darwin":
                self.root.state("zoomed")
            elif sys.platform.startswith("win"):
                self.root.state("zoomed")
            else:
                self.root.attributes("-zoomed", True)
        except tk.TclError:
            self.root.geometry("1440x900")

    def _fit_buttons(self) -> None:
        """Size buttons to their translated text and equalize siblings."""
        font = tkfont.nametofont("TkDefaultFont")
        try:
            style_font = ttk.Style(self.root).lookup("TButton", "font")
            if style_font:
                font = tkfont.Font(font=style_font)
        except Exception:
            pass
        zero = max(1, font.measure("0"))
        groups = {}
        for widget in self._walk_widgets(self.main):
            if not isinstance(widget, ttk.Button):
                continue
            try:
                text = widget.cget("text")
            except tk.TclError:
                continue
            if not text:
                continue
            needed = (font.measure(text) + zero - 1) // zero + 2
            groups.setdefault(widget.master, []).append((widget, needed))
        for items in groups.values():
            width = max(needed for _widget, needed in items)
            for widget, _needed in items:
                try:
                    widget.configure(width=width)
                except tk.TclError:
                    pass

    def _walk_widgets(self, parent):
        for child in parent.winfo_children():
            yield child
            yield from self._walk_widgets(child)

    def _localize_static_widgets(self) -> None:
        for widget in [self.main, *self._walk_widgets(self.main)]:
            if getattr(widget, "_i18n_skip", False):
                continue
            try:
                if widget.cget("textvariable"):
                    continue
            except tk.TclError:
                pass
            try:
                text = widget.cget("text")
            except tk.TclError:
                continue
            if not text:
                continue
            source = getattr(widget, "_i18n_source", None)
            if source is None:
                source = text
                widget._i18n_source = source
            try:
                widget.configure(text=self._t(source))
            except tk.TclError:
                pass

        for tab_id in self.notebook.tabs():
            source = self._tab_sources.get(tab_id)
            if source is None:
                source = self.notebook.tab(tab_id, "text")
                self._tab_sources[tab_id] = source
            self.notebook.tab(tab_id, text=self._t(source))

        for combo, sources in self._i18n_combos:
            self._localize_combo(combo, sources)
        self._fit_buttons()

    def _localize_combo(self, combo: ttk.Combobox, sources) -> None:
        old_values = list(combo["values"])
        index = combo.current()
        if index < 0:
            value = combo.get()
            try:
                index = old_values.index(value)
            except ValueError:
                index = -1
        combo["values"] = [self._t(item) for item in sources]
        if index >= 0:
            combo.current(index)

    def _apply_language(self, initial: bool = False) -> None:
        self._localize_static_widgets()
        self.root.title(self._t("PowerWriter AT Commander (Python) v%s") % __version__)
        self.status_var.set(
            self._t("Working...") if self.busy else self._t("Ready"))
        self._render_conn_status()
        self._render_target_status()
        self._render_limit_enable()
        self._render_project_state()
        if self.client is not None:
            self.info_vars["encrypt"].set(
                self._t("Enabled") if self.client.encrypt else self._t("Disabled"))
        if self._last_read is None:
            self.read_info_var.set(self._t("Not read yet"))
        if initial:
            self.demo_status_var.set(self._t("Not running"))
            self.offline_status_var.set(self._t("Not started"))
        if not initial:
            self._append_log(
                "info",
                self._t("UI language changed to %s.", LANGUAGE_NAMES[self.language_code]))

    def _on_language_change(self, _event=None) -> None:
        if self.busy:
            messagebox.showinfo(
                self._t("Please wait"),
                self._t("An operation is in progress; cannot change language right now"))
            self.language_var.set(LANGUAGE_NAMES[self.language_code])
            return
        selected = self.language_var.get()
        code = next((item for item, name in LANGUAGES if name == selected), None)
        if code is None or code == self.language_code:
            return
        self.language_code = code
        self.translator.set_language(code)
        if self._save_settings:
            save_language(code)
        self._apply_language()

    def _render_conn_status(self) -> None:
        self.conn_status_var.set(
            self._t(self._conn_template, *self._conn_args))
        self.conn_status_label.configure(
            style="Ok.TLabel" if self._conn_ok
            else ("Hint.TLabel" if self._conn_busy else "Bad.TLabel"))

    def _render_target_status(self) -> None:
        if self._target_connected is None:
            if self._target_state == "sent":
                self.target_status_var.set(self._t("Connect command sent"))
                self.target_status_label.configure(style="Hint.TLabel")
            else:
                self.target_status_var.set(self._t("Unknown"))
                self.target_status_label.configure(style="Bad.TLabel")
            return
        if self._target_connected:
            self.target_status_var.set(self._t("Connected"))
            self.target_status_label.configure(style="Ok.TLabel")
        else:
            text = self._t("Not connected")
            if self._target_error:
                text += " (%s)" % self._t(self._target_error)
            self.target_status_var.set(text)
            self.target_status_label.configure(style="Bad.TLabel")

    def _render_limit_enable(self) -> None:
        self.cfg_limit_enable.set(
            self._t("On") if self._limit_enable_value else self._t("Off"))

    def _render_project_state(self) -> None:
        if self._proj_active_state is None:
            return
        self.proj_active_var.set(
            self._t("Valid") if self._proj_active_state else self._t("Invalid"))

    # ==================================================================
    # Variables and UI construction
    # ==================================================================
    def _build_vars(self) -> None:
        self.port_var = tk.StringVar()
        self.baud_var = tk.StringVar(value="9600")
        self.encrypt_var = tk.BooleanVar(value=False)
        self.encrypt_key_hex = ""
        self.encrypt_iv_hex = ""
        self.pw_only_var = tk.BooleanVar(value=True)
        self.conn_status_var = tk.StringVar(value="Not connected")

        self.info_vars = {
            "oem": tk.StringVar(value="-"),
            "sn": tk.StringVar(value="-"),
            "hw": tk.StringVar(value="-"),
            "boot": tk.StringVar(value="-"),
            "iface": tk.StringVar(value="-"),
            "lib": tk.StringVar(value="-"),
            "encrypt": tk.StringVar(value="-"),
        }

        self.cfg_vendor = tk.StringVar()
        self.cfg_series = tk.StringVar()
        self.cfg_model = tk.StringVar()
        self.cfg_erase = tk.StringVar()
        self.cfg_vext = tk.StringVar()
        self.cfg_clock = tk.StringVar()
        self.cfg_ob = tk.StringVar()
        self.cfg_buzzer = tk.IntVar()
        self.cfg_limit_enable = tk.StringVar()
        self.cfg_limit_number = tk.StringVar()
        self.cfg_auto = tk.IntVar()
        self.cfg_in_debounce = tk.StringVar(value="0")
        self.cfg_out_debounce = tk.StringVar(value="0")
        self.cfg_disable_power = tk.IntVar()
        self.cfg_run_ap = tk.IntVar()
        self.cfg_power_on = tk.StringVar(value="0")
        self.cfg_power_off = tk.StringVar(value="0")
        self.cfg_reset_pin = tk.StringVar(
            value=list(RESET_TYPE_LABELS.values())[0])

        self.target_status_var = tk.StringVar(value="Unknown")
        self.target_id_var = tk.StringVar(value="-")
        self.read_addr_var = tk.StringVar(value="0x08000000")
        self.read_size_var = tk.StringVar(value="256")
        self.read_info_var = tk.StringVar(value="Not read yet")
        self.write_addr_var = tk.StringVar(value="0x08000000")
        self.write_file_var = tk.StringVar()
        self.write_verify_var = tk.BooleanVar(value=True)
        self.write_prepare_var = tk.BooleanVar(value=True)
        self.write_status_var = tk.StringVar(value="")
        self.new_baud_var = tk.StringVar(value="115200")
        self.demo_status_var = tk.StringVar(value="Not running")
        self.erase_addr_var = tk.StringVar(value="0x08000000")
        self.erase_size_var = tk.StringVar(value="0x1000")
        self.reset_type_var = tk.StringVar(value=list(RESET_TYPE_LABELS.values())[3])

        self.proj_active_var = tk.StringVar(value="-")
        self.proj_size_var = tk.StringVar(value="-")
        self.proj_crc_var = tk.StringVar(value="-")
        self.proj_name_var = tk.StringVar()
        self.proj_password_var = tk.StringVar()
        self.proj_encoding_var = tk.StringVar(value="auto")
        self.proj_file_var = tk.StringVar()
        self.project_status_var = tk.StringVar(value="")
        self.offline_status_var = tk.StringVar(value="Not started")
        self.switch_name_var = tk.StringVar()
        self.switch_password_var = tk.StringVar()
        self.switch_reload_var = tk.BooleanVar(value=False)

        self.broadcast_dir_var = tk.StringVar(value=list(BROADCAST_DIR_LABELS.values())[0])
        self.broadcast_hex_var = tk.BooleanVar(value=False)
        self.broadcast_keep_var = tk.BooleanVar(value=False)
        self.broadcast_wait_var = tk.BooleanVar(value=False)

        self.show_frames_var = tk.BooleanVar(value=False)
        self.status_var = tk.StringVar(value="Ready")

    def _build_ui(self) -> None:
        self.main = ttk.Frame(self.root, padding=8)
        self.main.pack(fill="both", expand=True)
        main = self.main

        # ---------------- Connection bar ----------------
        conn = ttk.LabelFrame(main, text="Connection", padding=8)
        conn.pack(fill="x")

        ttk.Label(conn, text="Serial port:").grid(row=0, column=0, sticky="w")
        self.port_combo = ttk.Combobox(conn, textvariable=self.port_var, width=30)
        self.port_combo.grid(row=0, column=1, padx=(4, 4))
        self.refresh_btn = ttk.Button(conn, text="Refresh", width=6, command=self._refresh_ports)
        self.refresh_btn.grid(row=0, column=2, padx=(0, 12))

        ttk.Label(conn, text="Baud rate:").grid(row=0, column=3, sticky="w")
        self.baud_combo = ttk.Combobox(
            conn, textvariable=self.baud_var, width=10,
            values=["9600", "19200", "38400", "57600", "115200",
                    "230400", "460800", "921600"],
        )
        self.baud_combo.grid(row=0, column=4, padx=(4, 12))

        self.encrypt_chk = ttk.Checkbutton(
            conn, text="AES128-CBC encryption", variable=self.encrypt_var,
            command=self._on_encrypt_toggle)
        self.encrypt_chk.grid(row=0, column=5, padx=(0, 12))

        self.connect_btn = ttk.Button(conn, text="Connect", width=8, command=self._on_connect)
        self.connect_btn.grid(row=0, column=6, padx=(0, 6))
        self.disconnect_btn = ttk.Button(conn, text="Disconnect", width=12,
                                         command=self._on_disconnect)
        self.disconnect_btn.grid(row=0, column=7)

        self.pw_only_chk = ttk.Checkbutton(
            conn, text="PowerWriter only", variable=self.pw_only_var,
            command=self._refresh_ports)
        self.pw_only_chk.grid(row=0, column=8, padx=(12, 0))

        ttk.Label(conn, text="Language:").grid(
            row=0, column=9, sticky="w", padx=(12, 0))
        self.language_combo = ttk.Combobox(
            conn, textvariable=self.language_var,
            values=[name for _code, name in LANGUAGES],
            state="readonly", width=20, height=min(24, len(LANGUAGES)))
        self.language_combo.grid(
            row=0, column=10, sticky="w", padx=(4, 0))
        self.language_combo.bind("<<ComboboxSelected>>", self._on_language_change)
        conn.columnconfigure(11, weight=1)

        self.conn_status_label = ttk.Label(conn, textvariable=self.conn_status_var,
                                           style="Bad.TLabel")
        self.conn_status_label.grid(row=1, column=0, columnspan=11, sticky="w", pady=(8, 0))
        ttk.Label(conn, text="Note: enable AT mode in the PowerWriter device preferences first;"
                             " AES encryption must match the device settings.",
                  style="Hint.TLabel").grid(row=2, column=0, columnspan=11,
                                            sticky="w", pady=(2, 0))

        # ---------------- Feature tabs ----------------
        self.notebook = ttk.Notebook(main)
        self.notebook.pack(fill="both", expand=True, pady=(8, 4))

        self._build_info_tab()
        self._build_config_tab()
        self._build_target_tab()
        self._build_project_tab()
        self._build_broadcast_tab()
        self._build_demo_tab()

        self._i18n_combos = [
            (self.cfg_erase_combo, list(ERASE_TYPE_LABELS.values())),
            (self.cfg_vext_combo, list(VEXT_LABELS.values())),
            (self.cfg_clock_combo, list(CLOCK_LABELS.values())),
            (self.cfg_ob_combo, list(OB_UPDATE_LABELS.values())),
            (self.cfg_reset_pin_combo, list(RESET_TYPE_LABELS.values())),
            (self.reset_combo, list(RESET_TYPE_LABELS.values())),
            (self.broadcast_dir_combo, list(BROADCAST_DIR_LABELS.values())),
        ]

        # ---------------- Log pane ----------------
        log_frame = ttk.LabelFrame(main, text="Log", padding=4)
        log_frame.pack(fill="x", pady=(0, 4))

        toolbar = ttk.Frame(log_frame)
        toolbar.pack(fill="x", pady=(0, 4))
        ttk.Checkbutton(toolbar, text="Show communication frames", variable=self.show_frames_var)\
            .pack(side="left")
        ttk.Button(toolbar, text="Clear", command=self._clear_log).pack(side="right", padx=(4, 0))
        ttk.Button(toolbar, text="Save log...", command=self._save_log).pack(side="right")

        self.log_text = scrolledtext.ScrolledText(
            log_frame, height=9, wrap="none", font=("Consolas", 9), state="disabled"
        )
        self.log_text.pack(fill="both", expand=True)
        for level, (tag, color) in LOG_TAGS.items():
            self.log_text.tag_configure(tag, foreground=color)

        status_bar = ttk.Label(main, textvariable=self.status_var, relief="sunken",
                               anchor="w", padding=(4, 2))
        status_bar.pack(fill="x")

    # ------------------------------------------------------------------
    def _build_info_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=12)
        self.notebook.add(tab, text="Device Info")

        frame = ttk.LabelFrame(tab, text="PowerWriter", padding=12)
        frame.grid(row=0, column=0, sticky="nsew")
        tab.columnconfigure(0, weight=1)

        fields = [
            ("Model", "oem"), ("Serial number SN", "sn"), ("Hardware version", "hw"),
            ("Bootloader", "boot"), ("Interface firmware", "iface"),
        ]
        for row, (label, key) in enumerate(fields):
            ttk.Label(frame, text=label + ":").grid(row=row, column=0, sticky="w", pady=3)
            ttk.Label(frame, textvariable=self.info_vars[key],
                      style="Title.TLabel").grid(row=row, column=1, sticky="w", padx=(12, 0))

        ttk.Separator(frame).grid(row=len(fields), column=0, columnspan=2,
                                  sticky="ew", pady=10)
        ttk.Label(frame, text="Bound library:").grid(row=len(fields) + 1, column=0, sticky="nw")
        ttk.Label(frame, textvariable=self.info_vars["lib"], wraplength=760)\
            .grid(row=len(fields) + 1, column=1, sticky="w", padx=(12, 0))
        ttk.Label(frame, text="AT encryption:").grid(row=len(fields) + 2, column=0,
                                               sticky="w", pady=3)
        ttk.Label(frame, textvariable=self.info_vars["encrypt"])\
            .grid(row=len(fields) + 2, column=1, sticky="w", padx=(12, 0))

        ttk.Button(frame, text="Refresh info", command=self._read_info)\
            .grid(row=len(fields) + 3, column=0, sticky="w", pady=(16, 0))
        ttk.Button(frame, text="About", command=self._show_about)\
            .grid(row=len(fields) + 3, column=1, sticky="w", padx=(12, 0), pady=(16, 0))

    def _build_config_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=12)
        self.notebook.add(tab, text="Device Config")

        left = ttk.Frame(tab)
        left.grid(row=0, column=0, sticky="nsew", padx=(0, 12))
        right = ttk.Frame(tab)
        right.grid(row=0, column=1, sticky="nsew")
        tab.columnconfigure(0, weight=1)
        tab.columnconfigure(1, weight=1)

        names = ttk.LabelFrame(left, text="Target info (read-only)", padding=8)
        names.pack(fill="x")
        self._config_row(names, 0, "Vendor", self.cfg_vendor, state="disabled")
        self._config_row(names, 1, "Series", self.cfg_series, state="disabled")
        self._config_row(names, 2, "Model", self.cfg_model, state="disabled")

        base = ttk.LabelFrame(left, text="Basic Settings", padding=8)
        base.pack(fill="x", pady=(10, 0))
        self.cfg_erase_combo = self._config_combo(
            base, 0, "Erase mode", self.cfg_erase,
            list(ERASE_TYPE_LABELS.values()))
        self.cfg_vext_combo = self._config_combo(
            base, 1, "Output VEXT", self.cfg_vext,
            list(VEXT_LABELS.values()))
        self.cfg_clock_combo = self._config_combo(
            base, 2, "Target clock", self.cfg_clock,
            list(CLOCK_LABELS.values()))
        self.cfg_ob_combo = self._config_combo(
            base, 3, "OptionByte update", self.cfg_ob,
            list(OB_UPDATE_LABELS.values()))
        ttk.Label(base, text="Buzzer:").grid(row=4, column=0, sticky="w", pady=4)
        ttk.Checkbutton(base, text="On", variable=self.cfg_buzzer)\
            .grid(row=4, column=1, sticky="w", padx=(12, 0))

        offline = ttk.LabelFrame(right, text="Offline Settings", padding=8)
        offline.pack(fill="x")
        self._config_row(offline, 0, "Count limit", self.cfg_limit_enable, state="disabled")
        self._config_row(offline, 1, "Remaining count", self.cfg_limit_number, state="disabled")
        ttk.Label(offline, text="Auto target detect:").grid(row=2, column=0, sticky="w", pady=4)
        ttk.Checkbutton(offline, text="On", variable=self.cfg_auto)\
            .grid(row=2, column=1, sticky="w", padx=(12, 0))
        self._config_row(offline, 3, "Insertion debounce (ms)", self.cfg_in_debounce)
        self._config_row(offline, 4, "Removal debounce (ms)", self.cfg_out_debounce)

        output = ttk.LabelFrame(right, text="Output Control", padding=8)
        output.pack(fill="x", pady=(10, 0))
        ttk.Label(output, text="Power off after write:").grid(row=0, column=0, sticky="w", pady=4)
        ttk.Checkbutton(output, text="On", variable=self.cfg_disable_power)\
            .grid(row=0, column=1, sticky="w", padx=(12, 0))
        ttk.Label(output, text="Run after write:").grid(row=1, column=0, sticky="w", pady=4)
        ttk.Checkbutton(output, text="On", variable=self.cfg_run_ap)\
            .grid(row=1, column=1, sticky="w", padx=(12, 0))
        self._config_row(output, 2, "Power-on debounce (ms)", self.cfg_power_on)
        self._config_row(output, 3, "Power-off debounce (ms)", self.cfg_power_off)
        self.cfg_reset_pin_combo = self._config_combo(
            output, 4, "Reset pin control", self.cfg_reset_pin,
            list(RESET_TYPE_LABELS.values()))
        ttk.Label(output, text="Same 0-7 reset modes as Online Operations.",
                  style="Hint.TLabel", wraplength=360)\
            .grid(row=5, column=0, columnspan=2, sticky="w")

        at_iface = ttk.LabelFrame(right, text="AT Interface", padding=8)
        at_iface.pack(fill="x", pady=(10, 0))
        ttk.Label(at_iface, text="AT baud rate:").grid(row=0, column=0, sticky="w", pady=4)
        ttk.Combobox(at_iface, textvariable=self.new_baud_var, width=12,
                     values=["9600", "19200", "38400", "57600", "115200",
                             "230400", "460800", "921600"])\
            .grid(row=0, column=1, sticky="w", padx=(12, 6))
        ttk.Button(at_iface, text="Set baud rate", command=self._set_baud)\
            .grid(row=0, column=2, sticky="w")
        ttk.Label(at_iface, text="The device replies at the old baud rate first; the host serial port then switches automatically.",
                  style="Hint.TLabel").grid(row=1, column=0, columnspan=3,
                                            sticky="w", pady=(4, 0))

        buttons = ttk.Frame(tab)
        buttons.grid(row=1, column=0, columnspan=2, sticky="w", pady=(16, 0))
        ttk.Button(buttons, text="Read config", command=self._read_config)\
            .pack(side="left", padx=(0, 8))
        ttk.Button(buttons, text="Apply config", command=self._write_config)\
            .pack(side="left")

    def _config_row(self, parent, row, label, var, state="normal") -> None:
        ttk.Label(parent, text=label + ":").grid(row=row, column=0, sticky="w", pady=4)
        entry = ttk.Entry(parent, textvariable=var, width=24, state=state)
        entry.grid(row=row, column=1, sticky="w", padx=(12, 0))

    def _config_combo(self, parent, row, label, var, values):
        ttk.Label(parent, text=label + ":").grid(row=row, column=0, sticky="w", pady=4)
        combo = ttk.Combobox(parent, textvariable=var, values=values, width=30,
                             state="readonly")
        combo.grid(row=row, column=1, sticky="w", padx=(12, 0))
        return combo

    def _build_target_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=8)
        self.notebook.add(tab, text="Online Operations")
        tab.columnconfigure(0, weight=1)
        tab.columnconfigure(1, weight=1)
        tab.rowconfigure(2, weight=1)

        connect = ttk.LabelFrame(tab, text="Connect and ID", padding=8)
        connect.grid(row=0, column=0, columnspan=2, sticky="ew", pady=(0, 8))
        ttk.Button(connect, text="Connect target", command=self._target_connect)\
            .grid(row=0, column=0, padx=(0, 6))
        ttk.Button(connect, text="Query status", command=self._target_status)\
            .grid(row=0, column=1, padx=(0, 6))
        ttk.Button(connect, text="Read ID", command=self._target_id)\
            .grid(row=0, column=2, padx=(0, 16))
        ttk.Label(connect, text="Status:").grid(row=0, column=3)
        self.target_status_label = ttk.Label(connect, textvariable=self.target_status_var,
                                             style="Bad.TLabel")
        self.target_status_label.grid(row=0, column=4, padx=(4, 16))
        ttk.Label(connect, text="Chip ID:").grid(row=0, column=5)
        ttk.Label(connect, textvariable=self.target_id_var,
                  font=("Consolas", 9)).grid(row=0, column=6, padx=(4, 0))

        reset = ttk.LabelFrame(tab, text="Reset", padding=8)
        reset.grid(row=1, column=0, sticky="ew", padx=(0, 4), pady=(0, 8))
        self.reset_combo = ttk.Combobox(
            reset, textvariable=self.reset_type_var,
            values=list(RESET_TYPE_LABELS.values()), state="readonly",
            width=30)
        self.reset_combo.pack(side="left", padx=(0, 8))
        ttk.Button(reset, text="Reset", command=self._target_reset).pack(side="left")

        erase = ttk.LabelFrame(tab, text="Erase", padding=8)
        erase.grid(row=1, column=1, sticky="ew", padx=(4, 0), pady=(0, 8))
        ttk.Button(erase, text="Chip erase", command=self._erase_chip)\
            .pack(side="left", padx=(0, 12))
        ttk.Label(erase, text="Sector:").pack(side="left")
        ttk.Entry(erase, textvariable=self.erase_addr_var, width=12).pack(side="left", padx=4)
        ttk.Entry(erase, textvariable=self.erase_size_var, width=8).pack(side="left", padx=4)
        ttk.Button(erase, text="Erase sector", command=self._erase_sector)\
            .pack(side="left", padx=(4, 0))

        read = ttk.LabelFrame(tab, text="Read Target Memory", padding=8)
        read.grid(row=2, column=0, sticky="nsew", padx=(0, 4))
        read.rowconfigure(2, weight=1)
        read.columnconfigure(0, weight=1)
        row = ttk.Frame(read)
        row.grid(row=0, column=0, sticky="ew")
        ttk.Label(row, text="Address:").pack(side="left")
        ttk.Entry(row, textvariable=self.read_addr_var, width=14).pack(side="left", padx=4)
        ttk.Label(row, text="Length:").pack(side="left")
        ttk.Entry(row, textvariable=self.read_size_var, width=10).pack(side="left", padx=4)
        ttk.Button(row, text="Read", command=self._read_memory).pack(side="left", padx=(4, 4))
        ttk.Button(row, text="Save...", command=self._save_memory).pack(side="left")
        self.read_progress = ttk.Progressbar(read, mode="determinate")
        self.read_progress.grid(row=1, column=0, sticky="ew", pady=(6, 4))
        ttk.Label(read, textvariable=self.read_info_var).grid(row=3, column=0, sticky="w")
        self.read_text = scrolledtext.ScrolledText(
            read, height=12, wrap="none", font=("Consolas", 9), state="disabled")
        self.read_text.grid(row=2, column=0, sticky="nsew", pady=(4, 4))

        write = ttk.LabelFrame(tab, text="Write Target Memory", padding=8)
        write.grid(row=2, column=1, sticky="nsew", padx=(4, 0))
        write.columnconfigure(1, weight=1)
        ttk.Label(write, text="Address:").grid(row=0, column=0, sticky="w")
        self.write_addr_entry = ttk.Entry(
            write, textvariable=self.write_addr_var, width=16)
        self.write_addr_entry.grid(row=0, column=1, sticky="w", padx=(4, 0))
        ttk.Label(write, text="File:").grid(row=1, column=0, sticky="w", pady=4)
        ttk.Entry(write, textvariable=self.write_file_var, width=34)\
            .grid(row=1, column=1, sticky="ew", padx=(4, 0))
        ttk.Button(write, text="Browse...", command=self._browse_write_file)\
            .grid(row=1, column=2, padx=(4, 0))
        options = ttk.Frame(write)
        options.grid(row=2, column=0, columnspan=3, sticky="w", pady=4)
        ttk.Checkbutton(options, text="Verify after write",
                        variable=self.write_verify_var).pack(side="left")
        ttk.Checkbutton(options, text="Send write prepare command",
                        variable=self.write_prepare_var).pack(side="left", padx=(12, 0))
        actions = ttk.Frame(write)
        actions.grid(row=3, column=0, columnspan=3, sticky="w", pady=(4, 0))
        ttk.Button(actions, text="Write", command=self._write_memory).pack(side="left")
        ttk.Button(actions, text="Send prepare only",
                   command=self._write_prepare_only).pack(side="left", padx=(8, 0))
        self.write_progress = ttk.Progressbar(write, mode="determinate")
        self.write_progress.grid(row=4, column=0, columnspan=3, sticky="ew", pady=(8, 2))
        ttk.Label(write, textvariable=self.write_status_var)\
            .grid(row=5, column=0, columnspan=3, sticky="w")

        ob = ttk.LabelFrame(tab, text="OptionByte", padding=8)
        ob.grid(row=3, column=0, columnspan=2, sticky="ew", pady=(8, 0))
        ttk.Button(ob, text="Read OB", command=self._read_ob)\
            .grid(row=0, column=0, padx=(0, 8))
        ttk.Button(ob, text="Write vendor default OB", command=self._write_vendor_ob)\
            .grid(row=0, column=1, padx=(0, 8))
        ttk.Button(ob, text="Write user OB", command=self._write_user_ob)\
            .grid(row=0, column=2, padx=(0, 12))
        self.ob_label = ttk.Label(ob, text="-", font=("Consolas", 9), wraplength=700)
        self.ob_label._i18n_skip = True
        self.ob_label.grid(row=0, column=3, sticky="w")

        factory = ttk.LabelFrame(tab, text="Factory Test", padding=8)
        factory.grid(row=4, column=0, columnspan=2, sticky="ew", pady=(8, 0))
        ttk.Button(factory, text="Run factory SRAM firmware", command=self._factory_sram)\
            .pack(side="left", padx=(0, 8))
        ttk.Button(factory, text="Run factory Flash firmware", command=self._factory_flash)\
            .pack(side="left")
        ttk.Label(factory, text="Corresponds to factory_run_sram_fw / factory_run_flash_fw",
                  style="Hint.TLabel").pack(side="left", padx=(16, 0))

    def _build_project_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=12)
        self.notebook.add(tab, text="Offline Programming")
        tab.columnconfigure(0, weight=1)
        tab.columnconfigure(1, weight=1)

        info = ttk.LabelFrame(tab, text="Project Info", padding=8)
        info.grid(row=0, column=0, columnspan=2, sticky="ew")
        ttk.Label(info, text="Status:").grid(row=0, column=0, sticky="w")
        ttk.Label(info, textvariable=self.proj_active_var)\
            .grid(row=0, column=1, sticky="w", padx=(8, 24))
        ttk.Label(info, text="Size:").grid(row=0, column=2, sticky="w")
        ttk.Label(info, textvariable=self.proj_size_var)\
            .grid(row=0, column=3, sticky="w", padx=(8, 24))
        ttk.Label(info, text="CRC32:").grid(row=0, column=4, sticky="w")
        ttk.Label(info, textvariable=self.proj_crc_var)\
            .grid(row=0, column=5, sticky="w", padx=(8, 24))
        ttk.Button(info, text="Refresh", command=self._project_refresh)\
            .grid(row=0, column=6, sticky="e")

        load = ttk.LabelFrame(tab, text="Load project", padding=8)
        load.grid(row=1, column=0, sticky="nsew", padx=(0, 6), pady=(10, 0))
        load.columnconfigure(1, weight=1)
        ttk.Label(load, text="File:").grid(row=0, column=0, sticky="w")
        ttk.Entry(load, textvariable=self.proj_file_var)\
            .grid(row=0, column=1, sticky="ew", padx=(4, 4))
        ttk.Button(load, text="Browse...", command=self._browse_project)\
            .grid(row=0, column=2)
        ttk.Label(load, text="Project name:").grid(row=1, column=0, sticky="w", pady=4)
        ttk.Entry(load, textvariable=self.proj_name_var)\
            .grid(row=1, column=1, columnspan=2, sticky="ew", padx=(4, 0), pady=4)
        ttk.Label(load, text="Password:").grid(row=2, column=0, sticky="w")
        ttk.Entry(load, textvariable=self.proj_password_var, show="*")\
            .grid(row=2, column=1, columnspan=2, sticky="ew", padx=(4, 0))
        ttk.Label(load, text="File name encoding:").grid(row=3, column=0, sticky="w", pady=4)
        ttk.Combobox(load, textvariable=self.proj_encoding_var,
                     values=["auto", "gbk", "utf-8"], state="readonly", width=10)\
            .grid(row=3, column=1, sticky="w", padx=(4, 0), pady=4)
        ttk.Button(load, text="Load to writer", command=self._project_load)\
            .grid(row=4, column=0, columnspan=2, sticky="w", pady=(6, 0))
        ttk.Button(load, text="Disable Project", command=self._project_disable)\
            .grid(row=4, column=2, sticky="e", pady=(6, 0))
        ttk.Label(load, textvariable=self.project_status_var)\
            .grid(row=5, column=0, columnspan=3, sticky="w", pady=(8, 0))
        self.project_progress = ttk.Progressbar(load, mode="determinate")
        self.project_progress.grid(row=6, column=0, columnspan=3, sticky="ew", pady=(4, 0))

        offline = ttk.LabelFrame(tab, text="Offline Write", padding=8)
        offline.grid(row=1, column=1, sticky="nsew", padx=(6, 0), pady=(10, 0))
        offline.columnconfigure(0, weight=1)
        ttk.Label(offline, text="Offline status is polled automatically after starting; you can also query manually.",
                  style="Hint.TLabel").grid(row=0, column=0, columnspan=3, sticky="w")
        ttk.Button(offline, text="Start offline write", command=self._offline_start)\
            .grid(row=1, column=0, sticky="w", pady=(8, 0))
        ttk.Button(offline, text="Query status", command=self._offline_query)\
            .grid(row=1, column=1, sticky="w", padx=(8, 0), pady=(8, 0))
        ttk.Button(offline, text="Stop polling", command=self._offline_stop_clicked)\
            .grid(row=1, column=2, sticky="w", padx=(8, 0), pady=(8, 0))
        ttk.Label(offline, textvariable=self.offline_status_var)\
            .grid(row=2, column=0, columnspan=3, sticky="w", pady=(8, 2))
        self.offline_progress = ttk.Progressbar(offline, mode="determinate")
        self.offline_progress.grid(row=3, column=0, columnspan=3, sticky="ew")

        switch = ttk.LabelFrame(tab, text="Switch Project (PWX1)", padding=8)
        switch.grid(row=2, column=0, columnspan=2, sticky="ew", pady=(10, 0))
        switch.columnconfigure(1, weight=1)
        ttk.Label(switch, text="Project name:").grid(row=0, column=0, sticky="w")
        ttk.Entry(switch, textvariable=self.switch_name_var)\
            .grid(row=0, column=1, sticky="ew", padx=(4, 12))
        ttk.Label(switch, text="Password:").grid(row=0, column=2, sticky="w")
        ttk.Entry(switch, textvariable=self.switch_password_var, show="*", width=16)\
            .grid(row=0, column=3, padx=(4, 12))
        ttk.Checkbutton(switch, text="Reload", variable=self.switch_reload_var)\
            .grid(row=0, column=4, padx=(0, 12))
        ttk.Button(switch, text="Switch", command=self._project_switch)\
            .grid(row=0, column=5)

    def _build_broadcast_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=12)
        self.notebook.add(tab, text="Broadcast")
        tab.columnconfigure(0, weight=1)
        tab.rowconfigure(2, weight=1)
        tab.rowconfigure(4, weight=1)

        controls = ttk.Frame(tab)
        controls.grid(row=0, column=0, sticky="ew")
        ttk.Label(controls, text="Direction:").pack(side="left")
        self.broadcast_dir_combo = ttk.Combobox(
            controls, textvariable=self.broadcast_dir_var,
            values=list(BROADCAST_DIR_LABELS.values()), state="readonly",
            width=20)
        self.broadcast_dir_combo.pack(side="left", padx=(4, 12))
        ttk.Checkbutton(controls, text="Hex input", variable=self.broadcast_hex_var)\
            .pack(side="left", padx=(0, 12))
        ttk.Checkbutton(controls, text="Keep full AT frame", variable=self.broadcast_keep_var)\
            .pack(side="left", padx=(0, 12))
        ttk.Checkbutton(controls, text="Wait for response", variable=self.broadcast_wait_var)\
            .pack(side="left", padx=(0, 12))
        ttk.Button(controls, text="Send", command=self._broadcast_send)\
            .pack(side="left")

        ttk.Label(tab, text="Send data:").grid(row=1, column=0, sticky="w", pady=(8, 2))
        self.broadcast_text = tk.Text(tab, height=4, font=("Consolas", 10))
        self.broadcast_text.grid(row=2, column=0, sticky="nsew", pady=(0, 8))

        ttk.Label(tab, text="Response:").grid(row=3, column=0, sticky="w", pady=(0, 2))
        self.broadcast_response = scrolledtext.ScrolledText(
            tab, height=6, wrap="none", font=("Consolas", 9), state="disabled")
        self.broadcast_response.grid(row=4, column=0, sticky="nsew")

    def _build_demo_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=12)
        self.notebook.add(tab, text="Sample Workflow")
        tab.columnconfigure(0, weight=1)
        tab.rowconfigure(0, weight=1)

        guide = ttk.LabelFrame(tab, text="API call order and dependencies", padding=8)
        guide.grid(row=0, column=0, sticky="nsew")
        guide.columnconfigure(0, weight=1)
        guide.rowconfigure(0, weight=1)
        text = tk.Text(guide, wrap="word", height=18, font=("Consolas", 9))
        text.grid(row=0, column=0, sticky="nsew")
        scrollbar = ttk.Scrollbar(guide, orient="vertical", command=text.yview)
        scrollbar.grid(row=0, column=1, sticky="ns")
        text.configure(yscrollcommand=scrollbar.set)
        text.insert("1.0", GUIDE_TEXT)
        text.configure(state="disabled")

        run = ttk.LabelFrame(tab, text="Run Sample", padding=8)
        run.grid(row=1, column=0, sticky="ew", pady=(10, 0))
        ttk.Button(run, text="Run safe workflow",
                   command=lambda: self._run_demo(False)).pack(side="left")
        ttk.Button(run, text="Run full workflow (destructive)",
                   command=lambda: self._run_demo(True)).pack(side="left", padx=(8, 0))
        stop_frame = ttk.Frame(run)
        stop_frame.pack(side="left", padx=(8, 0))
        ttk.Button(stop_frame, text="Stop", command=self._demo_stop_clicked)\
            .pack()
        ttk.Label(run, textvariable=self.demo_status_var)\
            .pack(side="left", padx=(16, 0))
        settings_frame = ttk.Frame(run)
        settings_frame.pack(side="right")
        ttk.Button(settings_frame, text="Batch test settings",
                   command=self._edit_workflow_settings)\
            .pack()

        self.demo_progress = ttk.Progressbar(tab, mode="determinate")
        self.demo_progress.grid(row=2, column=0, sticky="ew", pady=(8, 0))
        ttk.Label(tab, text="The full workflow erases/writes Flash, writes OptionByte and loads an offline project.",
                  style="Hint.TLabel").grid(row=3, column=0, sticky="w", pady=(4, 0))

    # ==================================================================
    # Background tasks / queue
    # ==================================================================
    def _post(self, fn) -> None:
        self.queue.put(fn)

    def _log_cb(self, level: str, message: str) -> None:
        # May be called from reader/worker threads: enqueue, never touch Tk.
        self.queue.put(("log", level, message))

    def _poll_queue(self) -> None:
        try:
            while True:
                item = self.queue.get_nowait()
                if isinstance(item, tuple) and item and item[0] == "log":
                    _, level, message = item
                    if level == "debug" and not self.show_frames_var.get():
                        continue
                    self._append_log(level, message)
                elif callable(item):
                    try:
                        item()
                    except Exception:
                        traceback.print_exc()
        except queue.Empty:
            pass
        self._poll_after_id = self.root.after(80, self._poll_queue)

    def _append_log(self, level: str, message: str) -> None:
        tag = LOG_TAGS.get(level, ("info", "#1a1a1a"))[0]
        prefix = self._t(LOG_PREFIX.get(level, ""))
        message = self._t(message)
        line = "[%s] %s %s\n" % (time.strftime("%H:%M:%S"), prefix, message)
        self.log_text.configure(state="normal")
        self.log_text.insert("end", line, tag)
        self.log_text.see("end")
        self.log_text.configure(state="disabled")

    def _clear_log(self) -> None:
        self.log_text.configure(state="normal")
        self.log_text.delete("1.0", "end")
        self.log_text.configure(state="disabled")

    def _save_log(self) -> None:
        path = filedialog.asksaveasfilename(
            title=self._t("Save log"), defaultextension=".log",
            filetypes=[
                (self._t("Log files"), "*.log"),
                (self._t("Text files"), "*.txt"),
                (self._t("All files"), "*.*"),
            ],
        )
        if not path:
            return
        Path(path).write_text(self.log_text.get("1.0", "end"), encoding="utf-8")
        self._append_log("info", self._t("Log saved to %s", path))

    def _set_busy(self, busy: bool, text: str = "") -> None:
        self.busy = busy
        if text:
            self.status_var.set(self._t(text))
        else:
            self.status_var.set(self._t("Working..." if busy else "Ready"))
        self._update_conn_buttons()

    def _run(self, task) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        if self.busy:
            messagebox.showinfo(
                self._t("Please wait"),
                self._t("The previous operation has not finished"))
            return

        self._set_busy(True)

        def worker():
            try:
                task()
            except Exception as exc:
                self.queue.put(("log", "error", traceback.format_exc().strip()))
                self._post(lambda e=exc: self._show_error(e))
            finally:
                self._post(lambda: self._set_busy(False, "Ready"))

        threading.Thread(target=worker, daemon=True).start()

    def _show_error(self, exc: Exception) -> None:
        self._append_log("error", str(exc))
        messagebox.showerror(self._t("Operation failed"), str(exc))

    def _update_conn_buttons(self) -> None:
        connected = bool(self.client is not None and self.client.is_open)
        self.connect_btn.configure(
            state="disabled" if connected or self.busy else "normal")
        self.disconnect_btn.configure(
            state="normal" if connected and not self.busy else "disabled")
        for widget in (self.port_combo, self.refresh_btn, self.baud_combo,
                       self.encrypt_chk, self.pw_only_chk):
            widget.configure(state="disabled" if connected else "normal")
        if not connected:
            self.baud_combo.configure(state="normal")
        if hasattr(self, "language_combo"):
            self.language_combo.configure(
                state="disabled" if self.busy else "readonly")

    def _set_conn_status(self, template: str, *args, ok: bool = False,
                         busy: bool = False) -> None:
        self._conn_template = template
        self._conn_args = args
        self._conn_ok = ok
        self._conn_busy = busy
        self._render_conn_status()

    # ==================================================================
    # Connect / disconnect
    # ==================================================================
    def _refresh_ports(self) -> None:
        all_ports = list_serial_ports()
        powerwriter_ports = [p for p in all_ports if p.is_powerwriter]
        only_powerwriter = bool(self.pw_only_var.get())

        if not all_ports:
            self._port_map = {}
            self.port_combo["values"] = [self._t("No serial port found")]
            self._append_log("warn", "No serial port found")
            return

        if only_powerwriter and powerwriter_ports:
            shown = powerwriter_ports
        else:
            shown = all_ports
            if only_powerwriter:
                self._append_log(
                    "warn", "No PowerWriter device detected; showing all serial ports")

        self._port_map = {str(p): p.device for p in shown}
        self.port_combo["values"] = list(self._port_map)
        preferred = powerwriter_ports[0] if powerwriter_ports else shown[0]
        if self.port_var.get() not in self._port_map:
            self.port_var.set(str(preferred))

        filtered = (self._t(" (filtered display)")
                    if only_powerwriter and powerwriter_ports else "")
        self._append_log(
            "info",
            self._t("Found %d serial port(s), %d PowerWriter%s",
                    len(all_ports), len(powerwriter_ports), filtered))

    def _configure_encryption(self) -> bool:
        dialog = EncryptionDialog(
            self.root, self._t, self.encrypt_key_hex, self.encrypt_iv_hex)
        if dialog.result is None:
            return False
        self.encrypt_key_hex, self.encrypt_iv_hex = dialog.result
        return True

    def _on_encrypt_toggle(self) -> None:
        if self.busy or (self.client is not None and self.client.is_open):
            return
        if self.encrypt_var.get():
            if not self._configure_encryption():
                self.encrypt_var.set(False)
                return
            self._append_log(
                "info", self._t("AES encryption enabled; key and IV configured"))
        else:
            self._append_log("info", self._t("AES encryption disabled"))

    def _on_connect(self) -> None:
        if self.busy:
            return
        text = self.port_var.get().strip()
        if not text:
            messagebox.showwarning(
                self._t("No serial port selected"),
                self._t("Select a serial port"))
            return
        port = self._port_map.get(text, text)
        try:
            baud = int(self.baud_var.get())
        except ValueError:
            messagebox.showerror(
                self._t("Invalid parameter"),
                self._t("Baud rate must be an integer"))
            return

        encrypt = bool(self.encrypt_var.get())
        if encrypt and not (self.encrypt_key_hex and self.encrypt_iv_hex):
            if not self._configure_encryption():
                self.encrypt_var.set(False)
                return
        self._set_busy(True, "Connecting...")
        self._set_conn_status("Connecting to %s ...", port, busy=True)
        try:
            client = PowerWriterAT(
                encrypt=encrypt, log=self._log_cb,
                encrypt_key=(self.encrypt_key_hex or None) if encrypt else None,
                encrypt_iv=(self.encrypt_iv_hex or None) if encrypt else None)
        except ValueError as exc:
            self._set_busy(False, "Ready")
            self._set_conn_status("Not connected")
            messagebox.showerror(self._t("Invalid parameter"), str(exc))
            return
        self._append_log("info", self._t("Connecting to %s @ %d ...", port, baud))

        def worker():
            try:
                client.open_serial(port, baud)
                info = client.get_writer_info()
            except Exception as exc:
                try:
                    client.close()
                except Exception:
                    pass
                self._post(lambda e=exc: self._connect_failed(e))
                return

            # Configuration is optional for connecting: a device without an
            # offline project may answer config-get with OFFLINE_DISABLE.
            cfg = None
            config_error = None
            try:
                cfg = client.get_writer_config()
            except Exception as exc:
                config_error = exc
            self._post(lambda: self._connect_succeeded(client, info, cfg, config_error))

        threading.Thread(target=worker, daemon=True).start()

    def _connect_succeeded(self, client, info, cfg, config_error=None) -> None:
        self.client = client
        self._apply_info(info)
        if cfg is not None:
            self._apply_config(cfg)
        if config_error is not None:
            self._append_log(
                "warn",
                self._t("Failed to read config (connection unaffected): %s",
                        config_error))
        self._set_conn_status(
            "Connected: %s (%s)", client.port,
            info.oem or "PowerWriter", ok=True)
        self._set_busy(False, "Ready")
        self._append_log("info", self._t("Connected successfully: %s", info))

    def _connect_failed(self, exc) -> None:
        self.client = None
        self._set_busy(False, "Ready")
        self._set_conn_status("Not connected")
        self._append_log("error", self._t("Connection failed: %s", exc))
        messagebox.showerror(self._t("Connection failed"), str(exc))

    def _on_disconnect(self) -> None:
        if self.busy:
            messagebox.showinfo(
                self._t("Please wait"),
                self._t("An operation is in progress; cannot disconnect right now"))
            return
        if self.client is not None:
            self.client.close()
            self.client = None
        self._set_conn_status("Not connected")
        self._update_conn_buttons()
        self._append_log("info", "Disconnected")

    # ==================================================================
    # Writer information / configuration
    # ==================================================================
    def _read_info(self) -> None:
        def task():
            info = self.client.get_writer_info()
            self._post(lambda: self._apply_info(info))
            try:
                cfg = self.client.get_writer_config()
            except PowerWriterATError as exc:
                self._post(lambda e=exc: self._append_log(
                    "warn", self._t("Failed to read config: %s", e)))
                return
            self._post(lambda: self._apply_config(cfg))
        self._run(task)

    def _apply_info(self, info) -> None:
        self.info_vars["oem"].set(info.oem or "-")
        self.info_vars["sn"].set(info.sn or "-")
        self.info_vars["hw"].set(info.hardware_version or "-")
        self.info_vars["boot"].set(info.bootloader_version or "-")
        self.info_vars["iface"].set(info.interface_version or "-")
        if self.client is not None:
            self.info_vars["lib"].set("%s (ABI 0x%08X)" % (
                self.client.library_path or "-", self.client.library_version))
            self.info_vars["encrypt"].set(
                self._t("Enabled") if self.client.encrypt else self._t("Disabled"))

    def _show_about(self) -> None:
        extra = ""
        if self.client is not None:
            extra = ("\n\n%s: %s\n%s: 0x%08X\n%s: %s"
                     % (self._t("Bound library"),
                        self.client.library_path or "-",
                        self._t("ABI version"),
                        self.client.library_version,
                        self._t("AT encryption"),
                        self._t("Enabled") if self.client.encrypt
                        else self._t("Disabled")))
        messagebox.showinfo(
            self._t("About PowerWriter AT Commander"),
            INTRODUCTION + extra)

    def _apply_config(self, cfg: WriterConfig) -> None:
        def label(mapping, enum_cls, value):
            try:
                return self._t(mapping[enum_cls(value)])
            except (ValueError, KeyError):
                return str(value)

        self.cfg_vendor.set(cfg.target_vendor)
        self.cfg_series.set(cfg.target_series)
        self.cfg_model.set(cfg.target_model)
        self.cfg_erase.set(label(ERASE_TYPE_LABELS, EraseType, cfg.erase_type))
        self.cfg_vext.set(label(VEXT_LABELS, OutputVext, cfg.output_vext_type))
        self.cfg_clock.set(label(CLOCK_LABELS, ClockType, cfg.clock_type))
        self.cfg_ob.set(label(OB_UPDATE_LABELS, OBUpdateType, cfg.ob_update_type))
        self.cfg_buzzer.set(1 if cfg.buzzer_enable else 0)
        self._limit_enable_value = bool(cfg.limit_number_enable)
        self._render_limit_enable()
        self.cfg_limit_number.set(str(cfg.limit_number))
        self.cfg_auto.set(1 if cfg.target_auto_enable else 0)
        self.cfg_in_debounce.set(str(cfg.target_auto_in_debounce))
        self.cfg_out_debounce.set(str(cfg.target_auto_out_debounce))
        self.cfg_disable_power.set(1 if cfg.disable_power_ap else 0)
        self.cfg_run_ap.set(1 if cfg.run_ap else 0)
        self.cfg_power_on.set(str(cfg.power_on_debounce))
        self.cfg_power_off.set(str(cfg.power_off_debounce))
        try:
            reset_label = self._t(RESET_TYPE_LABELS[ResetType(cfg.reset_type)])
            self.cfg_reset_pin_combo["values"] = [
                self._t(label) for label in RESET_TYPE_LABELS.values()]
            self.cfg_reset_pin.set(reset_label)
        except (ValueError, KeyError):
            reset_pin = str(cfg.reset_type)
            self.cfg_reset_pin_combo["values"] = [
                self._t(label) for label in RESET_TYPE_LABELS.values()
            ] + [reset_pin]
            self.cfg_reset_pin.set(reset_pin)
            self._append_log(
                "warn",
                self._t("Unsupported reset pin control value: %s", reset_pin))

    def _read_config(self) -> None:
        def task():
            cfg = self.client.get_writer_config()
            self._post(lambda: self._apply_config(cfg))
        self._run(task)

    def _translated_value_map(self, mapping) -> dict:
        return {self._t(label): int(value) for value, label in mapping.items()}

    def _collect_int(self, var: tk.StringVar, name: str, maximum: int = 0xFFFF) -> int:
        try:
            value = int(var.get(), 0)
        except ValueError:
            raise ValueError(self._t("%s must be an integer", self._t(name)))
        if value < 0 or value > maximum:
            raise ValueError(
                self._t("%s must be between 0 and %d",
                        self._t(name), maximum))
        return value

    def _collect_config(self) -> WriterConfig:
        try:
            erase = self._translated_value_map(ERASE_TYPE_LABELS)[
                self.cfg_erase.get()]
            vext = self._translated_value_map(VEXT_LABELS)[
                self.cfg_vext.get()]
            clock = self._translated_value_map(CLOCK_LABELS)[
                self.cfg_clock.get()]
            ob = self._translated_value_map(OB_UPDATE_LABELS)[
                self.cfg_ob.get()]
        except KeyError as exc:
            raise ValueError(self._t("Invalid configuration item: %s", exc))
        reset_label = self.cfg_reset_pin.get()
        try:
            reset_type = self._translated_value_map(RESET_TYPE_LABELS)[
                reset_label]
        except KeyError:
            try:
                reset_type = int(reset_label, 0)
            except ValueError:
                raise ValueError(self._t(
                    "Invalid configuration item: %s", reset_label)) from None
            if not 0 <= reset_type <= 0xFF:
                raise ValueError(self._t(
                    "%s must be between 0 and %d",
                    self._t("reset pin control"), 0xFF))
        return WriterConfig(
            target_vendor=self.cfg_vendor.get(),
            target_series=self.cfg_series.get(),
            target_model=self.cfg_model.get(),
            erase_type=erase,
            output_vext_type=vext,
            clock_type=clock,
            buzzer_enable=1 if self.cfg_buzzer.get() else 0,
            ob_update_type=ob,
            limit_number_enable=1 if self.cfg_limit_enable.get() == self._t("On") else 0,
            limit_number=int(self.cfg_limit_number.get() or 0),
            target_auto_enable=1 if self.cfg_auto.get() else 0,
            target_auto_in_debounce=self._collect_int(
                self.cfg_in_debounce, "insertion debounce"),
            target_auto_out_debounce=self._collect_int(
                self.cfg_out_debounce, "removal debounce"),
            disable_power_ap=1 if self.cfg_disable_power.get() else 0,
            run_ap=1 if self.cfg_run_ap.get() else 0,
            power_on_debounce=self._collect_int(
                self.cfg_power_on, "power-on debounce"),
            power_off_debounce=self._collect_int(
                self.cfg_power_off, "power-off debounce"),
            reset_type=reset_type,
        )

    def _write_config(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        try:
            cfg = self._collect_config()
        except ValueError as exc:
            messagebox.showerror(self._t("Invalid parameter"), str(exc))
            return

        def task():
            self.client.set_writer_config(cfg)
            new_cfg = self.client.get_writer_config()
            self._post(lambda: self._apply_config(new_cfg))
            self._post(lambda: self._append_log(
                "info", "Configuration updated"))
        self._run(task)

    def _set_baud(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        try:
            baud = int(self.new_baud_var.get())
        except ValueError:
            messagebox.showerror(
                self._t("Invalid parameter"),
                self._t("AT baud rate must be an integer"))
            return

        def task():
            self.client.set_baudrate(baud)
            self._post(lambda: self.baud_var.set(str(baud)))
            self._post(lambda: self._append_log(
                "info",
                self._t("AT baud rate switched to %d; host serial port synchronized",
                        baud)))
        self._run(task)

    # ==================================================================
    # Target chip
    # ==================================================================
    def _set_target_status(self, connected: bool, error: str = "") -> None:
        self._target_connected = connected
        self._target_error = error or ""
        self._target_state = "connected" if connected else "disconnected"
        self._render_target_status()

    def _target_connect(self) -> None:
        def task():
            self.client.target_connect()
            self._post(self._show_connect_sent)

        self._run(task)

    def _show_connect_sent(self) -> None:
        self._target_connected = None
        self._target_state = "sent"
        self._target_error = ""
        self._render_target_status()

    def _target_status(self) -> None:
        def task():
            connected = wait_target_connected(self.client, 5)
            error = "" if connected else self.client.last_error_text
            self._post(lambda: self._set_target_status(connected, error))
        self._run(task)

    def _target_id(self) -> None:
        def task():
            cid = self.client.target_get_id()
            self._post(lambda: self.target_id_var.set(cid.hex))
        self._run(task)

    def _target_reset(self) -> None:
        reset_by_label = self._translated_value_map(RESET_TYPE_LABELS)
        reset_type = reset_by_label.get(
            self.reset_type_var.get(), ResetType.HW_CORE_RESET)

        def task():
            self.client.target_reset(reset_type)
            self._post(lambda: self._set_target_status(
                False, "Reconnect required after reset"))
        self._run(task)

    def _parse_target_int(self, var: tk.StringVar, name: str) -> int:
        try:
            return int(var.get(), 0)
        except ValueError:
            raise ValueError(self._t(
                "%s must be an integer (0x prefix supported)", self._t(name)))

    def _read_memory(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        try:
            address = self._parse_target_int(self.read_addr_var, "address")
            size = self._parse_target_int(self.read_size_var, "length")
        except ValueError as exc:
            messagebox.showerror(self._t("Invalid parameter"), str(exc))
            return
        if size <= 0:
            messagebox.showerror(
                self._t("Invalid parameter"),
                self._t("Length must be greater than 0"))
            return

        def progress(processed, total):
            self._post(lambda p=processed, t=total: self._set_progress(
                self.read_progress, self.read_info_var, "Read", p, t))

        def task():
            data = self.client.target_read(address, size, progress)
            self._post(lambda: self._show_memory(address, data))

        self._set_progress(self.read_progress, self.read_info_var, "Read", 0, size)
        self._run(task)

    def _show_memory(self, address: int, data: bytes) -> None:
        self._last_read = (address, data)
        limit = 64 * 1024
        display = data[:limit]
        text = hexdump(display, address)
        if len(data) > limit:
            text += "\n" + self._t(
                "... showing first %d bytes only (of %d bytes); save to a file for the full content",
                limit, len(data))
        self.read_text.configure(state="normal")
        self.read_text.delete("1.0", "end")
        self.read_text.insert("1.0", text)
        self.read_text.configure(state="disabled")
        self.read_info_var.set("%d bytes @ 0x%08X" % (len(data), address))

    def _save_memory(self) -> None:
        if not self._last_read:
            messagebox.showinfo(
                self._t("No data"),
                self._t("Read the target memory first"))
            return
        address, data = self._last_read
        path = filedialog.asksaveasfilename(
            title=self._t("Save target memory"), defaultextension=".bin",
            initialfile="memory_%08X.bin" % address,
            filetypes=[
                (self._t("Binary files"), "*.bin"),
                (self._t("All files"), "*.*"),
            ],
        )
        if path:
            Path(path).write_bytes(data)
            self._append_log(
                "info", self._t("Saved %d bytes to %s", len(data), path))

    def _on_write_file_changed(self, *_args) -> None:
        if not hasattr(self, "write_addr_entry"):
            return
        suffix = Path(self.write_file_var.get()).suffix.lower()
        self.write_addr_entry.configure(
            state="disabled" if suffix in (".hex", ".ihx") else "normal")

    def _browse_write_file(self) -> None:
        path = filedialog.askopenfilename(
            title=self._t("Select a file to write"),
            filetypes=[
                (self._t("HEX files"), "*.hex *.ihx"),
                (self._t("Binary files"), "*.bin *.img"),
                (self._t("All files"), "*.*"),
            ],
        )
        if path:
            self.write_file_var.set(path)

    def _write_memory(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        path = Path(self.write_file_var.get())
        if not path.is_file():
            messagebox.showerror(
                self._t("File error"),
                self._t("Select a valid file"))
            return

        is_hex = path.suffix.lower() in (".hex", ".ihx")
        if is_hex:
            try:
                image = parse_intel_hex(path)
            except (OSError, HexError) as exc:
                messagebox.showerror(
                    self._t("File error"),
                    self._t("Invalid HEX file: %s", exc))
                return
            segments = image.segments
            total = image.total_size
            if not total:
                messagebox.showerror(
                    self._t("File error"),
                    self._t("File is empty"))
                return
            confirm_text = self._t(
                "HEX file contains %d segment(s), %d bytes; addresses are taken from the file.\nContinue?",
                len(segments), total)
        else:
            try:
                address = self._parse_target_int(self.write_addr_var, "address")
            except ValueError as exc:
                messagebox.showerror(self._t("Invalid parameter"), str(exc))
                return
            data = path.read_bytes()
            if not data:
                messagebox.showerror(
                    self._t("File error"),
                    self._t("File is empty"))
                return
            segments = [(address, data)]
            total = len(data)
            confirm_text = self._t(
                "About to write to 0x%08X, %d bytes; target chip data will be modified.\nContinue?",
                address, total)

        if not messagebox.askyesno(self._t("Confirm write"), confirm_text):
            return

        verify = bool(self.write_verify_var.get())
        prepare = bool(self.write_prepare_var.get())

        def progress_for(base):
            def progress(processed, segment_total):
                self._post(lambda p=base + processed, t=total: self._set_progress(
                    self.write_progress, self.write_status_var, "Write", p, t))
            return progress

        def task():
            if prepare:
                self.client.target_write_prepare(total)
            written = 0
            for segment_address, segment_data in segments:
                self.client.target_write(
                    segment_address, segment_data, prepare=False,
                    progress=progress_for(written))
                written += len(segment_data)
            self._post(lambda: self._set_progress(
                self.write_progress, self.write_status_var,
                "Write", total, total))
            if verify:
                self._post(lambda: self.write_status_var.set(
                    self._t("Verifying...")))
                for segment_address, segment_data in segments:
                    readback = self.client.target_read(
                        segment_address, len(segment_data))
                    if readback != segment_data:
                        offset = next(
                            (i for i, (a, b) in enumerate(
                                zip(readback, segment_data)) if a != b),
                            0)
                        raise PowerWriterATError(
                            ATError.TARGET_WRITE,
                            self._t(
                                "Verification failed: data mismatch at offset 0x%X",
                                segment_address + offset))
                self._post(lambda: self.write_status_var.set(
                    self._t("Write and verify passed (%d bytes)", total)))
            else:
                self._post(lambda: self.write_status_var.set(
                    self._t("Write completed (%d bytes)", total)))
            if is_hex:
                self._post(lambda: self._append_log(
                    "info",
                    self._t("Write complete: %d segment(s), %d bytes",
                            len(segments), total)))

        self._set_progress(
            self.write_progress, self.write_status_var, "Write", 0, total)
        self._run(task)

    def _write_prepare_only(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        initial = 1
        path = Path(self.write_file_var.get())
        if path.is_file():
            if path.suffix.lower() in (".hex", ".ihx"):
                try:
                    initial = max(1, parse_intel_hex(path).total_size)
                except (OSError, HexError) as exc:
                    messagebox.showerror(
                        self._t("File error"),
                        self._t("Invalid HEX file: %s", exc))
                    return
            else:
                initial = max(1, path.stat().st_size)
        total = simpledialog.askinteger(
            self._t("Send write prepare"),
            self._t("Total number of bytes to write:"),
            minvalue=1, initialvalue=initial, parent=self.root)
        if total is None:
            return
        self.write_status_var.set(self._t("Sending write prepare..."))
        self._run(lambda: self.client.target_write_prepare(total))

    def _erase_chip(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        if not messagebox.askyesno(
                self._t("Confirm erase"),
                self._t("This performs a full chip erase; target chip data will be lost.\nContinue?")):
            return
        self._run(lambda: self.client.target_erase(10000))

    def _erase_sector(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        try:
            address = self._parse_target_int(self.erase_addr_var, "sector address")
            size = self._parse_target_int(self.erase_size_var, "sector length")
        except ValueError as exc:
            messagebox.showerror(self._t("Invalid parameter"), str(exc))
            return
        if not messagebox.askyesno(
                self._t("Confirm erase"),
                self._t("About to erase the sector at 0x%08X, 0x%X bytes.\nContinue?",
                        address, size)):
            return
        self._run(lambda: self.client.target_erase_sector(address, size, 10000))

    def _read_ob(self) -> None:
        def task():
            ob = self.client.target_read_ob()
            text = self._t("%d bytes: %s", len(ob.data),
                           " ".join("%02X" % b for b in ob.data))
            self._post(lambda t=text: self.ob_label.configure(text=t))
        self._run(task)

    def _write_vendor_ob(self) -> None:
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to write the vendor default OptionByte. Continue?")):
            return
        self._run(lambda: self.client.target_write_vendor_ob())

    def _write_user_ob(self) -> None:
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to write the user OptionByte. Continue?")):
            return
        self._run(lambda: self.client.target_write_user_ob())

    def _factory_sram(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to run the factory SRAM firmware. Continue?")):
            return
        self._run(lambda: self.client.factory_run_sram_fw())

    def _factory_flash(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to run the factory Flash firmware. Continue?")):
            return
        self._run(lambda: self.client.factory_run_flash_fw())

    # ==================================================================
    # Offline project
    # ==================================================================
    def _project_refresh(self) -> None:
        def task():
            info = self.client.project_info()
            self._post(lambda: self._apply_project_info(info))
        self._run(task)

    def _apply_project_info(self, info) -> None:
        self._proj_active_state = bool(info.active)
        self._render_project_state()
        self.proj_size_var.set(self._t("%d bytes", info.size))
        self.proj_crc_var.set("0x%08X" % info.crc32)

    def _browse_project(self) -> None:
        path = filedialog.askopenfilename(
            title=self._t("Select offline project"),
            filetypes=[
                (self._t("PowerWriter project"), "*.pkg"),
                (self._t("All files"), "*.*"),
            ],
        )
        if path:
            self.proj_file_var.set(path)
            if not self.proj_name_var.get():
                self.proj_name_var.set(Path(path).name)

    def _project_load(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        path = Path(self.proj_file_var.get())
        if not path.is_file():
            messagebox.showerror(
                self._t("File error"),
                self._t("Select a valid project file"))
            return
        name = self.proj_name_var.get().strip() or path.name
        data = path.read_bytes()
        if not messagebox.askyesno(
                self._t("Confirm load"),
                self._t("About to load project %s (%d bytes) to the writer. Continue?",
                        name, len(data))):
            return

        password = self.proj_password_var.get()
        encoding = self.proj_encoding_var.get()

        def progress(processed, total):
            self._post(lambda p=processed, t=total: self._set_progress(
                self.project_progress, self.project_status_var, "Load project", p, t))

        def task():
            self.client.project_load(
                name, data,
                password=password,
                progress=progress,
                name_encoding=encoding,
            )
            self._post(lambda: self._set_progress(
                self.project_progress, self.project_status_var,
                "Load project", len(data), len(data)))
            info = self.client.project_info()
            self._post(lambda: self._apply_project_info(info))

        self._set_progress(self.project_progress, self.project_status_var,
                           "Load project", 0, len(data))
        self._run(task)

    def _project_disable(self) -> None:
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to disable the offline project on the writer. Continue?")):
            return
        def task():
            self.client.project_disable()
            info = self.client.project_info()
            self._post(lambda: self._apply_project_info(info))
        self._run(task)

    def _offline_start(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        if not messagebox.askyesno(
                self._t("Confirm"),
                self._t("About to start an offline write (this erases/writes the target chip). Continue?")):
            return
        self.offline_stop.clear()
        self.offline_status_var.set(self._t("Starting..."))
        self.offline_progress.configure(value=0, maximum=100)

        def task():
            self.client.offline_start()
            self._post(lambda: self.offline_status_var.set(
                self._t("Offline write started")))
            deadline = time.monotonic() + 180.0
            while not self.offline_stop.is_set():
                if time.monotonic() >= deadline:
                    raise TimeoutError(self._t(
                        "Timed out waiting for offline programming status"))
                status = self.client.offline_status()
                if status.failed:
                    self._post(lambda: self.offline_status_var.set(
                        self._t("Offline write failed")))
                    raise PowerWriterATError(
                        status.error_code,
                        self._t("Offline programming failed"))
                if status.state == OfflineState.OK:
                    self._post(lambda: self._offline_done(
                        "Offline write completed", 100))
                    self._post(lambda: self._append_log(
                        "info", "Offline write completed"))
                    return
                if status.progress and status.progress.total:
                    processed = status.progress.processed
                    total = status.progress.total
                    self._post(lambda p=processed, t=total:
                               self._offline_progress(p, t))
                else:
                    self._post(lambda: self.offline_status_var.set(
                        self._t("Offline write in progress...")))
                time.sleep(0.3)
            self._post(lambda: self.offline_status_var.set(
                self._t("Offline polling stopped")))
            self._post(lambda: self._append_log(
                "warn", "Offline polling stopped"))

        self._run(task)

    def _offline_progress(self, processed: int, total: int) -> None:
        if total and processed > total:
            # Some firmware uses 0xFFFFFFFF as a "starting" sentinel.
            self.offline_progress.configure(maximum=max(total, 1), value=0)
            self.offline_status_var.set(self._t("Offline write: preparing..."))
            return
        percent = int(processed * 100 / total) if total else 0
        self.offline_progress.configure(maximum=total, value=processed)
        self.offline_status_var.set(
            "%s: %d%% (%d/%d)" % (self._t("Offline write"),
                                  percent, processed, total))

    def _offline_done(self, text: str, percent: int) -> None:
        self.offline_progress.configure(value=self.offline_progress["maximum"])
        self.offline_status_var.set(self._t(text))

    def _offline_stop_clicked(self) -> None:
        self.offline_stop.set()
        self._append_log("info", "Requested stop of offline status polling")

    def _offline_query(self) -> None:
        def task():
            status = self.client.offline_status()
            if status.failed:
                raise PowerWriterATError(
                    status.error_code,
                    self._t("Offline status query returned an error code (the device may not be writing)"))
            if status.state == OfflineState.OK:
                self._post(lambda: self._offline_done("Offline write completed", 100))
            elif status.progress and status.progress.total:
                processed, total = status.progress.processed, status.progress.total
                self._post(lambda p=processed, t=total: self._offline_progress(p, t))
            else:
                self._post(lambda: self.offline_status_var.set(
                    self._t("Status unknown")))
        self._run(task)

    def _project_switch(self) -> None:
        name = self.switch_name_var.get().strip()
        if not name:
            messagebox.showwarning(
                self._t("Invalid parameter"),
                self._t("Enter the project name"))
            return
        password = self.switch_password_var.get()
        reload_project = bool(self.switch_reload_var.get())
        encoding = self.proj_encoding_var.get()

        def task():
            self.client.project_switch(
                name,
                password=password,
                reload=reload_project,
                name_encoding=encoding,
            )
            self._post(lambda: self._project_switch_succeeded(name))
        self._run(task)

    def _project_switch_succeeded(self, name: str) -> None:
        text = self._t("Project switched successfully: %s", name)
        self.project_status_var.set(text)
        self._append_log("info", text)
        messagebox.showinfo(self._t("Project switched"), text)

    # ==================================================================
    # Broadcast
    # ==================================================================
    def _broadcast_send(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        raw = self.broadcast_text.get("1.0", "end").strip()
        if not raw:
            messagebox.showwarning(
                self._t("Invalid parameter"),
                self._t("Enter broadcast data"))
            return
        try:
            if self.broadcast_hex_var.get():
                data = bytes.fromhex(raw.replace(",", " ").replace("0x", ""))
            else:
                data = raw.encode("utf-8")
        except ValueError as exc:
            messagebox.showerror(
                self._t("Data format error"),
                self._t("Invalid hex format: %s", exc))
            return
        first_direction = self._t(list(BROADCAST_DIR_LABELS.values())[0])
        direction = (BroadcastDir.CDC2UART
                     if self.broadcast_dir_var.get() == first_direction
                     else BroadcastDir.UART2CDC)
        keep = bool(self.broadcast_keep_var.get())
        wait = bool(self.broadcast_wait_var.get())

        def task():
            response = self.client.broadcast(
                data, direction=direction, keep_frame=keep, wait_rsp=wait)
            if response is None:
                self._post(lambda: self._show_broadcast_response(None))
            else:
                self._post(lambda r=response: self._show_broadcast_response(r))

        self._run(task)

    def _show_broadcast_response(self, response) -> None:
        self.broadcast_response.configure(state="normal")
        self.broadcast_response.delete("1.0", "end")
        if response is None:
            self.broadcast_response.insert(
                "1.0", self._t("No response (sent successfully)"))
        else:
            text = self._t(
                "Direction: %d, keep AT frame: %s, data %d bytes",
                response.direction,
                self._t("Yes") if response.keep_frame else self._t("No"),
                len(response.data))
            text += "\n\n" + hexdump(response.data)
            self.broadcast_response.insert("1.0", text)
        self.broadcast_response.configure(state="disabled")

    # ==================================================================
    # Sample workflow
    # ==================================================================
    def _edit_workflow_settings(self) -> None:
        if self.busy:
            messagebox.showinfo(
                self._t("Please wait"),
                self._t("An operation is in progress; cannot change settings right now"))
            return
        dialog = BatchTestSettingsDialog(
            self.root, self._t, self.workflow_settings)
        if dialog.result is not None:
            self.workflow_settings = dialog.result
            self._append_log(
                "info", self._t("Batch test settings saved"))

    def _run_demo(self, destructive: bool) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning(
                self._t("Not connected"),
                self._t("Connect the PowerWriter device first"))
            return
        try:
            self.workflow_settings.validate()
        except ValueError as exc:
            messagebox.showerror(self._t("Invalid parameter"), str(exc))
            return
        if destructive and not messagebox.askyesno(
                self._t("Confirm full workflow"),
                self._t(
                    "The full workflow erases and writes the target Flash, writes OptionByte and loads an offline project.\n"
                    "Target chip data will be lost. Continue?")):
            return

        self.demo_stop.clear()
        self.demo_status_var.set(self._t("Running..."))
        self.demo_progress.configure(value=0, maximum=100)

        def progress(label: str, processed: int, total: int) -> None:
            self._post(lambda l=label, p=processed, t=total: self._set_progress(
                self.demo_progress, self.demo_status_var, l, p, t))

        project_path = self.proj_file_var.get().strip() or str(DEFAULT_PROJECT)
        project_name = self.proj_name_var.get().strip()
        if not project_name:
            project_name = Path(project_path).name or DEFAULT_PROJECT_NAME
        project_password = self.proj_password_var.get()
        project_encoding = self.proj_encoding_var.get()

        def task():
            try:
                run_sample_workflow(
                    self.client,
                    destructive=destructive,
                    project_path=project_path,
                    project_name=project_name,
                    log=self._log_cb,
                    progress=progress,
                    should_stop=self.demo_stop.is_set,
                    settings=self.workflow_settings,
                    project_password=project_password,
                    project_name_encoding=project_encoding,
                )
            except InterruptedError:
                self._post(self._demo_stopped)
                return
            self._post(lambda: self.demo_status_var.set(self._t("Done")))

        self._run(task)

    def _demo_stop_clicked(self) -> None:
        self.demo_stop.set()
        self._append_log("info", "Requested stop of the sample workflow")

    def _demo_stopped(self) -> None:
        self.demo_status_var.set(self._t("Stopped"))
        self._append_log("warn", "Sample workflow stopped")

    # ==================================================================
    # Progress helpers / close
    # ==================================================================
    def _set_progress(self, bar: ttk.Progressbar, label_var: tk.StringVar,
                      name: str, processed: int, total: int) -> None:
        name = self._t(name)
        if total <= 0:
            bar.configure(maximum=1, value=0)
            label_var.set("%s: 0" % name)
            return
        bar.configure(maximum=total, value=processed)
        label_var.set("%s: %d%% (%d/%d)" % (name, int(processed * 100 / total),
                                            processed, total))

    def _on_close(self) -> None:
        if self.busy and not messagebox.askyesno(
                self._t("Operation in progress"),
                self._t("An operation is still running. Exit anyway?")):
            return
        if getattr(self, "_poll_after_id", None):
            try:
                self.root.after_cancel(self._poll_after_id)
            except Exception:
                pass
            self._poll_after_id = None
        try:
            if self.client is not None:
                self.client.close()
        except Exception:
            pass
        self.root.destroy()


def main() -> int:
    smoke_test = "--smoke-test" in sys.argv
    root = tk.Tk()
    if smoke_test:
        root.withdraw()
    try:
        app = PowerWriterGui(root, maximized=not smoke_test)
    except Exception as exc:
        messagebox.showerror(Translator().tr("Startup failed"), str(exc))
        root.destroy()
        return 1
    if smoke_test:
        root.update_idletasks()
        root.update()
        app._on_disconnect()
        root.destroy()
        return 0
    root.mainloop()
    return 0


if __name__ == "__main__":
    sys.exit(main())
