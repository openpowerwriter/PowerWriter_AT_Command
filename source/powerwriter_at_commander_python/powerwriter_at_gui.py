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
import sys
import threading
import time
import traceback
from pathlib import Path
import tkinter as tk
from tkinter import filedialog, messagebox, simpledialog, ttk
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
    GUIDE_TEXT,
    INTRODUCTION,
    run_sample_workflow,
    wait_target_connected,
)
from pw_at.models import WriterConfig
from pw_at.transport import list_serial_ports
from pw_at.utils import hexdump

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


class PowerWriterGui:
    def __init__(self, root: tk.Tk) -> None:
        self.root = root
        self.client: PowerWriterAT | None = None
        self.busy = False
        self.queue: "queue.Queue" = queue.Queue()
        self.offline_stop = threading.Event()
        self.demo_stop = threading.Event()
        self._last_read: tuple[int, bytes] | None = None
        self._port_map: dict[str, str] = {}

        root.title("PowerWriter AT Commander (Python) v%s" % __version__)
        root.geometry("1140x860")
        root.minsize(1020, 720)
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
        self._refresh_ports()
        self._update_conn_buttons()
        self._poll_after_id = self.root.after(80, self._poll_queue)
        self.root.protocol("WM_DELETE_WINDOW", self._on_close)

    # ==================================================================
    # Variables and UI construction
    # ==================================================================
    def _build_vars(self) -> None:
        self.port_var = tk.StringVar()
        self.baud_var = tk.StringVar(value="9600")
        self.encrypt_var = tk.BooleanVar(value=False)
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
        self.cfg_reset_pin = tk.StringVar()

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
        main = ttk.Frame(self.root, padding=8)
        main.pack(fill="both", expand=True)

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

        self.encrypt_chk = ttk.Checkbutton(conn, text="AES128-CBC encryption",
                                           variable=self.encrypt_var)
        self.encrypt_chk.grid(row=0, column=5, padx=(0, 12))

        self.connect_btn = ttk.Button(conn, text="Connect", width=8, command=self._on_connect)
        self.connect_btn.grid(row=0, column=6, padx=(0, 6))
        self.disconnect_btn = ttk.Button(conn, text="Disconnect", width=8,
                                         command=self._on_disconnect)
        self.disconnect_btn.grid(row=0, column=7)

        self.pw_only_chk = ttk.Checkbutton(
            conn, text="PowerWriter only", variable=self.pw_only_var,
            command=self._refresh_ports)
        self.pw_only_chk.grid(row=0, column=8, padx=(12, 0))

        self.conn_status_label = ttk.Label(conn, textvariable=self.conn_status_var,
                                           style="Bad.TLabel")
        self.conn_status_label.grid(row=1, column=0, columnspan=9, sticky="w", pady=(8, 0))
        ttk.Label(conn, text="Note: enable AT mode in the PowerWriter device preferences first;"
                             " AES encryption must match the device settings.",
                  style="Hint.TLabel").grid(row=2, column=0, columnspan=9,
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
        self._config_combo(base, 0, "Erase mode", self.cfg_erase,
                           list(ERASE_TYPE_LABELS.values()))
        self._config_combo(base, 1, "Output VEXT", self.cfg_vext,
                           list(VEXT_LABELS.values()))
        self._config_combo(base, 2, "Target clock", self.cfg_clock,
                           list(CLOCK_LABELS.values()))
        self._config_combo(base, 3, "OptionByte update", self.cfg_ob,
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
        self._config_row(output, 4, "Reset pin control (0-2)", self.cfg_reset_pin)

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

    def _config_combo(self, parent, row, label, var, values) -> None:
        ttk.Label(parent, text=label + ":").grid(row=row, column=0, sticky="w", pady=4)
        ttk.Combobox(parent, textvariable=var, values=values, width=30,
                     state="readonly").grid(row=row, column=1, sticky="w", padx=(12, 0))

    def _build_target_tab(self) -> None:
        tab = ttk.Frame(self.notebook, padding=8)
        self.notebook.add(tab, text="Target Chip")
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
        ttk.Combobox(reset, textvariable=self.reset_type_var,
                     values=list(RESET_TYPE_LABELS.values()), state="readonly",
                     width=30).pack(side="left", padx=(0, 8))
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
        ttk.Entry(write, textvariable=self.write_addr_var, width=16)\
            .grid(row=0, column=1, sticky="w", padx=(4, 0))
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
        self.notebook.add(tab, text="Offline Project")
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
        ttk.Label(offline, text="After starting an offline write, use 'Query status' to check progress.",
                  style="Hint.TLabel").grid(row=0, column=0, columnspan=3, sticky="w")
        ttk.Button(offline, text="Start offline write", command=self._offline_start)\
            .grid(row=1, column=0, sticky="w", pady=(8, 0))
        ttk.Button(offline, text="Query status", command=self._offline_query)\
            .grid(row=1, column=1, sticky="w", padx=(8, 0), pady=(8, 0))
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
        ttk.Combobox(controls, textvariable=self.broadcast_dir_var,
                     values=list(BROADCAST_DIR_LABELS.values()), state="readonly",
                     width=20).pack(side="left", padx=(4, 12))
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
        ttk.Button(run, text="Stop", command=self._demo_stop_clicked)\
            .pack(side="left", padx=(8, 0))
        ttk.Label(run, textvariable=self.demo_status_var)\
            .pack(side="left", padx=(16, 0))

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
        line = "[%s] %s %s\n" % (time.strftime("%H:%M:%S"),
                                 LOG_PREFIX.get(level, ""), message)
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
            title="Save log", defaultextension=".log",
            filetypes=[("Log files", "*.log"), ("Text files", "*.txt"), ("All files", "*.*")],
        )
        if not path:
            return
        Path(path).write_text(self.log_text.get("1.0", "end"), encoding="utf-8")
        self._append_log("info", "Log saved to %s" % path)

    def _set_busy(self, busy: bool, text: str = "") -> None:
        self.busy = busy
        self.status_var.set(text or ("Working..." if busy else "Ready"))
        self._update_conn_buttons()

    def _run(self, task) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if self.busy:
            messagebox.showinfo("Please wait", "The previous operation has not finished")
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
        messagebox.showerror("Operation failed", str(exc))

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

    def _set_conn_status(self, text: str, ok: bool = False, busy: bool = False) -> None:
        self.conn_status_var.set(text)
        self.conn_status_label.configure(
            style="Ok.TLabel" if ok else ("Hint.TLabel" if busy else "Bad.TLabel"))

    # ==================================================================
    # Connect / disconnect
    # ==================================================================
    def _refresh_ports(self) -> None:
        all_ports = list_serial_ports()
        powerwriter_ports = [p for p in all_ports if p.is_powerwriter]
        only_powerwriter = bool(self.pw_only_var.get())

        if not all_ports:
            self._port_map = {}
            self.port_combo["values"] = ["No serial port found"]
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

        self._append_log(
            "info",
            "Found %d serial port(s), %d PowerWriter%s"
            % (len(all_ports), len(powerwriter_ports),
               " (filtered display)" if only_powerwriter and powerwriter_ports else ""))

    def _on_connect(self) -> None:
        if self.busy:
            return
        text = self.port_var.get().strip()
        if not text:
            messagebox.showwarning("No serial port selected", "Select a serial port")
            return
        port = self._port_map.get(text, text)
        try:
            baud = int(self.baud_var.get())
        except ValueError:
            messagebox.showerror("Invalid parameter", "Baud rate must be an integer")
            return

        encrypt = bool(self.encrypt_var.get())
        self._set_busy(True, "Connecting...")
        self._set_conn_status("Connecting to %s ..." % port, busy=True)
        client = PowerWriterAT(encrypt=encrypt, log=self._log_cb)
        self._append_log("info", "Connecting to %s @ %d ..." % (port, baud))

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
            self._append_log("warn", "Failed to read config (connection unaffected): %s" % config_error)
        self._set_conn_status("Connected: %s (%s)" % (client.port, info.oem or "PowerWriter"),
                              ok=True)
        self._set_busy(False, "Ready")
        self._append_log("info", "Connected successfully: %s" % info)

    def _connect_failed(self, exc) -> None:
        self.client = None
        self._set_busy(False, "Ready")
        self._set_conn_status("Not connected")
        self._append_log("error", "Connection failed: %s" % exc)
        messagebox.showerror("Connection failed", str(exc))

    def _on_disconnect(self) -> None:
        if self.busy:
            messagebox.showinfo("Please wait", "An operation is in progress; cannot disconnect right now")
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
                    "warn", "Failed to read config: %s" % e))
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
            self.info_vars["encrypt"].set("Enabled" if self.client.encrypt else "Disabled")

    def _show_about(self) -> None:
        extra = ""
        if self.client is not None:
            extra = ("\n\nBound library: %s\nABI version: 0x%08X\nAT encryption: %s"
                     % (self.client.library_path or "-",
                        self.client.library_version,
                        "Enabled" if self.client.encrypt else "Disabled"))
        messagebox.showinfo("About PowerWriter AT Commander",
                            INTRODUCTION + extra)

    def _apply_config(self, cfg: WriterConfig) -> None:
        def label(mapping, enum_cls, value):
            try:
                return mapping[enum_cls(value)]
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
        self.cfg_limit_enable.set("On" if cfg.limit_number_enable else "Off")
        self.cfg_limit_number.set(str(cfg.limit_number))
        self.cfg_auto.set(1 if cfg.target_auto_enable else 0)
        self.cfg_in_debounce.set(str(cfg.target_auto_in_debounce))
        self.cfg_out_debounce.set(str(cfg.target_auto_out_debounce))
        self.cfg_disable_power.set(1 if cfg.disable_power_ap else 0)
        self.cfg_run_ap.set(1 if cfg.run_ap else 0)
        self.cfg_power_on.set(str(cfg.power_on_debounce))
        self.cfg_power_off.set(str(cfg.power_off_debounce))
        self.cfg_reset_pin.set(str(cfg.reset_type))

    def _read_config(self) -> None:
        def task():
            cfg = self.client.get_writer_config()
            self._post(lambda: self._apply_config(cfg))
        self._run(task)

    def _collect_int(self, var: tk.StringVar, name: str, maximum: int = 0xFFFF) -> int:
        try:
            value = int(var.get(), 0)
        except ValueError:
            raise ValueError("%s must be an integer" % name)
        if value < 0 or value > maximum:
            raise ValueError("%s must be between 0 and %d" % (name, maximum))
        return value

    def _collect_config(self) -> WriterConfig:
        try:
            erase = ERASE_BY_LABEL[self.cfg_erase.get()]
            vext = VEXT_BY_LABEL[self.cfg_vext.get()]
            clock = CLOCK_BY_LABEL[self.cfg_clock.get()]
            ob = OB_BY_LABEL[self.cfg_ob.get()]
        except KeyError as exc:
            raise ValueError("Invalid configuration item: %s" % exc)
        return WriterConfig(
            target_vendor=self.cfg_vendor.get(),
            target_series=self.cfg_series.get(),
            target_model=self.cfg_model.get(),
            erase_type=erase,
            output_vext_type=vext,
            clock_type=clock,
            buzzer_enable=1 if self.cfg_buzzer.get() else 0,
            ob_update_type=ob,
            limit_number_enable=1 if self.cfg_limit_enable.get() == "On" else 0,
            limit_number=int(self.cfg_limit_number.get() or 0),
            target_auto_enable=1 if self.cfg_auto.get() else 0,
            target_auto_in_debounce=self._collect_int(self.cfg_in_debounce, "insertion debounce"),
            target_auto_out_debounce=self._collect_int(self.cfg_out_debounce, "removal debounce"),
            disable_power_ap=1 if self.cfg_disable_power.get() else 0,
            run_ap=1 if self.cfg_run_ap.get() else 0,
            power_on_debounce=self._collect_int(self.cfg_power_on, "power-on debounce"),
            power_off_debounce=self._collect_int(self.cfg_power_off, "power-off debounce"),
            reset_type=self._collect_int(self.cfg_reset_pin, "reset pin control", 2),
        )

    def _write_config(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        try:
            cfg = self._collect_config()
        except ValueError as exc:
            messagebox.showerror("Invalid parameter", str(exc))
            return

        def task():
            self.client.set_writer_config(cfg)
            new_cfg = self.client.get_writer_config()
            self._post(lambda: self._apply_config(new_cfg))
            self._post(lambda: self._append_log("info", "Configuration updated"))
        self._run(task)

    def _set_baud(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        try:
            baud = int(self.new_baud_var.get())
        except ValueError:
            messagebox.showerror("Invalid parameter", "AT baud rate must be an integer")
            return

        def task():
            self.client.set_baudrate(baud)
            self._post(lambda: self.baud_var.set(str(baud)))
            self._post(lambda: self._append_log(
                "info", "AT baud rate switched to %d; host serial port synchronized" % baud))
        self._run(task)

    # ==================================================================
    # Target chip
    # ==================================================================
    def _set_target_status(self, connected: bool, error: str = "") -> None:
        if connected:
            self.target_status_var.set("Connected")
            self.target_status_label.configure(style="Ok.TLabel")
        else:
            self.target_status_var.set("Not connected" + (" (%s)" % error if error else ""))
            self.target_status_label.configure(style="Bad.TLabel")

    def _target_connect(self) -> None:
        def task():
            self.client.target_connect()
            self._post(lambda: self.target_status_var.set("Connect command sent"))
        self._run(task)

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
        reset_type = RESET_BY_LABEL.get(self.reset_type_var.get(), ResetType.HW_CORE_RESET)

        def task():
            self.client.target_reset(reset_type)
            self._post(lambda: self._set_target_status(False, "Reconnect required after reset"))
        self._run(task)

    def _parse_target_int(self, var: tk.StringVar, name: str) -> int:
        try:
            return int(var.get(), 0)
        except ValueError:
            raise ValueError("%s must be an integer (0x prefix supported)" % name)

    def _read_memory(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        try:
            address = self._parse_target_int(self.read_addr_var, "address")
            size = self._parse_target_int(self.read_size_var, "length")
        except ValueError as exc:
            messagebox.showerror("Invalid parameter", str(exc))
            return
        if size <= 0:
            messagebox.showerror("Invalid parameter", "Length must be greater than 0")
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
            text += "\n... showing first %d bytes only (of %d bytes); save to a file for the full content" % (
                limit, len(data))
        self.read_text.configure(state="normal")
        self.read_text.delete("1.0", "end")
        self.read_text.insert("1.0", text)
        self.read_text.configure(state="disabled")
        self.read_info_var.set("%d bytes @ 0x%08X" % (len(data), address))

    def _save_memory(self) -> None:
        if not self._last_read:
            messagebox.showinfo("No data", "Read the target memory first")
            return
        address, data = self._last_read
        path = filedialog.asksaveasfilename(
            title="Save target memory", defaultextension=".bin",
            initialfile="memory_%08X.bin" % address,
            filetypes=[("Binary files", "*.bin"), ("All files", "*.*")],
        )
        if path:
            Path(path).write_bytes(data)
            self._append_log("info", "Saved %d bytes to %s" % (len(data), path))

    def _browse_write_file(self) -> None:
        path = filedialog.askopenfilename(
            title="Select a file to write",
            filetypes=[("Binary files", "*.bin *.hex *.img"), ("All files", "*.*")],
        )
        if path:
            self.write_file_var.set(path)

    def _write_memory(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        try:
            address = self._parse_target_int(self.write_addr_var, "address")
        except ValueError as exc:
            messagebox.showerror("Invalid parameter", str(exc))
            return
        path = Path(self.write_file_var.get())
        if not path.is_file():
            messagebox.showerror("File error", "Select a valid file")
            return
        data = path.read_bytes()
        if not data:
            messagebox.showerror("File error", "File is empty")
            return
        if not messagebox.askyesno(
                "Confirm write",
                "About to write to 0x%08X, %d bytes; target chip data will be modified.\nContinue?"
                % (address, len(data))):
            return

        verify = bool(self.write_verify_var.get())

        def progress(processed, total):
            self._post(lambda p=processed, t=total: self._set_progress(
                self.write_progress, self.write_status_var, "Write", p, t))

        prepare = bool(self.write_prepare_var.get())

        def task():
            self.client.target_write(address, data, prepare=prepare, progress=progress)
            self._post(lambda: self._set_progress(
                self.write_progress, self.write_status_var, "Write", len(data), len(data)))
            if verify:
                self._post(lambda: self.write_status_var.set("Verifying..."))
                readback = self.client.target_read(address, len(data))
                if readback != data:
                    offset = next((i for i, (a, b) in enumerate(zip(readback, data))
                                   if a != b), 0)
                    raise PowerWriterATError(
                        ATError.TARGET_WRITE,
                        "Verification failed: data mismatch at offset 0x%X" % offset)
                self._post(lambda: self.write_status_var.set(
                    "Write and verify passed (%d bytes)" % len(data)))
            else:
                self._post(lambda: self.write_status_var.set(
                    "Write completed (%d bytes)" % len(data)))

        self._set_progress(self.write_progress, self.write_status_var, "Write", 0, len(data))
        self._run(task)

    def _write_prepare_only(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        initial = 1
        path = Path(self.write_file_var.get())
        if path.is_file():
            initial = max(1, path.stat().st_size)
        total = simpledialog.askinteger(
            "Send write prepare", "Total number of bytes to write:", minvalue=1,
            initialvalue=initial, parent=self.root)
        if total is None:
            return
        self.write_status_var.set("Sending write prepare...")
        self._run(lambda: self.client.target_write_prepare(total))

    def _erase_chip(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if not messagebox.askyesno("Confirm erase", "This performs a full chip erase; target chip data will be lost.\nContinue?"):
            return
        self._run(lambda: self.client.target_erase(10000))

    def _erase_sector(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        try:
            address = self._parse_target_int(self.erase_addr_var, "sector address")
            size = self._parse_target_int(self.erase_size_var, "sector length")
        except ValueError as exc:
            messagebox.showerror("Invalid parameter", str(exc))
            return
        if not messagebox.askyesno(
                "Confirm erase", "About to erase the sector at 0x%08X, 0x%X bytes.\nContinue?" % (address, size)):
            return
        self._run(lambda: self.client.target_erase_sector(address, size, 10000))

    def _read_ob(self) -> None:
        def task():
            ob = self.client.target_read_ob()
            text = "%d bytes: %s" % (len(ob.data),
                                    " ".join("%02X" % b for b in ob.data))
            self._post(lambda t=text: self.ob_label.configure(text=t))
        self._run(task)

    def _write_vendor_ob(self) -> None:
        if not messagebox.askyesno("Confirm", "About to write the vendor default OptionByte. Continue?"):
            return
        self._run(lambda: self.client.target_write_vendor_ob())

    def _write_user_ob(self) -> None:
        if not messagebox.askyesno("Confirm", "About to write the user OptionByte. Continue?"):
            return
        self._run(lambda: self.client.target_write_user_ob())

    def _factory_sram(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if not messagebox.askyesno("Confirm", "About to run the factory SRAM firmware. Continue?"):
            return
        self._run(lambda: self.client.factory_run_sram_fw())

    def _factory_flash(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if not messagebox.askyesno("Confirm", "About to run the factory Flash firmware. Continue?"):
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
        self.proj_active_var.set("Valid" if info.active else "Invalid")
        self.proj_size_var.set("%d bytes" % info.size)
        self.proj_crc_var.set("0x%08X" % info.crc32)

    def _browse_project(self) -> None:
        path = filedialog.askopenfilename(
            title="Select offline project",
            filetypes=[("PowerWriter project", "*.pkg"), ("All files", "*.*")],
        )
        if path:
            self.proj_file_var.set(path)
            if not self.proj_name_var.get():
                self.proj_name_var.set(Path(path).name)

    def _project_load(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        path = Path(self.proj_file_var.get())
        if not path.is_file():
            messagebox.showerror("File error", "Select a valid project file")
            return
        name = self.proj_name_var.get().strip() or path.name
        data = path.read_bytes()
        if not messagebox.askyesno(
                "Confirm load", "About to load project %s (%d bytes) to the writer. Continue?" % (name, len(data))):
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
        if not messagebox.askyesno("Confirm", "About to disable the offline project on the writer. Continue?"):
            return
        def task():
            self.client.project_disable()
            info = self.client.project_info()
            self._post(lambda: self._apply_project_info(info))
        self._run(task)

    def _offline_start(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if not messagebox.askyesno(
                "Confirm", "About to start an offline write (this erases/writes the target chip). Continue?"):
            return
        self.offline_status_var.set("Starting...")

        def task():
            self.client.offline_start()
            self._post(lambda: self.offline_status_var.set("Offline write started"))

        self._run(task)

    def _offline_progress(self, processed: int, total: int) -> None:
        if total and processed > total:
            # Some firmware uses 0xFFFFFFFF as a "starting" sentinel.
            self.offline_progress.configure(maximum=max(total, 1), value=0)
            self.offline_status_var.set("Offline write: preparing...")
            return
        percent = int(processed * 100 / total) if total else 0
        self.offline_progress.configure(maximum=total, value=processed)
        self.offline_status_var.set("Offline write: %d%% (%d/%d)"
                                    % (percent, processed, total))

    def _offline_done(self, text: str, percent: int) -> None:
        self.offline_progress.configure(value=self.offline_progress["maximum"])
        self.offline_status_var.set(text)

    def _offline_stop_clicked(self) -> None:
        self.offline_stop.set()
        self._append_log("info", "Requested stop of offline status polling")

    def _offline_query(self) -> None:
        def task():
            status = self.client.offline_status()
            if status.failed:
                raise PowerWriterATError(
                    status.error_code, "Offline status query returned an error code (the device may not be writing)")
            if status.state == OfflineState.OK:
                self._post(lambda: self._offline_done("Offline write completed", 100))
            elif status.progress and status.progress.total:
                processed, total = status.progress.processed, status.progress.total
                self._post(lambda p=processed, t=total: self._offline_progress(p, t))
            else:
                self._post(lambda: self.offline_status_var.set("Status unknown"))
        self._run(task)

    def _project_switch(self) -> None:
        name = self.switch_name_var.get().strip()
        if not name:
            messagebox.showwarning("Invalid parameter", "Enter the project name")
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
        self._run(task)

    # ==================================================================
    # Broadcast
    # ==================================================================
    def _broadcast_send(self) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        raw = self.broadcast_text.get("1.0", "end").strip()
        if not raw:
            messagebox.showwarning("Invalid parameter", "Enter broadcast data")
            return
        try:
            if self.broadcast_hex_var.get():
                data = bytes.fromhex(raw.replace(",", " ").replace("0x", ""))
            else:
                data = raw.encode("utf-8")
        except ValueError as exc:
            messagebox.showerror("Data format error", "Invalid hex format: %s" % exc)
            return
        direction = (BroadcastDir.CDC2UART
                     if self.broadcast_dir_var.get() == list(BROADCAST_DIR_LABELS.values())[0]
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
            self.broadcast_response.insert("1.0", "No response (sent successfully)")
        else:
            text = "Direction: %d, keep AT frame: %s, data %d bytes\n\n" % (
                response.direction, response.keep_frame, len(response.data))
            text += hexdump(response.data)
            self.broadcast_response.insert("1.0", text)
        self.broadcast_response.configure(state="disabled")

    # ==================================================================
    # Sample workflow
    # ==================================================================
    def _run_demo(self, destructive: bool) -> None:
        if self.client is None or not self.client.is_open:
            messagebox.showwarning("Not connected", "Connect the PowerWriter device first")
            return
        if destructive and not messagebox.askyesno(
                "Confirm full workflow",
                "The full workflow erases and writes the target Flash, writes OptionByte and loads an offline project.\n"
                "Target chip data will be lost. Continue?"):
            return

        self.demo_stop.clear()
        self.demo_status_var.set("Running...")
        self.demo_progress.configure(value=0, maximum=100)

        def progress(label: str, processed: int, total: int) -> None:
            self._post(lambda l=label, p=processed, t=total: self._set_progress(
                self.demo_progress, self.demo_status_var, l, p, t))

        def task():
            try:
                run_sample_workflow(
                    self.client,
                    destructive=destructive,
                    project_path=DEFAULT_PROJECT,
                    project_name=DEFAULT_PROJECT_NAME,
                    log=self._log_cb,
                    progress=progress,
                    should_stop=self.demo_stop.is_set,
                )
            except InterruptedError:
                self._post(self._demo_stopped)
                return
            self._post(lambda: self.demo_status_var.set("Done"))

        self._run(task)

    def _demo_stop_clicked(self) -> None:
        self.demo_stop.set()
        self._append_log("info", "Requested stop of the sample workflow")

    def _demo_stopped(self) -> None:
        self.demo_status_var.set("Stopped")
        self._append_log("warn", "Sample workflow stopped")

    # ==================================================================
    # Progress helpers / close
    # ==================================================================
    def _set_progress(self, bar: ttk.Progressbar, label_var: tk.StringVar,
                      name: str, processed: int, total: int) -> None:
        if total <= 0:
            bar.configure(maximum=1, value=0)
            label_var.set("%s: 0" % name)
            return
        bar.configure(maximum=total, value=processed)
        label_var.set("%s: %d%% (%d/%d)" % (name, int(processed * 100 / total),
                                            processed, total))

    def _on_close(self) -> None:
        if self.busy and not messagebox.askyesno(
                "Operation in progress", "An operation is still running. Exit anyway?"):
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
        app = PowerWriterGui(root)
    except Exception as exc:
        messagebox.showerror("Startup failed", str(exc))
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
