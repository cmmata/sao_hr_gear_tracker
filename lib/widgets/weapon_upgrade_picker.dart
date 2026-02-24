import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';
import '../utils/stat_utils.dart';

class WeaponUpgradePicker extends ConsumerStatefulWidget {
  const WeaponUpgradePicker({super.key});

  @override
  ConsumerState<WeaponUpgradePicker> createState() =>
      _WeaponUpgradePickerState();
}

class _WeaponUpgradePickerState extends ConsumerState<WeaponUpgradePicker> {
  WeaponType _selectedType = WeaponType.sword;
  final _valueController = TextEditingController();
  List<Character> _suggestions = [];

  void _calculateUpgrade() async {
    final text = _valueController.text;
    if (text.isEmpty || int.tryParse(text) == null) {
      if (mounted) setState(() => _suggestions = []);
      return;
    }
    final val = parseStat(text);

    final characters = await ref.read(charactersProvider.future);

    final candidateList = characters
        .where((c) => c.weaponType == _selectedType) // Match weapon type
        .map((c) {
          int currentVal = c.weapon?.statValue ?? 0;
          return MapEntry(c, currentVal);
        })
        .where((entry) => entry.value < val)
        .toList();

    // Sort by GAP (biggest gain)
    candidateList.sort((a, b) {
      final gainA = val - a.value;
      final gainB = val - b.value;
      return gainB.compareTo(gainA); // Descending order
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
          Icon(
            Icons.colorize,
            color: theme.colorScheme.primary,
          ), // Sword/Weapon icon
          const SizedBox(width: 8),
          const Text('Weapon Upgrade'),
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
                  child: DropdownButtonFormField<WeaponType>(
                    initialValue: _selectedType,
                    items: WeaponType.values
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(
                              s.name.toUpperCase().replaceAll(
                                'TWOHANDEDSWORD',
                                '2H SWORD',
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() {
                      _selectedType = v!;
                      _calculateUpgrade();
                    }),
                    decoration: const InputDecoration(labelText: 'Type'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'New Atk'),
                    onChanged: (_) => _calculateUpgrade(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_valueController.text.isNotEmpty && _suggestions.isEmpty)
              const Text(
                'No candidates found (everyone has better weapon or different type).',
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
                    final currentVal = c.weapon?.statValue ?? 0;
                    final gain = parseStat(_valueController.text) - currentVal;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.primary.withValues(
                          alpha: 0.1,
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
