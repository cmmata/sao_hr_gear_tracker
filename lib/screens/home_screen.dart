import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../widgets/character_card.dart';
import 'add_character_screen.dart';
import '../widgets/upgrade_picker_dialog.dart';
import '../widgets/weapon_upgrade_picker.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SAO:HR Gear Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.colorize), // Sword icon for Weapon Upgrade
            tooltip: 'Find Weapon Upgrade',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const WeaponUpgradePicker(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shield), // Shield icon for Gear Upgrade
            tooltip: 'Find Gear Upgrade',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const GearUpgradePicker(),
              );
            },
          ),
        ],
      ),
      body: charactersAsync.when(
        data: (characters) {
          if (characters.isEmpty) {
            return const Center(child: Text('No characters yet. Add one!'));
          }
          return ListView.builder(
            itemCount: characters.length,
            padding: const EdgeInsets.only(bottom: 80),
            itemBuilder: (context, index) {
              final char = characters[index];
              return CharacterCard(
                character: char,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCharacterScreen(character: char),
                    ),
                  );
                },
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCharacterScreen(character: char),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          debugPrint('Error loading characters: $err');
          return const Center(child: Text('An error occurred while loading data.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCharacterScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
