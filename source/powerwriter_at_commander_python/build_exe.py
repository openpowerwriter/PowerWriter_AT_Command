#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Build standalone executables for the CLI and GUI with PyInstaller.

The resulting one-file executables contain:
- the Python runtime and standard library;
- the pw_at package;
- the C bridge library (powerwriter_at.dll / .so / .dylib);
- the demo project asset.

No Python installation or third-party package is required on the target
machine. PyInstaller itself is only needed on the build machine:

    pip install pyinstaller
    python build_exe.py
"""

from __future__ import annotations

import importlib.util
import os
import platform
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def platform_tag() -> str:
    if sys.platform.startswith("win"):
        return "windows"
    if sys.platform == "darwin":
        return "macos"
    return "linux"


def arch_tag() -> str:
    machine = (platform.machine() or "").lower()
    if machine in ("amd64", "x86_64"):
        return "x64"
    if machine in ("arm64", "aarch64"):
        return "arm64"
    if machine in ("x86", "i386", "i486", "i586", "i686"):
        return "x86"
    return machine or "unknown"


def library_names() -> list[str]:
    if sys.platform.startswith("win"):
        return ["powerwriter_at.dll"]
    if sys.platform == "darwin":
        return ["libpowerwriter_at.dylib"]
    return ["libpowerwriter_at.so"]


def find_library() -> Path:
    plat = platform_tag()
    arch = arch_tag()
    candidates = [
        ROOT / "lib" / plat / arch,
        ROOT / "lib" / plat,
        ROOT / "lib" / arch,
        ROOT / "lib",
        ROOT / "build" / "lib" / "Release",
        ROOT / "build" / "lib" / "Debug",
    ]
    for directory in candidates:
        for name in library_names():
            path = directory / name
            if path.is_file():
                return path
    raise SystemExit(
        "C binding library not found. Build it first:\n"
        "  Windows: build_windows.bat\n"
        "  Linux  : ./build_linux.sh\n"
        "  macOS  : ./build_macos.sh"
    )


def build_one(library: Path, entry: str, name: str, windowed: bool) -> None:
    separator = ";" if os.name == "nt" else ":"
    plat = platform_tag()
    arch = arch_tag()

    command = [
        sys.executable, "-m", "PyInstaller",
        "--noconfirm",
        "--clean",
        "--onefile",
        "--name", name,
        "--distpath", str(ROOT / "dist"),
        "--workpath", str(ROOT / "build" / "pyinstaller"),
        "--specpath", str(ROOT / "build" / "pyinstaller"),
        "--add-binary", "%s%slib/%s/%s" % (library, separator, plat, arch),
        "--add-data", "%s%sassets" % (
            ROOT / "assets" / "powerwriter_at_demo_project.pkg", separator),
        "--add-data", "%s%si18n" % (ROOT / "i18n", separator),
        "--console" if not windowed else "--windowed",
        str(ROOT / entry),
    ]
    print("=" * 72)
    print("Building %s ..." % name)
    print(" ".join(command))
    import subprocess
    subprocess.check_call(command, cwd=str(ROOT))


def main() -> int:
    if importlib.util.find_spec("PyInstaller") is None:
        raise SystemExit(
            "PyInstaller is not installed. Run this on the build machine: pip install pyinstaller"
        )

    library = find_library()
    print("Using C library: %s" % library)

    build_one(library, "powerwriter_at_cli.py", "powerwriter_at_cli_python", windowed=False)

    build_gui = importlib.util.find_spec("tkinter") is not None
    if build_gui:
        build_one(library, "powerwriter_at_gui.py", "powerwriter_at_gui_python", windowed=True)
    else:
        print("WARNING: tkinter is not available in this Python; skipping GUI build.")

    suffix = ".exe" if os.name == "nt" else ""
    gui_name = "powerwriter_at_gui_python.app" if sys.platform == "darwin" else "powerwriter_at_gui_python"
    print("=" * 72)
    print("Output:")
    print("  %s" % (ROOT / "dist" / ("powerwriter_at_cli_python" + suffix)))
    if build_gui:
        print("  %s" % (ROOT / "dist" / (gui_name + ("" if sys.platform == "darwin" else suffix))))
    return 0


if __name__ == "__main__":
    sys.exit(main())
