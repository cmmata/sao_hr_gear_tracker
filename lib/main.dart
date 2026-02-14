import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'screens/main_scaffold.dart';
import 'providers/database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: SaoGearTrackerApp()));
}

class SaoGearTrackerApp extends ConsumerWidget {
  const SaoGearTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize Database
    final isarAsync = ref.watch(isarProvider);

    return MaterialApp(
      title: 'SAO Gear Tracker',
      theme: AppTheme.theme,
      home: isarAsync.when(
        data: (isar) => const MainScaffold(),
        error: (err, stack) =>
            Scaffold(body: Center(child: Text('Error: $err'))),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
