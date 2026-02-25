import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sao_gear_tracker/screens/add_character_screen.dart';
import 'package:sao_gear_tracker/screens/own_equipment_screen.dart';
import 'package:sao_gear_tracker/providers/character_provider.dart';
import 'package:sao_gear_tracker/providers/player_provider.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/models/player.dart';

void main() {
  testWidgets('AddCharacterScreen shows Skill Fusions section', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: AddCharacterScreen())),
    );

    expect(find.text('Skill Fusions'), findsOneWidget);
    expect(
      find.text('No skill fusions added. Add at least one.'),
      findsOneWidget,
    );
  });

  testWidgets(
    'OwnEquipmentScreen shows Skill Fusion Progress section when characters exist',
    (WidgetTester tester) async {
      final char = Character()
        ..id = 1
        ..name = 'Kirito'
        ..skillFusions = [
          SkillFusion()
            ..type = SkillFusionType.attacker
            ..level = 3,
        ];

      final player = Player();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            charactersProvider.overrideWith((ref) => Stream.value([char])),
            playerProvider.overrideWith((ref) => Stream.value(player)),
          ],
          child: const MaterialApp(home: OwnEquipmentScreen()),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Skill Fusion Progress'), findsOneWidget);
      expect(find.text('Helping Character'), findsOneWidget);
    },
  );

  testWidgets('OwnEquipmentScreen displays helping message when active fusion set', (
    WidgetTester tester,
  ) async {
    final char = Character()
      ..id = 1
      ..name = 'Kirito'
      ..skillFusions = [
        SkillFusion()
          ..type = SkillFusionType.attacker
          ..level = 3,
      ];

    final player = Player()
      ..activeFusionCharacterId = 1
      ..activeFusionType = SkillFusionType.attacker;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          charactersProvider.overrideWith((ref) => Stream.value([char])),
          playerProvider.overrideWith((ref) => Stream.value(player)),
        ],
        child: const MaterialApp(home: OwnEquipmentScreen()),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(
      find.text('Helping Kirito to obtain the fusion skill Attacker 3'),
      findsOneWidget,
    );
  });
}
