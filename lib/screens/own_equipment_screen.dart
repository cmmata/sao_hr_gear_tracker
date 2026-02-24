import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_provider.dart';
import '../models/character.dart';
import '../models/gear.dart';
import '../models/player.dart';
import '../utils/stat_utils.dart';

class OwnEquipmentScreen extends ConsumerWidget {
  const OwnEquipmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Own Equipment')),
      body: playerAsync.when(
        data: (player) => _buildBody(context, ref, player),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          debugPrint('[OwnEquipmentScreen] Error loading player equipment: $err');
          return const Center(
            child: Text('An error occurred while loading equipment.'),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, Player player) {
    final weaponList = [
      (WeaponType.sword, 'Sword', player.sword),
      (WeaponType.rapier, 'Rapier', player.rapier),
      (WeaponType.dagger, 'Dagger', player.dagger),
      (WeaponType.mace, 'Mace', player.mace),
      (WeaponType.axe, 'Axe', player.axe),
      (WeaponType.scimitar, 'Scimitar', player.scimitar),
      (WeaponType.katana, 'Katana', player.katana),
      (WeaponType.twoHandedSword, '2H Sword', player.twoHandedSword),
      (WeaponType.spear, 'Spear', player.spear),
    ];

    final gearList = [
      ('Shield', player.shield, 'shield'),
      ('Helmet', player.helmet, 'helmet'),
      ('Armor', player.armor, 'armor'),
      ('Boots', player.boots, 'boots'),
      ('Earrings', player.earrings, 'earrings'),
    ];

    final avgAttack =
        weaponList.map((e) => e.$3.statValue).reduce((a, b) => a + b) /
        weaponList.length;
    final sumDefense = gearList
        .map((e) => e.$2.statValue)
        .reduce((a, b) => a + b);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Weapons Column
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Weapons',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...weaponList.map(
                      (w) => _buildItemTile(
                        context,
                        w.$2,
                        w.$3.statValue,
                        w.$3.extraStats,
                        () => _showEditWeaponDialog(
                          context,
                          ref,
                          player,
                          w.$1,
                          w.$2,
                          w.$3,
                        ),
                      ),
                    ),
                    const Divider(height: 32),
                    _buildSummaryTile(
                      context,
                      'AVERAGE ATK',
                      avgAttack.toStringAsFixed(1),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Gear Column
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Gear',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...gearList.map(
                      (g) => _buildItemTile(
                        context,
                        g.$1,
                        g.$2.statValue,
                        g.$2.extraStats,
                        () => _showEditGearDialog(
                          context,
                          ref,
                          player,
                          g.$3,
                          g.$1,
                          g.$2,
                        ),
                      ),
                    ),
                    const Divider(height: 32),
                    _buildSummaryTile(
                      context,
                      'TOTAL DEF',
                      sumDefense.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 80), // Space for bottom nav
        ],
      ),
    );
  }

  Widget _buildItemTile(
    BuildContext context,
    String label,
    int value,
    String? extra,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$value',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.edit, size: 16, color: Colors.orange),
                ],
              ),
              if (extra != null && extra.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    extra,
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryTile(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showEditWeaponDialog(
    BuildContext context,
    WidgetRef ref,
    Player player,
    WeaponType type,
    String label,
    Weapon weapon,
  ) {
    showDialog(
      context: context,
      builder: (context) => StatEditDialog(
        title: 'Edit $label',
        initialValue: weapon.statValue,
        initialExtra: weapon.extraStats,
        onSave: (val, extra) {
          final updatedWeapon = Weapon()
            ..statValue = val
            ..extraStats = extra;

          switch (type) {
            case WeaponType.sword:
              player.sword = updatedWeapon;
              break;
            case WeaponType.rapier:
              player.rapier = updatedWeapon;
              break;
            case WeaponType.dagger:
              player.dagger = updatedWeapon;
              break;
            case WeaponType.mace:
              player.mace = updatedWeapon;
              break;
            case WeaponType.axe:
              player.axe = updatedWeapon;
              break;
            case WeaponType.scimitar:
              player.scimitar = updatedWeapon;
              break;
            case WeaponType.katana:
              player.katana = updatedWeapon;
              break;
            case WeaponType.twoHandedSword:
              player.twoHandedSword = updatedWeapon;
              break;
            case WeaponType.spear:
              player.spear = updatedWeapon;
              break;
          }

          ref.read(playerControllerProvider.notifier).updatePlayer(player);
        },
      ),
    );
  }

  void _showEditGearDialog(
    BuildContext context,
    WidgetRef ref,
    Player player,
    String slot,
    String label,
    Gear gear,
  ) {
    showDialog(
      context: context,
      builder: (context) => StatEditDialog(
        title: 'Edit $label',
        initialValue: gear.statValue,
        initialExtra: gear.extraStats,
        labelValue: 'Defense Value',
        onSave: (val, extra) {
          final updatedGear = Gear()
            ..statValue = val
            ..extraStats = extra;

          switch (slot) {
            case 'shield':
              player.shield = updatedGear;
              break;
            case 'helmet':
              player.helmet = updatedGear;
              break;
            case 'armor':
              player.armor = updatedGear;
              break;
            case 'boots':
              player.boots = updatedGear;
              break;
            case 'earrings':
              player.earrings = updatedGear;
              break;
          }

          ref.read(playerControllerProvider.notifier).updatePlayer(player);
        },
      ),
    );
  }
}

class StatEditDialog extends StatefulWidget {
  final String title;
  final int initialValue;
  final String? initialExtra;
  final String labelValue;
  final Function(int, String) onSave;

  const StatEditDialog({
    super.key,
    required this.title,
    required this.initialValue,
    this.initialExtra,
    this.labelValue = 'Attack Value',
    required this.onSave,
  });

  @override
  State<StatEditDialog> createState() => _StatEditDialogState();
}

class _StatEditDialogState extends State<StatEditDialog> {
  late TextEditingController _statController;
  late TextEditingController _extraController;

  @override
  void initState() {
    super.initState();
    _statController = TextEditingController(
      text: widget.initialValue.toString(),
    );
    _extraController = TextEditingController(text: widget.initialExtra ?? '');
  }

  @override
  void dispose() {
    _statController.dispose();
    _extraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _statController,
              decoration: InputDecoration(
                labelText: widget.labelValue,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _extraController,
              decoration: const InputDecoration(
                labelText: 'Extra Stats (e.g. STR+10)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // OK Button (Blue Circle with Check)
                InkWell(
                  onTap: () {
                    final newValue = parseStat(_statController.text);
                    final newExtra = _extraController.text;
                    widget.onSave(newValue, newExtra);
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                ),
                // Cancel Button (Red Circle with Cross)
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
          ],
        ),
      ),
    );
  }
}
