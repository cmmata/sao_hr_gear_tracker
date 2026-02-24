import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sao_gear_tracker/screens/own_equipment_screen.dart';
import 'package:sao_gear_tracker/providers/player_provider.dart';
import 'package:sao_gear_tracker/models/player.dart';

void main() {
  testWidgets('OwnEquipmentScreen displays columns and items', (
    WidgetTester tester,
  ) async {
    final player = Player();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [playerProvider.overrideWith((ref) => Stream.value(player))],
        child: const MaterialApp(home: OwnEquipmentScreen()),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Own Equipment'), findsOneWidget);
    expect(find.text('Weapons'), findsOneWidget);
    expect(find.text('Gear'), findsOneWidget);

    expect(find.text('Sword'), findsOneWidget);
    expect(find.text('Shield'), findsOneWidget);
  });
}
