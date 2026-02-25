import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/screens/add_character_screen.dart';
import 'package:sao_gear_tracker/providers/character_provider.dart';

class FakeCharacterController extends CharacterController {
  Character? lastAddedCharacter;

  @override
  void build() {}

  @override
  Future<void> addCharacter(Character character) async {
    lastAddedCharacter = character;
  }

  @override
  Future<void> updateCharacter(Character character) async {
    lastAddedCharacter = character;
  }
}

void main() {
  testWidgets('AddCharacterScreen has name length validation', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: AddCharacterScreen(),
        ),
      ),
    );

    final nameFieldFinder = find.byType(TextField).first;
    expect(nameFieldFinder, findsOneWidget);

    final TextField textField = tester.widget(nameFieldFinder);
    expect(textField.maxLength, Character.maxNameLength);
  });

  Future<FakeCharacterController> openAddCharacterScreen(WidgetTester tester, _MockNavigatorObserver observer) async {
    final fakeController = FakeCharacterController();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          characterControllerProvider.overrideWith(() => fakeController),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddCharacterScreen()),
              ),
              child: const Text('Go'),
            ),
          ),
          navigatorObservers: [observer],
        ),
      ),
    );

    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();
    return fakeController;
  }

  Finder findOkButton() {
    return find.byWidgetPredicate((widget) =>
      widget is InkWell &&
      find.descendant(of: find.byWidget(widget), matching: find.byWidgetPredicate((w) => w is Container && w.decoration is BoxDecoration && (w.decoration as BoxDecoration).color == Colors.blue)).evaluate().isNotEmpty
    );
  }

  testWidgets('AddCharacterScreen does not save if name is empty', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    bool popped = false;
    final observer = _MockNavigatorObserver(() => popped = true);
    await openAddCharacterScreen(tester, observer);

    await tester.tap(findOkButton().first);
    await tester.pump();

    expect(popped, isFalse);
  });

  testWidgets('AddCharacterScreen does not save if name is too long', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    bool popped = false;
    final observer = _MockNavigatorObserver(() => popped = true);
    await openAddCharacterScreen(tester, observer);

    final nameField = find.byType(TextField).first;
    // To bypass maxLength enforcement, we manually set the controller's text
    final TextField textFieldWidget = tester.widget(nameField);
    textFieldWidget.controller!.text = 'A' * (Character.maxNameLength + 1);

    await tester.tap(findOkButton().first);
    await tester.pump();

    expect(popped, isFalse);
  });

  testWidgets('AddCharacterScreen saves and trims name if valid', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    bool popped = false;
    final observer = _MockNavigatorObserver(() => popped = true);
    final fakeController = await openAddCharacterScreen(tester, observer);

    final nameField = find.byType(TextField).first;
    await tester.enterText(nameField, '  Valid Name  ');

    // Add a skill fusion (now required)
    await tester.tap(find.byIcon(Icons.add_circle));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Attacker'));
    await tester.pumpAndSettle();

    await tester.tap(findOkButton().first);
    await tester.pumpAndSettle();

    expect(popped, isTrue);
    expect(fakeController.lastAddedCharacter?.name, 'Valid Name');
  });
}

class _MockNavigatorObserver extends NavigatorObserver {
  final VoidCallback onPop;
  _MockNavigatorObserver(this.onPop);

  @override
  void didPop(Route route, Route? previousRoute) {
    onPop();
    super.didPop(route, previousRoute);
  }
}
