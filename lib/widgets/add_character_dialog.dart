import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';

class AddCharacterDialog extends ConsumerStatefulWidget {
  const AddCharacterDialog({super.key});

  @override
  ConsumerState<AddCharacterDialog> createState() => _AddCharacterDialogState();
}

class _AddCharacterDialogState extends ConsumerState<AddCharacterDialog> {
  final _nameController = TextEditingController();
  WeaponType _selectedWeapon = WeaponType.sword;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Character'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
                child: Text(type.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() => _selectedWeapon = val);
              }
            },
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
            if (_nameController.text.isNotEmpty) {
              ref
                  .read(characterControllerProvider.notifier)
                  .addCharacter(_nameController.text, _selectedWeapon);
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
