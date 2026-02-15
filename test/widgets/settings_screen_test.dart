import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sao_gear_tracker/screens/settings_screen.dart';

void main() {
  testWidgets('SettingsScreen shows import confirmation dialog with custom style', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SettingsScreen(),
        ),
      ),
    );

    // Find and tap IMPORT DATA button
    final importButton = find.text('IMPORT DATA');
    expect(importButton, findsOneWidget);
    await tester.tap(importButton);
    await tester.pumpAndSettle();

    // Verify dialog content
    expect(find.text('CONFIRM IMPORT'), findsOneWidget);
    expect(find.textContaining('Importing data will overwrite'), findsOneWidget);

    // Verify custom buttons (InkWells with specific child icons/containers)
    // Red Cross Cancel button
    final cancelButton = find.byIcon(Icons.close);

    expect(cancelButton, findsOneWidget);

    // Check if it's a Dialog, not AlertDialog
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);
  });
}
