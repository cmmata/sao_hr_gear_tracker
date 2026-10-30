## 2026-10-24 - [DoS via Memory Exhaustion in Data Import]
**Vulnerability:** The data import feature lacked a file size limit check. Reading an arbitrarily large file directly into memory with `file.readAsString()` and parsing it via `jsonDecode` could lead to memory exhaustion (Denial of Service).
**Learning:** Even internal utility functions like local backups/imports need input validation for file sizes to ensure application stability and security against malformed or excessively large inputs.
**Prevention:** Always check `file.lengthSync()` or use stream-based processing with size constraints before loading entire files into memory, especially when parsing formats like JSON.

## 2026-10-24 - [Missing input length limits]
**Vulnerability:** Numerical and text inputs lacked `maxLength` constraints in Flutter `TextField` widgets.
**Learning:** By not limiting text field lengths, large strings could lead to slow performance or crashes during saving to the local Isar database.
**Prevention:** Always add `maxLength` and `maxLengthEnforcement: MaxLengthEnforcement.enforced` to any unbounded `TextField`s receiving user data.

## 2026-10-25 - [Memory Leaks via Missing TextEditingController Disposal]
**Vulnerability:** Missing `dispose()` methods for `TextEditingController` instances in stateful widgets (e.g., `GearUpgradePicker` and `WeaponUpgradePicker`).
**Learning:** Frequent instantiations of controllers without disposal in dialogs can lead to memory exhaustion and eventual application crashes (local DoS).
**Prevention:** Always override `dispose()` in `StatefulWidget` state classes to clean up resources like controllers, animations, and streams.

## 2024-10-28 - [DoS via Missing Input Length Limit in Extra Stats]
**Vulnerability:** The Extra Stats input field in `OwnEquipmentScreen` lacked a maximum length constraint (`maxLength`). A malicious or erroneous extremely long input string could cause UI overflow and degradation of performance.
**Learning:** Always apply length limits to arbitrary text inputs, especially in native or mobile applications, to prevent local UI/performance Denial of Service.
**Prevention:** Ensure all `TextField` widgets accepting free text include `maxLength` and `maxLengthEnforcement` properties as appropriate for the domain logic.

## 2026-10-29 - [DoS via Unbounded Text Fields]
**Vulnerability:** TextFields triggering compute logic or number parsing didn't have `maxLength` bounds.
**Learning:** Unbounded text inputs that trigger `onChanged` logic or handle string-to-number parsing can lock up the main thread (DoS risk) and cause memory exhaustion.
**Prevention:** Add `maxLength` enforcement on all text inputs, particularly those filtering lists on every keystroke or parsing large integers.
