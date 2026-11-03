# -*- coding: utf-8 -*-
"""Persist GUI batch-test parameters in the per-user GUI settings file."""

from __future__ import annotations

import json

from .demo import SampleWorkflowSettings
from .i18n import settings_path


def load_workflow_settings() -> SampleWorkflowSettings:
    """Load saved workflow settings, falling back to the C sample defaults."""
    try:
        data = json.loads(settings_path().read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return SampleWorkflowSettings()
    if not isinstance(data, dict):
        return SampleWorkflowSettings()
    return SampleWorkflowSettings.from_dict(data.get("sample_workflow"))


def save_workflow_settings(settings: SampleWorkflowSettings) -> bool:
    """Save workflow settings while preserving the language selection."""
    path = settings_path()
    try:
        path.parent.mkdir(parents=True, exist_ok=True)
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            data = {}
        if not isinstance(data, dict):
            data = {}
        data["sample_workflow"] = settings.to_dict()
        path.write_text(
            json.dumps(data, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        return True
    except OSError:
        # A read-only profile directory must not prevent running the workflow.
        return False
