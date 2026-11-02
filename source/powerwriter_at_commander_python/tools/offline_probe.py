# -*- coding: utf-8 -*-
"""Run one offline-programming cycle and watch USB for drops/restarts."""

from __future__ import annotations

import json
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "tools") not in sys.path:
    sys.path.insert(0, str(ROOT / "tools"))

from pw_at import PowerWriterAT, PowerWriterATError  # noqa: E402
from at_frame_batch_test import UsbMonitor  # noqa: E402


def main() -> int:
    timeout_s = 180.0
    device = PowerWriterAT()
    device.open_serial("COM22")
    monitor = UsbMonitor(device.port, duration_s=timeout_s, interval_s=0.2)
    monitor.start()
    records = []
    result = {"ok": False, "error": "", "status": [], "usb": []}
    try:
        info = device.project_info()
        print("project: active=%d size=%d crc=0x%08X"
              % (info.active, info.size, info.crc32), flush=True)
        if not info.active:
            print("ERROR: no active project", flush=True)
            return 2

        started = time.monotonic()
        device.offline_start()
        print("offline_start accepted", flush=True)

        deadline = started + timeout_s
        while time.monotonic() < deadline:
            status = device.offline_status()
            item = {
                "elapsed_s": round(time.monotonic() - started, 2),
                "state": status.state.name,
                "error": status.error_code,
            }
            if status.progress:
                item["processed"] = status.progress.processed
                item["total"] = status.progress.total
            records.append(item)
            print("status: %s" % json.dumps(item, ensure_ascii=False), flush=True)
            if status.state.name == "OK":
                result["ok"] = True
                break
            if status.failed:
                result["error"] = "device error %d" % status.error_code
                break
            time.sleep(0.3)
        else:
            result["error"] = "timeout"
    except PowerWriterATError as exc:
        result["error"] = str(exc)
        print("EXCEPTION: %s" % exc, flush=True)
    finally:
        monitor.stop()
        result["status"] = records
        result["usb"] = list(monitor.events)
        print("USB: %s" % (", ".join(result["usb"]) or "USB_STABLE (no events)"),
              flush=True)
        try:
            info = device.project_info()
            print("project-after: active=%d size=%d crc=0x%08X"
                  % (info.active, info.size, info.crc32), flush=True)
        except Exception as exc:
            print("project-after failed: %s" % exc, flush=True)
        try:
            data = device.target_read(0x08000000, 16)
            print("flash-after: %s" % data.hex(" "), flush=True)
        except Exception as exc:
            print("flash-after failed: %s" % exc, flush=True)
        device.close()
        Path(ROOT / "tools" / "offline_probe_result.json").write_text(
            json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
    return 0 if result["ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
