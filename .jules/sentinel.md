## 2026-10-24 - [DoS via Memory Exhaustion in Data Import]
**Vulnerability:** The data import feature lacked a file size limit check. Reading an arbitrarily large file directly into memory with `file.readAsString()` and parsing it via `jsonDecode` could lead to memory exhaustion (Denial of Service).
**Learning:** Even internal utility functions like local backups/imports need input validation for file sizes to ensure application stability and security against malformed or excessively large inputs.
**Prevention:** Always check `file.lengthSync()` or use stream-based processing with size constraints before loading entire files into memory, especially when parsing formats like JSON.

## 2024-10-28 - [DoS via Missing Input Length Limit in Extra Stats]
**Vulnerability:** The Extra Stats input field in `OwnEquipmentScreen` lacked a maximum length constraint (`maxLength`). A malicious or erroneous extremely long input string could cause UI overflow and degradation of performance.
**Learning:** Always apply length limits to arbitrary text inputs, especially in native or mobile applications, to prevent local UI/performance Denial of Service.
**Prevention:** Ensure all `TextField` widgets accepting free text include `maxLength` and `maxLengthEnforcement` properties as appropriate for the domain logic.
