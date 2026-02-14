# Sword Art Online: Hollow Realization - Gear Tracker

## 1. Overview
**Goal:** Quickly identify which friend character has the worst gear for a specific stat to optimize gifting upgrades.

## 2. Data Requirements

### 2.1. Character Model
- **Name**: String.
- **Weapon Type**: Enum (Sword, Rapier, Dagger, Mace, etc.).
- **Gear**: Composition of Equipment slots.

### 2.2. Gear Model
- **Slots**:
  - **Weapon**: Main stat is `Attack`.
  - **Helmet**: Main stat is `Defense`.
  - **Armor**: Main stat is `Defense`.
  - **Boots**: Main stat is `Defense`.
- **Properties**:
  - **Name**: String.
  - **Stat Value**: Integer (Attack or Defense depending on slot).
  - **Extra Stats**: String (Free text for bonuses like STR+10, VIT+5).

## 3. Functional Requirements

### 3.1. Main Screen (Character List)
- **MUST** display a list of all tracked characters.
- **MUST** show a summary for each character:
  - Name & Weapon Type Icon.
  - Current Attack Value (from Weapon).
  - Current Total Defense Value (Sum of Helmet + Armor + Boots).
- **MUST** allow tapping a character to edit their details/gear.

### 3.2. Add/Edit Character
- **MUST** allow creating a new character with Name and Weapon Type.
- **MUST** allow editing an existing character's Name and Weapon Type.
- **MUST** allow editing the gear in each slot (Weapon, Helmet, Armor, Boots).

### 3.3. Upgrade Picker (Core Feature)
- **Goal**: Identify the best candidate for a specific piece of new gear.
- **Input**:
  - **Slot Selector**: Dropdown to choose (Weapon, Helmet, Armor, Boots).
  - **Stat Value Input**: Number field for the new gear's main stat (Attack/Defense).
- **Action**:
  - **MUST** highlight characters whose current gear in the selected slot has a **lower** value than the input.
  - **SHOULD** sort suggestions by the magnitude of the upgrade (New Value - Current Value).
  - **MUST** display the potential stat gain for each candidate.

## 4. Non-Functional Requirements

### 4.1. Storage
- **Local Only**: No cloud sync or login required.
- **Database**: Isar (preferred) or Hive.

### 4.2. Platform
- **Mobile Only**: Android & iOS.
- **Orientation**: Portrait mode primary.

### 4.3. UI/UX & Aesthetics
- **Theme**: "Aincrad" Aesthetic (SAO Style).
  - **Colors**: Orange (`#FFA500`), Yellow (`#FFD700`), White/Transparent panels.
  - **Typography**: Clean, sans-serif, slightly futuristic (e.g., Outfit/Roboto).
  - **Feel**: Light mode, clean lines, floating menus.
- **No Analytics**: Respect user privacy completely.
