# Sword Art Online: Hollow Realization - Gear Tracker

## 1. Overview
**Goal:** Quickly identify which friend character has the worst gear for a specific stat to optimize gifting upgrades.

## 2. Data Requirements

### 2.1. Character Model
- **Name**: String.
- **Weapon Type**: Enum (Sword, Rapier, Dagger, Mace, Axe, Scimitar, Katana, Two-Hand Sword, Spear).
- **Weapon**: Weapon Model.
- **Gear**: Composition of Equipment slots.
- **Affection level**: Integer (Affection with the main character).
- **Number of bedtimes**: Integer (Number of times the character has been talking with the character on bedroom).

### 2.2. Weapon Model
- **Definition**: The main stat is `Attack`
- **Stat Value**: Integer (Attack).
- **Hands**: Integer (1 or 2).
- **Extra Stats**: String (Free text for bonuses like STR+10, VIT+5).

### 2.3. Gear Model
- **Slots**:
  - **Shield**
  - **Helmet**
  - **Armor**
  - **Boots**
  - **Earrings**
- **Properties**:
  - **Stat Value**: Integer (Defense)
  - **Extra Stats**: String (Free text for bonuses like STR+10, VIT+5).

## 3. Functional Requirements

## 3.0 Tabs
- **MUST** have a tab bar with the following tabs:
  - **Characters**: List of all tracked characters. The tab icon should be a group of characters.
  - **Own equipment**: List of all equipment the user has. The tab icon should be a bag.
  - **Settings**: Settings for the app. The tab icon should be a gear.

### 3.1. Main Screen and tab (Character List)
- **MUST** display a list of all tracked characters.
- **MUST** show a summary for each character:
  - Name & Weapon Type Icon.
  - The weapon type icon should be a small icon representing the weapon type, not the initial letter of the weapon type.
  - Current Attack Value (from Weapon).
  - Current Total Defense Value (Sum of all gear defense values).
- **MUST** allow tapping a character to edit their details/gear (3.2 Add/Edit Character).

### 3.1.1. Add/Edit Character
- **MUST** allow creating a new character with Name and Weapon Type. The weapon type should be a dropdown with the weapon types, but with a friendly name, not a code.
- **MUST** allow editing an existing character's Name and Weapon Type.
- **MUST** allow editing the weapon and gear in each slot (Shield, Helmet, Armor, Boots, Earrings). Both sections (weapon and gear) should be separated.

### 3.1.2. Upgrade Gear Picker (Core Feature)
- **Goal**: Identify the best candidate for a specific piece of new gear.
- **Input**:
  - **Slot Selector**: Dropdown to choose (Weapon, Shield, Helmet, Armor, Boots, Earrings).
  - **Stat Value Input**: Number field for the new gear's Deffense stat.
- **Icon**: The icon should be a small shield icon.
- **Action**:
  - **MUST** highlight characters whose current gear in the selected slot has a **lower** value than the input.
  - **MUST** filter out characters whose weapon needs 2 hands.
  - **SHOULD** sort suggestions by the magnitude of the upgrade (New Defense Value - Current Defense Value).
  - **MUST** display the potential stat gain for each candidate.

### 3.1.3. Upgrade Weapon Picker (Core Feature)
- **Goal**: Identify the best candidate for a specific weapon.
- **Input**:
  - **Weapon Type Selector**: Dropdown to choose (Sword, Rapier, Dagger, Mace, Axe, Scimitar, Katana, Two-Hand Sword, Spear).
  - **Stat Value Input**: Number field for the new weapon's Attack stat.
- **Icon**: The icon should be a small sword icon.
- **Action**:
  - **MUST** highlight characters whose current weapon has a **lower** value than the input, and their weapon type matches the selected weapon type.
  - **SHOULD** sort suggestions by the magnitude of the upgrade (New Attack Value - Current Attack Value).
  - **MUST** display the potential stat gain for each candidate.

### 3.2. Own Equipment
- **Goal**: Display all equipment the user has.
- **Action**:
  - **MUST** show two columns: one for weapons, and one for the gear
  - **MUST** display a list of all weapon types in the first column (the main user has one of each type)
  - **MUST** display the attack value of each weapon on the that column
  - **MUST** display a list of all slots in the second column (the main user has one of each type)
  - **MUST** display the defense value of each gear on the second column
  - **MUST** allow editing the weapon and gear in each slot (Shield, Helmet, Armor, Boots, Earrings). Both sections (weapon and gear) should be separated.
  - **MUST** show an AVERAGE of the attack of all weapons on the first column
  - **MUST** show a SUM of the defense of all gear on the second column

### 3.3. Settings
- **Goal**: Settings for the app.
- **Action**:
  - **MUST** allow exporting the data to a JSON file.
  - **MUST** allow importing the data from a JSON file.
  - **MUST** show the version of the app.
  - **MUST** show the version of the database.

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
- **Icon**: The app icon should be correctly scalated on a mobile device.
- **Popups**: Apply the game's popup style (accept and cancel buttons, colors, ..)