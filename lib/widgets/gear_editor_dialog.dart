import 'package:flutter/material.dart';
import '../models/gear.dart';

class GearEditorDialog extends StatefulWidget {
  final Gear? initialGear;
  final String title;

  const GearEditorDialog({super.key, this.initialGear, required this.title});

  @override
  State<GearEditorDialog> createState() => _GearEditorDialogState();
}

class _GearEditorDialogState extends State<GearEditorDialog> {
  late TextEditingController _nameController;
  late TextEditingController _statController;
  late TextEditingController _extraStatsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.initialGear?.name ?? '',
    );
    _statController = TextEditingController(
      text: widget.initialGear?.statValue.toString() ?? '0',
    );
    _extraStatsController = TextEditingController(
      text: widget.initialGear?.extraStats ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.title}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _statController,
              decoration: InputDecoration(
                labelText: widget.title == 'Weapon' ? 'Attack' : 'Defense',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _extraStatsController,
              decoration: const InputDecoration(
                labelText: 'Extra Stats (Optional)',
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'remove'), // Signal to remove
          child: const Text('Remove', style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () {
            final stat = int.tryParse(_statController.text) ?? 0;
            final gear = Gear()
              ..name = _nameController.text
              ..statValue = stat
              ..extraStats = _extraStatsController.text;
            Navigator.pop(context, gear);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
