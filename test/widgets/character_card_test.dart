import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/widgets/character_card.dart';

void main() {
  testWidgets('CharacterCard displays character information and handles callbacks', (WidgetTester tester) async {
    bool tapped = false;
    bool editTapped = false;

    final character = Character()
      ..name = 'Kirito'
      ..weaponType = WeaponType.sword
      ..weapon = (Weapon()..statValue = 50);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CharacterCard(
            character: character,
            onTap: () => tapped = true,
            onEdit: () => editTapped = true,
          ),
        ),
      ),
    );

    // Verify name
    expect(find.text('Kirito'), findsOneWidget);

    // Verify ATK
    expect(find.text('ATK'), findsOneWidget);
    expect(find.text('50'), findsOneWidget);

    // Verify DEF (should be 0 as no other gear is set)
    expect(find.text('DEF'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Test onTap
    await tester.tap(find.byType(InkWell));
    expect(tapped, isTrue);

    // Test onEdit
    await tester.tap(find.byType(IconButton));
    expect(editTapped, isTrue);
  });

  testWidgets('CharacterCard handles unknown name', (WidgetTester tester) async {
    final character = Character()..name = null;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CharacterCard(
            character: character,
            onTap: () {},
            onEdit: () {},
          ),
        ),
      ),
    );

    expect(find.text('Unknown'), findsOneWidget);
  });

  testWidgets('CharacterCard shows highlighted state', (WidgetTester tester) async {
    final character = Character()..name = 'Asuna';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CharacterCard(
            character: character,
            onTap: () {},
            onEdit: () {},
            highlighted: true,
          ),
        ),
      ),
    );

    // Find the Card widget
    final cardFinder = find.byType(Card);
    final Card card = tester.widget(cardFinder);

    // Verify it has a specific shape/border when highlighted
    // In character_card.dart:
    // shape: highlighted ? RoundedRectangleBorder(...) : null,
    expect(card.shape, isA<RoundedRectangleBorder>());
  });
}
