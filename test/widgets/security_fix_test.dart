import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sao_gear_tracker/screens/add_character_screen.dart';
import 'package:sao_gear_tracker/screens/own_equipment_screen.dart';
import 'package:sao_gear_tracker/providers/character_provider.dart';
import 'package:sao_gear_tracker/models/character.dart';

class FakeCharacterController extends CharacterController {
  Character? lastAddedCharacter;

  @override
  Future<void> build() async {}

  @override
  Future<void> addCharacter(Character character) async {
    lastAddedCharacter = character;
  }
}

void main() {
  testWidgets('AddCharacterScreen clamps negative stats to 0', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    final fakeController = FakeCharacterController();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          characterControllerProvider.overrideWith(() => fakeController),
        ],
        child: const MaterialApp(
          home: AddCharacterScreen(),
        ),
      ),
    );

    // Enter name
    await tester.enterText(find.byType(TextField).at(0), 'Kirito');

    // Enter negative attack
    await tester.enterText(find.byType(TextField).at(1), '-500');

    // Enter negative defense (Shield)
    await tester.enterText(find.byType(TextField).at(2), '-100');

    // Save
    // In AddCharacterScreen, the OK button is currently the second InkWell
    // (the first is the CheckboxListTile)
    // We can find it more reliably by looking for the InkWell that has a blue color decoration
    // or just use at(1) based on our discovery.
    await tester.tap(find.byType(InkWell).at(1));
    await tester.pumpAndSettle();

    expect(fakeController.lastAddedCharacter, isNotNull);
    expect(fakeController.lastAddedCharacter!.weapon?.statValue, 0);
    expect(fakeController.lastAddedCharacter!.shield?.statValue, 0);
  });

  testWidgets('StatEditDialog clamps negative stats to 0', (WidgetTester tester) async {
    int? savedValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => StatEditDialog(
                  title: 'Test',
                  initialValue: 10,
                  onSave: (val, extra) => savedValue = val,
                ),
              ),
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, '-50');
    // Find OK button (has Icons.check)
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle();

    expect(savedValue, 0);
  });
}
