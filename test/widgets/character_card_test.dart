import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/widgets/character_card.dart';

void main() {
  group('CharacterCard', () {
    late Character character;

    setUp(() {
      character = Character()
        ..name = 'Kirito'
        ..weaponType = WeaponType.sword
        ..weapon = (Weapon()..statValue = 50);
    });

    testWidgets('displays character name and stats', (WidgetTester tester) async {
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

      expect(find.text('Kirito'), findsOneWidget);
      expect(find.text('ATK'), findsOneWidget);
      expect(find.text('50'), findsOneWidget);
      expect(find.text('DEF'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('triggers onTap callback', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CharacterCard(
              character: character,
              onTap: () => tapped = true,
              onEdit: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      expect(tapped, isTrue);
    });

    testWidgets('triggers onEdit callback', (WidgetTester tester) async {
      bool editTapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CharacterCard(
              character: character,
              onTap: () {},
              onEdit: () => editTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      expect(editTapped, isTrue);
    });

    testWidgets('handles unknown name', (WidgetTester tester) async {
      character.name = null;

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

    testWidgets('shows highlighted state', (WidgetTester tester) async {
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

      final Card card = tester.widget(find.byType(Card));
      expect(card.shape, isA<RoundedRectangleBorder>());
    });
  });
}
