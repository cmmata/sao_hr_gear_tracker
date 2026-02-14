import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../models/character_extension.dart';
import '../models/gear.dart';
import '../providers/character_provider.dart';
import '../widgets/gear_editor_dialog.dart';

class EditCharacterScreen extends ConsumerWidget {
  final Character character;

  const EditCharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Watch the character from the database to get real-time updates
    final characterAsync = ref.watch(characterProvider(character.id));

    // Use the latest character from DB, or fallback to the passed one if loading/error
    final displayCharacter = characterAsync.valueOrNull ?? character;

    return Scaffold(
      appBar: AppBar(
        title: Text(displayCharacter.name ?? 'Character'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (c) => AlertDialog(
                  title: const Text('Delete Character?'),
                  content: const Text('This cannot be undone.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
              if (confirm == true) {
                await ref
                    .read(characterControllerProvider.notifier)
                    .deleteCharacter(displayCharacter.id);
                if (context.mounted) Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildStatSummary(displayCharacter, theme),
            const Divider(),
            _buildGearTile(context, ref, 'Weapon', displayCharacter.weapon, (
              g,
            ) {
              // We must create a copy or modify the object.
              // Since Isar objects are mutable, we can modify and save.
              displayCharacter.weapon = g;
              ref
                  .read(characterControllerProvider.notifier)
                  .updateCharacter(displayCharacter);
            }),
            _buildGearTile(context, ref, 'Helmet', displayCharacter.helmet, (
              g,
            ) {
              displayCharacter.helmet = g;
              ref
                  .read(characterControllerProvider.notifier)
                  .updateCharacter(displayCharacter);
            }),
            _buildGearTile(context, ref, 'Armor', displayCharacter.armor, (g) {
              displayCharacter.armor = g;
              ref
                  .read(characterControllerProvider.notifier)
                  .updateCharacter(displayCharacter);
            }),
            _buildGearTile(context, ref, 'Boots', displayCharacter.boots, (g) {
              displayCharacter.boots = g;
              ref
                  .read(characterControllerProvider.notifier)
                  .updateCharacter(displayCharacter);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatSummary(Character char, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'Attack',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${char.attack}',
                  style: TextStyle(fontSize: 24, color: theme.primaryColor),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Defense',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${char.totalDefense}',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGearTile(
    BuildContext context,
    WidgetRef ref,
    String title,
    Gear? currentGear,
    Function(Gear?) onSave,
  ) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: currentGear == null
          ? const Text('Empty', style: TextStyle(color: Colors.grey))
          : Text('${currentGear.name} (${currentGear.statValue})'),
      trailing: const Icon(Icons.edit),
      onTap: () async {
        final result = await showDialog(
          context: context,
          builder: (c) =>
              GearEditorDialog(initialGear: currentGear, title: title),
        );

        if (result == 'remove') {
          onSave(null);
        } else if (result is Gear) {
          onSave(result);
        }
      },
    );
  }
}
