# -*- coding: utf-8 -*-
"""GUI localization resources and system-language detection.

Language strings live in JSON files under the project-level ``i18n`` folder.
The English source string is the lookup key, so a missing translation falls
back to English instead of breaking the UI.
"""

from __future__ import annotations

import json
import locale
import os
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .utils import resource_root

# Order is also the order shown in the language selector.
LANGUAGES: List[Tuple[str, str]] = [
    ("en", "English"),
    ("zh-CN", "简体中文"),
    ("zh-TW", "繁體中文"),
    ("ja", "日本語"),
    ("ko", "한국어"),
    ("vi", "Tiếng Việt"),
    ("th", "ไทย"),
    ("id", "Bahasa Indonesia"),
    ("ms", "Bahasa Melayu"),
    ("fil", "Filipino"),
    ("ru", "Русский"),
    ("ar", "العربية"),
    ("de", "Deutsch"),
    ("fr", "Français"),
    ("es", "Español"),
    ("pt", "Português"),
    ("it", "Italiano"),
    ("tr", "Türkçe"),
    # South Asia / Middle East
    ("hi", "हिन्दी"),
    ("bn", "বাংলা"),
    ("ur", "اردو"),
    ("ta", "தமிழ்"),
    ("te", "తెలుగు"),
    ("ml", "മലയാളം"),
    ("kn", "ಕನ್ನಡ"),
    ("mr", "मराठी"),
    ("gu", "ગુજરાતી"),
    ("pa", "ਪੰਜਾਬੀ"),
    ("fa", "فارسی"),
    ("he", "עברית"),
    # Europe / Africa / Caucasus
    ("nl", "Nederlands"),
    ("pl", "Polski"),
    ("uk", "Українська"),
    ("el", "Ελληνικά"),
    ("sv", "Svenska"),
    ("no", "Norsk"),
    ("da", "Dansk"),
    ("fi", "Suomi"),
    ("cs", "Čeština"),
    ("ro", "Română"),
    ("hu", "Magyar"),
    ("bg", "Български"),
    ("sr", "Српски"),
    ("sk", "Slovenčina"),
    ("lt", "Lietuvių"),
    ("sw", "Kiswahili"),
    ("af", "Afrikaans"),
    ("az", "Azərbaycanca"),
]
LANGUAGE_NAMES: Dict[str, str] = dict(LANGUAGES)
DEFAULT_LANGUAGE = "en"

# Windows LCIDs that are useful when the locale API returns an unhelpful value.
_WINDOWS_LCID = {
    0x0401: "ar",
    0x0402: "bg",
    0x0404: "zh-TW",
    0x0405: "cs",
    0x0406: "da",
    0x0407: "de",
    0x0408: "el",
    0x0409: "en",
    0x040A: "es",
    0x040B: "fi",
    0x040C: "fr",
    0x040D: "he",
    0x040E: "hu",
    0x0410: "it",
    0x0411: "ja",
    0x0412: "ko",
    0x0413: "nl",
    0x0414: "no",
    0x0415: "pl",
    0x0416: "pt",
    0x0418: "ro",
    0x0419: "ru",
    0x041B: "sk",
    0x041D: "sv",
    0x041E: "th",
    0x041F: "tr",
    0x0420: "ur",
    0x0421: "id",
    0x0422: "uk",
    0x0427: "lt",
    0x0429: "fa",
    0x042A: "vi",
    0x042C: "az",
    0x0436: "af",
    0x0439: "hi",
    0x043E: "ms",
    0x0441: "sw",
    0x0445: "bn",
    0x0446: "pa",
    0x0447: "gu",
    0x0449: "ta",
    0x044A: "te",
    0x044B: "kn",
    0x044C: "ml",
    0x044E: "mr",
    0x0464: "fil",
    0x0804: "zh-CN",
    0x0809: "en",
    0x0814: "no",
    0x0816: "pt",
    0x081A: "sr",
    0x0820: "ur",
    0x082C: "az",
    0x0845: "bn",
    0x0C04: "zh-TW",
    0x0C0A: "es",
    0x0C1A: "sr",
}

_PLACEHOLDER = re.compile(r"%[-+ #0-9.*]*[diouxXeEfFgGcrsa%]")


