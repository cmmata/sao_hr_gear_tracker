import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/player_provider.dart';
import '../models/character.dart';
import '../models/player.dart';
import '../models/gear.dart';

class OwnEquipmentScreen extends ConsumerWidget {
  const OwnEquipmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Own Equipment')),
      body: playerAsync.when(
        data: (player) {
          if (player == null) {
            return const Center(child: Text('Initializing...'));
          }
          return Row(
            children: [
              Expanded(
                child: _WeaponColumn(player: player),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: _GearColumn(player: player),
              ),
            ],
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _WeaponColumn extends StatelessWidget {
  final Player player;
  const _WeaponColumn({required this.player});

  @override
  Widget build(BuildContext context) {
    final weapons = [
      (WeaponType.sword, player.sword, 'Sword'),
      (WeaponType.rapier, player.rapier, 'Rapier'),
      (WeaponType.dagger, player.dagger, 'Dagger'),
      (WeaponType.mace, player.mace, 'Mace'),
      (WeaponType.axe, player.axe, 'Axe'),
      (WeaponType.scimitar, player.scimitar, 'Scimitar'),
      (WeaponType.katana, player.katana, 'Katana'),
      (WeaponType.twoHandedSword, player.twoHandedSword, '2H Sword'),
      (WeaponType.spear, player.spear, 'Spear'),
    ];

    double totalAttack = 0;
    int count = 0;
    for (var w in weapons) {
        if (w.$2 != null) {
            totalAttack += w.$2!.statValue;
            count++;
        }
    }
    double average = count > 0 ? totalAttack / count : 0;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Weapons', style: Theme.of(context).textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: weapons.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final item = weapons[index];
              final type = item.$1;
              final weapon = item.$2;
              final name = item.$3;

              return ListTile(
                title: Text(name),
                trailing: Text('${weapon?.statValue ?? 0}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                onTap: () => _showEditWeaponDialog(context, type, weapon),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Text('AVG Attack: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(average.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditWeaponDialog(BuildContext context, WeaponType type, Weapon? currentWeapon) {
    showDialog(
      context: context,
      builder: (context) => _EditWeaponDialog(type: type, currentWeapon: currentWeapon),
    );
  }
}

class _GearColumn extends StatelessWidget {
  final Player player;
  const _GearColumn({required this.player});

  @override
  Widget build(BuildContext context) {
    final gear = [
      (GearSlot.shield, player.shield, 'Shield'),
      (GearSlot.helmet, player.helmet, 'Helmet'),
      (GearSlot.armor, player.armor, 'Armor'),
      (GearSlot.boots, player.boots, 'Boots'),
      (GearSlot.earrings, player.earrings, 'Earrings'),
    ];

    int totalDefense = 0;
    for (var g in gear) {
        if (g.$2 != null) {
            totalDefense += g.$2!.statValue;
        }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Gear', style: Theme.of(context).textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: gear.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final item = gear[index];
              final slot = item.$1;
              final g = item.$2;
              final name = item.$3;

              return ListTile(
                title: Text(name),
                trailing: Text('${g?.statValue ?? 0}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                onTap: () => _showEditGearDialog(context, slot, g),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Text('Total Defense: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$totalDefense', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditGearDialog(BuildContext context, GearSlot slot, Gear? currentGear) {
    showDialog(
      context: context,
      builder: (context) => _EditGearDialog(slot: slot, currentGear: currentGear),
    );
  }
}

class _EditWeaponDialog extends ConsumerStatefulWidget {
  final WeaponType type;
  final Weapon? currentWeapon;

  const _EditWeaponDialog({required this.type, required this.currentWeapon});

  @override
  ConsumerState<_EditWeaponDialog> createState() => _EditWeaponDialogState();
}

class _EditWeaponDialogState extends ConsumerState<_EditWeaponDialog> {
  late TextEditingController _statController;
  late TextEditingController _extraStatsController;

  @override
  void initState() {
    super.initState();
    _statController = TextEditingController(text: widget.currentWeapon?.statValue.toString() ?? '0');
    _extraStatsController = TextEditingController(text: widget.currentWeapon?.extraStats ?? '');
  }

  @override
  void dispose() {
    _statController.dispose();
    _extraStatsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.type.name.toUpperCase()}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _statController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Attack Value', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _extraStatsController,
            decoration: const InputDecoration(labelText: 'Extra Stats', border: OutlineInputBorder()),
            maxLines: 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final val = int.tryParse(_statController.text) ?? 0;
            final newWeapon = Weapon()
              ..statValue = val
              ..extraStats = _extraStatsController.text;

            ref.read(playerControllerProvider.notifier).updateWeapon(widget.type, newWeapon);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _EditGearDialog extends ConsumerStatefulWidget {
  final GearSlot slot;
  final Gear? currentGear;

  const _EditGearDialog({required this.slot, required this.currentGear});

  @override
  ConsumerState<_EditGearDialog> createState() => _EditGearDialogState();
}

class _EditGearDialogState extends ConsumerState<_EditGearDialog> {
  late TextEditingController _statController;
  late TextEditingController _extraStatsController;

  @override
  void initState() {
    super.initState();
    _statController = TextEditingController(text: widget.currentGear?.statValue.toString() ?? '0');
    _extraStatsController = TextEditingController(text: widget.currentGear?.extraStats ?? '');
  }

  @override
  void dispose() {
    _statController.dispose();
    _extraStatsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.slot.name.toUpperCase()}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _statController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Defense Value', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _extraStatsController,
            decoration: const InputDecoration(labelText: 'Extra Stats', border: OutlineInputBorder()),
            maxLines: 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final val = int.tryParse(_statController.text) ?? 0;
            final newGear = Gear()
              ..statValue = val
              ..extraStats = _extraStatsController.text;

            ref.read(playerControllerProvider.notifier).updateGear(widget.slot, newGear);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
