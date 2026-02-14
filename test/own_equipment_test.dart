import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sao_gear_tracker/screens/own_equipment_screen.dart';
import 'package:sao_gear_tracker/providers/player_provider.dart';
import 'package:sao_gear_tracker/models/player.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/models/gear.dart';

void main() {
  testWidgets('OwnEquipmentScreen displays correctly', (WidgetTester tester) async {
    // Setup mock player
    final mockPlayer = Player()
      ..sword = (Weapon()..statValue = 10)
      ..rapier = (Weapon()..statValue = 20)
      ..shield = (Gear()..statValue = 5)
      ..helmet = (Gear()..statValue = 5);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          playerProvider.overrideWith((ref) => Stream.value(mockPlayer)),
        ],
        child: const MaterialApp(
          home: OwnEquipmentScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify title
    expect(find.text('Own Equipment'), findsOneWidget);

    // Verify columns titles
    expect(find.text('Weapons'), findsOneWidget);
    expect(find.text('Gear'), findsOneWidget);

    // Verify weapon list items
    expect(find.text('Sword'), findsOneWidget);
    // 10 is found twice: Sword attack and Total Defense
    expect(find.text('10'), findsNWidgets(2));
    expect(find.text('Rapier'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);

    // Verify gear list items
    expect(find.text('Shield'), findsOneWidget);
    expect(find.text('5'), findsNWidgets(2)); // One for shield, one for helmet

    // Verify stats
    // AVG Attack: (10 + 20) / 2 = 15.0 if only 2 are non-null?
    // In my mock, other fields are null.
    // My implementation checks for != null.
    // Wait, in my mock I didn't initialize other fields, so they are null.
    // The implementation:
    /*
    for (var w in weapons) {
        if (w.$2 != null) {
            totalAttack += w.$2!.statValue;
            count++;
        }
    }
    */
    // So average is 15.0.
    expect(find.text('15.0'), findsOneWidget);

    // Total Defense: 5 + 5 = 10.
    expect(find.text('10'), findsAtLeastNWidgets(1));
  });

  testWidgets('Tapping weapon opens edit dialog', (WidgetTester tester) async {
    final mockPlayer = Player()
      ..sword = (Weapon()..statValue = 10);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          playerProvider.overrideWith((ref) => Stream.value(mockPlayer)),
        ],
        child: const MaterialApp(
          home: OwnEquipmentScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('Sword'));
    await tester.pumpAndSettle();

    expect(find.text('Edit SWORD'), findsOneWidget);
    expect(find.text('Attack Value'), findsOneWidget);
    expect(find.text('Extra Stats'), findsOneWidget);
  });
}