def _normalize_language(code: Optional[str]) -> str:
    if not code:
        return DEFAULT_LANGUAGE
    text = code.strip().replace("_", "-")
    lower = text.lower()
    if lower in ("zh", "zh-cn", "zh-hans", "zh-sg", "zh-my"):
        return "zh-CN"
    if lower in ("zh-tw", "zh-hk", "zh-mo", "zh-hant"):
        return "zh-TW"
    base = lower.split("-", 1)[0]
    aliases = {
        "fil": "fil",
        "tl": "fil",
        "iw": "he",
        "in": "id",
        "nb": "no",
        "nn": "no",
        "mo": "ro",
    }
    base = aliases.get(base, base)
    if base in LANGUAGE_NAMES:
        return base
    return DEFAULT_LANGUAGE


def detect_system_language() -> str:
    """Return the best supported language for the current OS user."""
    override = os.environ.get("PWAT_GUI_LANGUAGE")
    if override:
        return _normalize_language(override)

    if sys.platform.startswith("win"):
        try:
            import ctypes

            lcid = int(ctypes.windll.kernel32.GetUserDefaultUILanguage())
            if lcid in _WINDOWS_LCID:
                return _WINDOWS_LCID[lcid]
            lang_id = lcid & 0x3FF
            for value, code in _WINDOWS_LCID.items():
                if (value & 0x3FF) == lang_id:
                    return code
        except Exception:
            pass

    for getter in (locale.getlocale, locale.getdefaultlocale):
        try:
            value = getter()[0]
        except Exception:
            continue
        if value:
            return _normalize_language(value)

    for name in ("LANGUAGE", "LC_ALL", "LC_MESSAGES", "LANG"):
        value = os.environ.get(name)
        if value:
            return _normalize_language(value.split(":", 1)[0])
    return DEFAULT_LANGUAGE


def settings_path() -> Path:
    """Return the per-user GUI settings path."""
    if sys.platform.startswith("win"):
        base = Path(os.environ.get("APPDATA", str(Path.home())))
    elif sys.platform == "darwin":
        base = Path.home() / "Library" / "Application Support"
    else:
        base = Path(os.environ.get("XDG_CONFIG_HOME", str(Path.home() / ".config")))
    return base / "PowerWriterATCommander" / "gui-settings.json"


def load_saved_language() -> Optional[str]:
    try:
        data = json.loads(settings_path().read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return None
    code = data.get("language") if isinstance(data, dict) else None
    if code in LANGUAGE_NAMES:
        return code
    return None


def save_language(code: str) -> None:
    if code not in LANGUAGE_NAMES:
        return
    path = settings_path()
    try:
        path.parent.mkdir(parents=True, exist_ok=True)
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            data = {}
        if not isinstance(data, dict):
            data = {}
        data["language"] = code
        path.write_text(
            json.dumps(data, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
    except OSError:
        # A read-only home/profile directory must not prevent the GUI from
        # starting or changing language for this session.
        pass


def _placeholder_signature(text: str) -> List[str]:
    """Return formatting placeholders in order, treating %% as literal."""
    result = []
    index = 0
    while index < len(text):
        if text[index] != "%":
            index += 1
            continue
        match = _PLACEHOLDER.match(text, index)
        if not match:
            index += 1
            continue
        token = match.group(0)
        if token != "%%":
            result.append(token)
        index = match.end()
    return result


class Translator:
    """Load one GUI language file and translate English source strings."""

    def __init__(self, language: Optional[str] = None) -> None:
        self.language = _normalize_language(
            language or load_saved_language() or detect_system_language()
        )
        self.strings: Dict[str, str] = {}
        self.load()

    def load(self) -> None:
        self.strings = {}
        path = resource_root() / "i18n" / ("%s.json" % self.language)
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            return
        strings = data.get("strings") if isinstance(data, dict) else None
        if isinstance(strings, dict):
            self.strings = {
                str(key): str(value)
                for key, value in strings.items()
                if isinstance(key, str) and isinstance(value, str)
            }

    def set_language(self, language: str) -> None:
        self.language = _normalize_language(language)
        self.load()

    def tr(self, text: str, *args) -> str:
        """Translate a source string and optionally apply %-formatting.

        A translated template whose placeholders do not match the English
        source is rejected in favour of English, which prevents malformed
        translations from crashing the GUI or swapping values.
        """
        template = self.strings.get(text, text)
        if not args:
            return template
        if _placeholder_signature(template) != _placeholder_signature(text):
            template = text
        try:
            return template % args
        except (TypeError, ValueError):
            try:
                return text % args
            except (TypeError, ValueError):
                return text
