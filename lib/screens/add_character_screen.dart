import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../models/gear.dart';
import '../providers/character_provider.dart';

class AddCharacterScreen extends ConsumerStatefulWidget {
  final Character? character;
  const AddCharacterScreen({super.key, this.character});

  @override
  ConsumerState<AddCharacterScreen> createState() => _AddCharacterScreenState();
}

class _AddCharacterScreenState extends ConsumerState<AddCharacterScreen> {
  final _nameController = TextEditingController();
  WeaponType _selectedWeapon = WeaponType.sword;

  // Weapon Stats
  final _weaponAttackController = TextEditingController();
  // Hands is now derived from WeaponType

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

  int _getHandsForWeapon(WeaponType type) {
    if (type == WeaponType.twoHandedSword || type == WeaponType.spear) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.character == null ? 'Add Character' : 'Edit Character',
        ),
        automaticallyImplyLeading: false, // Hide back button
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // OK Button (Blue Circle)
            InkWell(
              onTap: _save,
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4),
                ),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            // Cancel Button (Red Cross)
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 4),
                ),
                child: const Icon(Icons.close, color: Colors.red, size: 40),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<WeaponType>(
              value: _selectedWeapon,
              decoration: const InputDecoration(
                labelText: 'Weapon Class',
                border: OutlineInputBorder(),
              ),
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
                  setState(() => _selectedWeapon = val);
                }
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Weapon Details (${_getHandsForWeapon(_selectedWeapon)} Handed)',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _weaponAttackController,
              decoration: const InputDecoration(
                labelText: 'Attack Power',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),
            Text(
              'Gear (Defense)',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Only show shield if 1-handed
            if (_getHandsForWeapon(_selectedWeapon) == 1) ...[
              _buildGearField('Shield', _shieldController),
              const SizedBox(height: 16),
            ],

            _buildGearField('Helmet', _helmetController),
            const SizedBox(height: 16),
            _buildGearField('Armor', _armorController),
            const SizedBox(height: 16),
            _buildGearField('Boots', _bootsController),
            const SizedBox(height: 16),
            _buildGearField('Earrings', _earringsController),
          ],
        ),
      ),
    );
  }

  Widget _buildGearField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  void _save() {
    if (_nameController.text.isEmpty) return;

    final char = widget.character ?? Character();
    char.name = _nameController.text;
    char.weaponType = _selectedWeapon;

    // Auto-set hands
    final hands = _getHandsForWeapon(_selectedWeapon);

    char.weapon = Weapon()
      ..statValue = int.tryParse(_weaponAttackController.text) ?? 0
      ..hands = hands;

    // If hands=2, force shield to null or 0?
    // Logic: If switching to 2H, wipe shield stats?
    // Spec doesn't strictly say "delete shield if 2H" but implies it can't be equipped.
    // For safety, let's keep the value but the UpgradePicker filters it out.
    // Actually, Cleaner to nullify it if user switches to 2H.
    if (hands == 2) {
      char.shield = null;
    } else {
      char.shield = Gear()
        ..statValue = int.tryParse(_shieldController.text) ?? 0;
    }

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
