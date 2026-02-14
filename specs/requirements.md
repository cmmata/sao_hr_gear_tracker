# Sword Art Online: Hollow Realization - Gear Tracker

## Goal
Quickly identify which friend has the worst gear for a specific stat to gift them upgrades.

## Requirements

### Data Model
- **Character**:
  - Name (String)
  - Weapon Type (String/Enum)
  - Gear (Composition)
- **Gear**:
  - **Weapon**: Has Attack value.
  - **Armor**, **Boots**, **Helmet**: Have Defense value.
  - distinct name.
  - distinct extra stats text.

### Local Storage
- Isar or Hive.
- No cloud/login.

### UI/Features
- **Main Screen**:
  - List of characters.
  - Show Attack value.
  - Show current Total Defense.
- **Upgrade Picker**:
  - Input field: 'New Gear Defense Value'.
  - Action: Highlight character with lowest defense in the relevant category (Armor/Boots/Helmet implied by context or selectable? The prompt says "worst gear for a specific stat" and "lowest defense in the current gear in that category". I should probably allow selecting the slot (First, armor/boots/helmet) and then the value, or just generic "Defense" for a slot).
  - Let's read carefully: "New Gear Defense Value ... highlight the character who would benefit most (the one with the lowest defense in the current gear in that category)". This implies I need to know *which* category the new gear is for (e.g. "I found a Helmet with 50 Def"). So the picker needs a Slot selector + Value input.

### Style
- Light mode.
- 'Aincrad' aesthetic (SAO style). Clean, perhaps tech-fantasy menus.

## Constraints
- Local only.
- No analytics.
- Mobile target (Android & iOS).
