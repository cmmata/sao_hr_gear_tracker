import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';

enum GearSlot { helmet, armor, boots, weapon }

class UpgradePickerDialog extends ConsumerStatefulWidget {
  const UpgradePickerDialog({super.key});

  @override
  ConsumerState<UpgradePickerDialog> createState() =>
      _UpgradePickerDialogState();
}

class _UpgradePickerDialogState extends ConsumerState<UpgradePickerDialog> {
  GearSlot _selectedSlot = GearSlot.helmet;
  final _valueController = TextEditingController();
  List<Character> _suggestions = [];

  void _calculateUpgrade() async {
    final val = int.tryParse(_valueController.text);
    if (val == null) return;

    final characters = await ref.read(charactersProvider.future);

    // Filter and sort
    // Logic: Find characters where current slot value < new value.
    // Sort by GAP (biggest gain) or simply by LOWEST current stat?
    // Prompt: "highlight the character who would benefit most (the one with the lowest defense in the current gear in that category)"

    final candidateList = characters
        .map((c) {
          int currentVal = 0;
          switch (_selectedSlot) {
            case GearSlot.helmet:
              currentVal = c.helmet?.statValue ?? 0;
              break;
            case GearSlot.armor:
              currentVal = c.armor?.statValue ?? 0;
              break;
            case GearSlot.boots:
              currentVal = c.boots?.statValue ?? 0;
              break;
            case GearSlot.weapon:
              currentVal = c.weapon?.statValue ?? 0;
              break;
          }
          return MapEntry(c, currentVal);
        })
        .where(
          (entry) => entry.value < val,
        ) // Only if it's an upgrade? Prompt doesn't explicitly say only if upgrade, but "benefit most". If current is higher, no benefit.
        .toList();

    // Sort by lowest current value (biggest upgrade)
    candidateList.sort((a, b) => a.value.compareTo(b.value));

    setState(() {
      _suggestions = candidateList.map((e) => e.key).take(3).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: const Text('Upgrade Picker'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<GearSlot>(
                    initialValue: _selectedSlot,
                    items: GearSlot.values
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(s.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _selectedSlot = v!),
                    decoration: const InputDecoration(labelText: 'Slot'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'New Value'),
                    onChanged: (_) => _calculateUpgrade(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_suggestions.isNotEmpty) ...[
              const Text(
                'Best Candidates:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._suggestions.map((c) {
                int currentVal = 0;
                switch (_selectedSlot) {
                  case GearSlot.helmet:
                    currentVal = c.helmet?.statValue ?? 0;
                    break;
                  case GearSlot.armor:
                    currentVal = c.armor?.statValue ?? 0;
                    break;
                  case GearSlot.boots:
                    currentVal = c.boots?.statValue ?? 0;
                    break;
                  case GearSlot.weapon:
                    currentVal = c.weapon?.statValue ?? 0;
                    break;
                }
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(c.name?.substring(0, 1) ?? '?'),
                  ),
                  title: Text(c.name ?? 'Unknown'),
                  subtitle: Text(
                    'Current: $currentVal (Gain: +${(int.tryParse(_valueController.text) ?? 0) - currentVal})',
                  ),
                  tileColor: _suggestions.first == c
                      ? theme.primaryColor.withValues(alpha: 0.1)
                      : null,
                );
              }),
            ] else if (_valueController.text.isNotEmpty)
              const Text('No candidates found (everyone has better gear).'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
