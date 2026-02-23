import 'package:flutter/material.dart';
import '../models/character.dart';
import '../models/character_extension.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final bool highlighted; // For Upgrade Picker

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
    required this.onEdit,
    this.highlighted = false,
  });

  String _getWeaponIconPath(WeaponType type) {
    const basePath = 'assets/icons';
    switch (type) {
      case WeaponType.sword:
        return '$basePath/sword.png';
      case WeaponType.rapier:
        return '$basePath/rapier.png';
      case WeaponType.dagger:
        return '$basePath/dagger.png';
      case WeaponType.mace:
        return '$basePath/mace.png';
      case WeaponType.axe:
        return '$basePath/axe.png';
      case WeaponType.scimitar:
        return '$basePath/scimitar.png';
      case WeaponType.katana:
        return '$basePath/katana.png';
      case WeaponType.twoHandedSword:
        return '$basePath/two_handed_sword.png';
      case WeaponType.spear:
        return '$basePath/spear.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: highlighted
          ? theme.colorScheme.secondary.withValues(alpha: 0.3)
          : null,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: highlighted
          ? RoundedRectangleBorder(
              side: BorderSide(color: theme.colorScheme.primary, width: 2),
              borderRadius: BorderRadius.circular(4),
            )
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Icon Placeholder (Class Icon)
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.5),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    _getWeaponIconPath(character.weaponType),
                    width: 32,
                    height: 32,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Name and Stats
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name ?? 'Unknown',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _StatBadge(
                          label: 'ATK',
                          value: character.attack.toString(),
                          color: Colors.red.shade400,
                        ),
                        const SizedBox(width: 8),
                        _StatBadge(
                          label: 'DEF',
                          value: character.totalDefense.toString(),
                          color: Colors.blue.shade400,
                        ),
                        const SizedBox(width: 8),
                        _StatBadge(
                          label: 'BED',
                          value: character.allConversationsSeen
                              ? 'MAX'
                              : character.bedtimes.toString(),
                          color: character.allConversationsSeen
                              ? Colors.green.shade400
                              : Colors.purple.shade400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Edit Button
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: onEdit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatBadge({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
