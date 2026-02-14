import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sao_gear_tracker/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We need to wrap usage of ConsumerWidget (SaoGearTrackerApp) in a ProviderScope even if it doesn't use providers yet?
    // Actually SaoGearTrackerApp uses ConsumerWidget and ref.watch(isarProvider).
    // So we definitely need ProviderScope.
    await tester.pumpWidget(const ProviderScope(child: SaoGearTrackerApp()));

    // Verify that the app builds and shows loading indicator or error (database might fail in test env).
    // Since we are not mocking isarProvider here yet, it will try to use path_provider which fails in test environment without mocking.
    // However, for a smoke test, we just want to see if it pumps without crashing immediately due to missing classes.

    // Expect to see a CircularProgressIndicator or Error text.
    // Since isarProvider returns a Future, it starts in loading state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
