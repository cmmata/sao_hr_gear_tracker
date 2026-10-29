## 2026-10-24 - [DoS via Memory Exhaustion in Data Import]
**Vulnerability:** The data import feature lacked a file size limit check. Reading an arbitrarily large file directly into memory with `file.readAsString()` and parsing it via `jsonDecode` could lead to memory exhaustion (Denial of Service).
**Learning:** Even internal utility functions like local backups/imports need input validation for file sizes to ensure application stability and security against malformed or excessively large inputs.
**Prevention:** Always check `file.lengthSync()` or use stream-based processing with size constraints before loading entire files into memory, especially when parsing formats like JSON.
## 2026-10-29 - [DoS via Unbounded Text Fields]
**Vulnerability:** TextFields triggering compute logic or number parsing didn't have `maxLength` bounds.
**Learning:** Unbounded text inputs that trigger `onChanged` logic or handle string-to-number parsing can lock up the main thread (DoS risk) and cause memory exhaustion.
**Prevention:** Add `maxLength` enforcement on all text inputs, particularly those filtering lists on every keystroke or parsing large integers.
