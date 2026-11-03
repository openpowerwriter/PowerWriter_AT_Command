# -*- coding: utf-8 -*-
"""Tests for batch-test workflow settings and persistence."""

import json
import pathlib
import tempfile
import unittest
from unittest import mock

from pw_at.demo import ReadRangeSettings, SampleWorkflowSettings
from pw_at.workflow_settings import (
    load_workflow_settings,
    save_workflow_settings,
)


class WorkflowSettingsTests(unittest.TestCase):
    def test_defaults_match_sample_workflow(self):
        cfg = SampleWorkflowSettings()
        self.assertEqual(cfg.connect_timeout_s, 10.0)
        self.assertEqual(cfg.read_ranges[0].address, 0x20001000)
        self.assertEqual(cfg.read_ranges[0].size, 2)
        self.assertEqual(cfg.sector_erase_address, 0x080015FF)
        self.assertEqual(cfg.write_address, 0x08000000)
        self.assertEqual(cfg.write_size, 0x20000)
        cfg.validate()

    def test_round_trip(self):
        cfg = SampleWorkflowSettings()
        cfg.connect_timeout_s = 3.5
        cfg.read_ranges[1] = ReadRangeSettings(
            enabled=False, label="custom", address=0x1000, size=64)
        cfg.reset_enabled = False
        cfg.broadcast_wait_rsp = True
        restored = SampleWorkflowSettings.from_dict(cfg.to_dict())
        self.assertEqual(restored.connect_timeout_s, 3.5)
        self.assertFalse(restored.read_ranges[1].enabled)
        self.assertEqual(restored.read_ranges[1].address, 0x1000)
        self.assertFalse(restored.reset_enabled)
        self.assertTrue(restored.broadcast_wait_rsp)

    def test_validation_rejects_bad_ranges(self):
        cfg = SampleWorkflowSettings()
        cfg.read_ranges[0].enabled = True
        cfg.read_ranges[0].size = 0
        with self.assertRaises(ValueError):
            cfg.validate()
        cfg = SampleWorkflowSettings()
        cfg.write_enabled = True
        cfg.write_size = 0
        with self.assertRaises(ValueError):
            cfg.validate()

    def test_save_and_load_preserve_language(self):
        cfg = SampleWorkflowSettings()
        cfg.write_address = 0x08010000
        cfg.write_size = 0x1000
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "gui-settings.json"
            path.write_text(
                json.dumps({"language": "ja"}), encoding="utf-8")
            with mock.patch(
                    "pw_at.workflow_settings.settings_path",
                    return_value=path):
                self.assertTrue(save_workflow_settings(cfg))
                restored = load_workflow_settings()
                self.assertEqual(restored.write_address, 0x08010000)
                self.assertEqual(restored.write_size, 0x1000)
                data = json.loads(path.read_text(encoding="utf-8"))
                self.assertEqual(data["language"], "ja")
                self.assertIn("sample_workflow", data)


if __name__ == "__main__":
    unittest.main(verbosity=2)
