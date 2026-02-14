import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../models/gear.dart';
import '../providers/character_provider.dart';

class AddCharacterDialog extends ConsumerStatefulWidget {
  final Character? character; // Add this to support editing if needed later
  const AddCharacterDialog({super.key, this.character});

  @override
  ConsumerState<AddCharacterDialog> createState() => _AddCharacterDialogState();
}

class _AddCharacterDialogState extends ConsumerState<AddCharacterDialog> {
  final _nameController = TextEditingController();
  WeaponType _selectedWeapon = WeaponType.sword;

  // Weapon Stats
  final _weaponAttackController = TextEditingController();
  int _weaponHands = 1;

  // Gear Stats
  final _shieldController = TextEditingController();
  final _helmetController = TextEditingController();
  final _armorController = TextEditingController();
  final _bootsController = TextEditingController();
  final _earringsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.character != null) {
      _nameController.text = widget.character!.name ?? '';
      _selectedWeapon = widget.character!.weaponType;
      _weaponAttackController.text =
          widget.character!.weapon?.statValue.toString() ?? '';
      _weaponHands = widget.character!.weapon?.hands ?? 1;
      _shieldController.text =
          widget.character!.shield?.statValue.toString() ?? '';
      _helmetController.text =
          widget.character!.helmet?.statValue.toString() ?? '';
      _armorController.text =
          widget.character!.armor?.statValue.toString() ?? '';
      _bootsController.text =
          widget.character!.boots?.statValue.toString() ?? '';
      _earringsController.text =
          widget.character!.earrings?.statValue.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.character == null ? 'Add Character' : 'Edit Character',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<WeaponType>(
              initialValue: _selectedWeapon,
              decoration: const InputDecoration(labelText: 'Weapon Class'),
              items: WeaponType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(
                    type.name.toUpperCase().replaceAll(
                      'TWOHANDEDSWORD',
                      '2H SWORD',
                    ),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedWeapon = val;
                    // Auto-set hands based on type?
                    if (val == WeaponType.twoHandedSword ||
                        val == WeaponType.spear ||
                        val == WeaponType.axe) {
                      // Heuristic: some axes are 2h? Spec says "Hands: 1 or 2". User can override.
                      if (val == WeaponType.twoHandedSword) _weaponHands = 2;
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            const Text('Weapon', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _weaponAttackController,
                    decoration: const InputDecoration(labelText: 'Attack'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    initialValue: _weaponHands,
                    decoration: const InputDecoration(labelText: 'Hands'),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('1 Hand')),
                      DropdownMenuItem(value: 2, child: Text('2 Hands')),
                    ],
                    onChanged: (val) => setState(() => _weaponHands = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Gear (Defense)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildGearField('Shield', _shieldController),
            _buildGearField('Helmet', _helmetController),
            _buildGearField('Armor', _armorController),
            _buildGearField('Boots', _bootsController),
            _buildGearField('Earrings', _earringsController),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }

  Widget _buildGearField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.number,
      ),
    );
  }

  void _save() {
    if (_nameController.text.isEmpty) return;

    final char = widget.character ?? Character();
    char.name = _nameController.text;
    char.weaponType = _selectedWeapon;

    char.weapon = Weapon()
      ..statValue = int.tryParse(_weaponAttackController.text) ?? 0
      ..hands = _weaponHands;

    char.shield = Gear()..statValue = int.tryParse(_shieldController.text) ?? 0;
    char.helmet = Gear()..statValue = int.tryParse(_helmetController.text) ?? 0;
    char.armor = Gear()..statValue = int.tryParse(_armorController.text) ?? 0;
    char.boots = Gear()..statValue = int.tryParse(_bootsController.text) ?? 0;
    char.earrings = Gear()
      ..statValue = int.tryParse(_earringsController.text) ?? 0;

    if (widget.character == null) {
      ref.read(characterControllerProvider.notifier).addCharacter(char);
    } else {
      ref.read(characterControllerProvider.notifier).updateCharacter(char);
    }

    Navigator.pop(context);
  }
}
