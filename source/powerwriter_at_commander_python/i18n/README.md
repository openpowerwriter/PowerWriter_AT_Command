# GUI language resources

Each JSON file contains one GUI language:

```json
{
  "_meta": {"code": "de", "name": "Deutsch"},
  "strings": {
    "Connection": "Verbindung",
    "Language:": "Sprache:"
  }
}
```

- The lookup key is the English source string used in `powerwriter_at_gui.py`.
- Missing keys fall back to English.
- `%s`, `%d`, `%%` placeholders must match the English source; the GUI falls
  back to English for a template whose placeholders do not match.
- To add a language, copy `en.json`, translate the values, and add the language
  code/native name to `LANGUAGES` in `pw_at/i18n.py`.

The repository ships 48 language files. Chinese is the reference translation
for terminology; other languages were machine-translated from the Simplified
Chinese semantics and checked for key coverage and placeholder integrity, so
native-speaker refinements are welcome. Technical names such as
`PowerWriter AT`, `Flash`, `HEX`, `CRC32` and all `%` placeholders stay
unchanged. Right-to-left and Indic scripts are rendered by the operating
system font; the window layout itself remains left-to-right.
