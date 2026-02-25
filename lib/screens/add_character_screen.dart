import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../models/gear.dart';
import '../providers/character_provider.dart';
import '../utils/stat_utils.dart';

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

  // Bed conversations
  final _bedtimesController = TextEditingController();
  bool _allConversationsSeen = false;

  // Skill Fusions
  List<SkillFusion> _skillFusions = [];

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
      _bedtimesController.text = widget.character!.bedtimes.toString();
      _allConversationsSeen = widget.character!.allConversationsSeen;
      _skillFusions = widget.character!.skillFusions
          .map((e) => SkillFusion()
            ..type = e.type
            ..level = e.level)
          .toList();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _weaponAttackController.dispose();
    _shieldController.dispose();
    _helmetController.dispose();
    _armorController.dispose();
    _bootsController.dispose();
    _bedtimesController.dispose();
    super.dispose();
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
              maxLength: Character.maxNameLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
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

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skill Fusions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_skillFusions.length < 4)
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.blue),
                    onPressed: _showAddFusionDialog,
                  ),
              ],
            ),
            if (_skillFusions.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'No skill fusions added. Add at least one.',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ..._skillFusions.map((fusion) => _buildFusionTile(fusion)),

            const SizedBox(height: 24),
            Text(
              'Bed Conversations',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const Text('All conversations seen'),
              value: _allConversationsSeen,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _allConversationsSeen = val);
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            TextField(
              controller: _bedtimesController,
              decoration: const InputDecoration(
                labelText: 'Number of bedtimes',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              enabled: !_allConversationsSeen,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFusionTile(SkillFusion fusion) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(fusion.type.displayName),
        subtitle: Text('Level: ${fusion.level}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: fusion.level > 0
                  ? () => setState(() => fusion.level--)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: fusion.level < 5
                  ? () => setState(() => fusion.level++)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => setState(() => _skillFusions.remove(fusion)),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFusionDialog() {
    final availableTypes = SkillFusionType.values
        .where((type) => !_skillFusions.any((f) => f.type == type))
        .toList();

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Add Skill Fusion'),
        children: availableTypes
            .map(
              (type) => SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    _skillFusions.add(SkillFusion()
                      ..type = type
                      ..level = 0);
                  });
                  Navigator.pop(context);
                },
                child: Text(type.displayName),
              ),
            )
            .toList(),
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
    final name = _nameController.text.trim();
    if (name.isEmpty || name.length > Character.maxNameLength) return;

    if (_skillFusions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one skill fusion.')),
      );
      return;
    }

    final char = widget.character ?? Character();
    char.name = name;
    char.weaponType = _selectedWeapon;

    // Auto-set hands
    final hands = _getHandsForWeapon(_selectedWeapon);

    char.weapon = Weapon()
      ..statValue = parseStat(_weaponAttackController.text)
      ..hands = hands;

    // If hands=2, force shield to null or 0?
    // Logic: If switching to 2H, wipe shield stats?
    // Spec doesn't strictly say "delete shield if 2H" but implies it can't be equipped.
    // For safety, let's keep the value but the UpgradePicker filters it out.
    // Actually, Cleaner to nullify it if user switches to 2H.
    if (hands == 2) {
      char.shield = null;
    } else {
      char.shield = Gear()..statValue = parseStat(_shieldController.text);
    }

    char.helmet = Gear()..statValue = parseStat(_helmetController.text);
    char.armor = Gear()..statValue = parseStat(_armorController.text);
    char.boots = Gear()..statValue = parseStat(_bootsController.text);

    char.bedtimes = parseStat(_bedtimesController.text);
    char.allConversationsSeen = _allConversationsSeen;

    char.skillFusions = _skillFusions;

    if (widget.character == null) {
      ref.read(characterControllerProvider.notifier).addCharacter(char);
    } else {
      ref.read(characterControllerProvider.notifier).updateCharacter(char);
    }

    Navigator.pop(context);
  }
}
