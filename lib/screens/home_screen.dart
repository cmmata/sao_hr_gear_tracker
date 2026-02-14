import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../widgets/character_card.dart';
import '../widgets/add_character_dialog.dart';
import '../widgets/upgrade_picker_dialog.dart';
import 'edit_character_screen.dart';

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
            icon: const Icon(Icons.upgrade),
            tooltip: 'Find Upgrade Candidate',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const UpgradePickerDialog(),
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
                      builder: (context) =>
                          EditCharacterScreen(character: char),
                    ),
                  );
                },
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditCharacterScreen(character: char),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddCharacterDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
