import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';
import '../utils/stat_utils.dart';

enum GearSlot { shield, helmet, armor, boots }

class GearUpgradePicker extends ConsumerStatefulWidget {
  const GearUpgradePicker({super.key});

  @override
  ConsumerState<GearUpgradePicker> createState() => _GearUpgradePickerState();
}

class _GearUpgradePickerState extends ConsumerState<GearUpgradePicker> {
  GearSlot _selectedSlot = GearSlot.helmet;
  final _valueController = TextEditingController();
  List<Character> _suggestions = [];
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _valueController.dispose();
    super.dispose();
  }

  void _calculateUpgrade() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), _performCalculation);
  }

  Future<void> _performCalculation() async {
    if (!mounted) return;

    final text = _valueController.text;
    if (text.isEmpty || int.tryParse(text) == null) {
      setState(() => _suggestions = []);
      return;
    }
    final val = parseStat(text);

    final charactersAsync = ref.read(charactersProvider);
    final List<Character> characters;

    if (charactersAsync.hasValue) {
      characters = charactersAsync.value!;
    } else {
      characters = await ref.read(charactersProvider.future);
    }

    final candidateList = characters
        .where((c) {
          // Filter out characters who cannot equip shield if selected
          if (_selectedSlot == GearSlot.shield) {
            if (c.weapon?.hands == 2) return false;
            // Also, dual wielders (implied by weapon type or just hands?)
            // Spec says "filter out characters whose weapon needs 2 hands".
            // So logic check on hands is enough.
          }
          return true;
        })
        .map((c) {
          int currentVal = 0;
          switch (_selectedSlot) {
            case GearSlot.shield:
              currentVal = c.shield?.statValue ?? 0;
              break;
            case GearSlot.helmet:
              currentVal = c.helmet?.statValue ?? 0;
              break;
            case GearSlot.armor:
              currentVal = c.armor?.statValue ?? 0;
              break;
            case GearSlot.boots:
              currentVal = c.boots?.statValue ?? 0;
              break;
          }
          return MapEntry(c, currentVal);
        })
        .where((entry) => entry.value < val)
        .toList();

    // Sort by GAP (biggest gain)
    candidateList.sort((a, b) {
      final gainA = val - a.value;
      final gainB = val - b.value;
      return gainB.compareTo(gainA); // Descending order of gain
    });

    if (mounted) {
      setState(() {
        _suggestions = candidateList.map((e) => e.key).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.shield, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          const Text('Gear Upgrade'),
        ],
      ),
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
                    onChanged: (v) => setState(() {
                      _selectedSlot = v!;
                      _calculateUpgrade();
                    }),
                    decoration: const InputDecoration(labelText: 'Slot'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'New Def'),
                    onChanged: (_) => _calculateUpgrade(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_valueController.text.isNotEmpty && _suggestions.isEmpty)
              const Text(
                'No candidates found (everyone has better gear or cannot equip).',
              )
            else if (_suggestions.isNotEmpty) ...[
              const Text(
                'Best Candidates:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    final c = _suggestions[index];
                    int currentVal = 0;
                    switch (_selectedSlot) {
                      case GearSlot.shield:
                        currentVal = c.shield?.statValue ?? 0;
                        break;
                      case GearSlot.helmet:
                        currentVal = c.helmet?.statValue ?? 0;
                        break;
                      case GearSlot.armor:
                        currentVal = c.armor?.statValue ?? 0;
                        break;
                      case GearSlot.boots:
                        currentVal = c.boots?.statValue ?? 0;
                        break;
                    }
                    final gain = parseStat(_valueController.text) - currentVal;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withOpacity(
                          0.1,
                        ),
                        child: Text(
                          c.name?.substring(0, 1) ?? '?',
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                      ),
                      title: Text(c.name ?? 'Unknown'),
                      subtitle: Text('Current: $currentVal (Gain: +$gain)'),
                      trailing: index == 0
                          ? const Icon(Icons.star, color: Colors.amber)
                          : null,
                    );
                  },
                ),
              ),
            ],
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
