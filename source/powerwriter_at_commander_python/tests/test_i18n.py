# -*- coding: utf-8 -*-
"""Tests for GUI language resources and system-language detection."""

import json
import os
import pathlib
import tempfile
import unittest
from unittest import mock

from pw_at.i18n import (
    DEFAULT_LANGUAGE,
    LANGUAGES,
    Translator,
    _placeholder_signature,
    detect_system_language,
    load_saved_language,
    save_language,
)
from pw_at.utils import resource_root


class I18nTests(unittest.TestCase):
    def test_all_language_files_exist(self):
        for code, _name in LANGUAGES:
            path = resource_root() / "i18n" / ("%s.json" % code)
            self.assertTrue(path.is_file(), "missing %s" % path)

    def test_language_files_cover_english_keys(self):
        en_path = resource_root() / "i18n" / "en.json"
        en = json.loads(en_path.read_text(encoding="utf-8"))["strings"]
        self.assertIn("Connection", en)
        for code, _name in LANGUAGES:
            path = resource_root() / "i18n" / ("%s.json" % code)
            data = json.loads(path.read_text(encoding="utf-8"))
            strings = data.get("strings", {})
            missing = set(en) - set(strings)
            self.assertFalse(missing, "%s missing %d keys" % (code, len(missing)))

    def test_language_files_are_translated(self):
        en_path = resource_root() / "i18n" / "en.json"
        en = json.loads(en_path.read_text(encoding="utf-8"))["strings"]
        for code, _name in LANGUAGES:
            if code == "en":
                continue
            path = resource_root() / "i18n" / ("%s.json" % code)
            strings = json.loads(path.read_text(encoding="utf-8"))["strings"]
            translated = sum(1 for key in en if strings.get(key) != en.get(key))
            self.assertGreater(
                translated, 100,
                "%s has only %d translated strings" % (code, translated))

    def test_all_language_placeholders_match_english(self):
        en_path = resource_root() / "i18n" / "en.json"
        en = json.loads(en_path.read_text(encoding="utf-8"))["strings"]
        for code, _name in LANGUAGES:
            path = resource_root() / "i18n" / ("%s.json" % code)
            strings = json.loads(path.read_text(encoding="utf-8"))["strings"]
            for key, source in en.items():
                translated = strings[key]
                self.assertEqual(
                    _placeholder_signature(translated),
                    _placeholder_signature(source),
                    "%s placeholder mismatch for %r: %r"
                    % (code, key, translated))

    def test_language_metadata_matches_selector(self):
        for code, name in LANGUAGES:
            path = resource_root() / "i18n" / ("%s.json" % code)
            meta = json.loads(path.read_text(encoding="utf-8"))["_meta"]
            self.assertEqual(meta["code"], code)
            self.assertEqual(meta["name"], name)

    def test_world_language_set_includes_russian_and_major_scripts(self):
        codes = {code for code, _name in LANGUAGES}
        self.assertGreaterEqual(len(codes), 48)
        for code in (
            "ru", "hi", "bn", "ur", "ta", "te", "ml", "kn", "mr", "gu",
            "pa", "fa", "he", "nl", "pl", "uk", "el", "sv", "no", "da",
            "fi", "cs", "ro", "hu", "bg", "sr", "sk", "lt", "sw", "af",
            "az",
        ):
            self.assertIn(code, codes)

    def test_explicit_english_translation(self):
        translator = Translator("en")
        self.assertEqual(translator.language, "en")
        self.assertEqual(translator.tr("Connection"), "Connection")

    def test_unknown_language_falls_back_to_english(self):
        translator = Translator("not-a-language")
        self.assertEqual(translator.language, DEFAULT_LANGUAGE)

    def test_environment_override(self):
        with mock.patch.dict(os.environ, {"PWAT_GUI_LANGUAGE": "ja"}):
            self.assertEqual(detect_system_language(), "ja")
        with mock.patch.dict(os.environ, {"PWAT_GUI_LANGUAGE": "iw"}):
            self.assertEqual(detect_system_language(), "he")
        with mock.patch.dict(os.environ, {"PWAT_GUI_LANGUAGE": "nb_NO"}):
            self.assertEqual(detect_system_language(), "no")

    def test_placeholder_formatting(self):
        translator = Translator("en")
        text = translator.tr(
            "Found %d serial port(s), %d PowerWriter%s", 2, 1, "")
        self.assertEqual(text, "Found 2 serial port(s), 1 PowerWriter")

    def test_chinese_translation_is_loaded(self):
        translator = Translator("zh-CN")
        self.assertNotEqual(translator.tr("Connection"), "Connection")

    def test_save_and_load_language(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "settings.json"
            with mock.patch("pw_at.i18n.settings_path", return_value=path):
                save_language("ja")
                self.assertEqual(load_saved_language(), "ja")


if __name__ == "__main__":
    unittest.main(verbosity=2)
