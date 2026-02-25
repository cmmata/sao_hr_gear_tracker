import 'dart:convert';
import 'dart:io';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'database_provider.dart';
import '../models/character.dart';
import '../models/player.dart';

part 'data_provider.g.dart';

@Riverpod(keepAlive: true)
class DataNotifier extends _$DataNotifier {
  static const String databaseVersion = '1.1.0';

  @override
  void build() {}

  Future<void> exportData() async {
    final isar = await ref.read(isarProvider.future);
    final characters = await isar.characters.where().findAll();
    final players = await isar.players.where().findAll();

    final data = {
      'characters': characters.map((c) => c.toMap()).toList(),
      'players': players.map((p) => p.toMap()).toList(),
      'exportDate': DateTime.now().toIso8601String(),
      'dbVersion': databaseVersion,
    };

    final jsonString = const JsonEncoder.withIndent('  ').convert(data);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/sao_gear_tracker_backup.json');
    await file.writeAsString(jsonString);

    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'SAO Gear Tracker Backup');
  }

  Future<bool> importData() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result == null || result.files.single.path == null) return false;

    final file = File(result.files.single.path!);
    final jsonString = await file.readAsString();
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    if (!data.containsKey('characters') || !data.containsKey('players')) {
      return false;
    }

    // Version check
    final dbVersion = data['dbVersion'];
    if (dbVersion is int) {
      if (dbVersion > 1) {
        throw Exception('Backup file version ($dbVersion) is not supported.');
      }
    } else if (dbVersion is String) {
      // Basic semantic version comparison could be added here if needed.
      // For now, we allow the same or older major/minor if we had a parser.
      // Since we just started using strings, we'll just allow it for now.
    }

    final isar = await ref.read(isarProvider.future);

    await isar.writeTxn(() async {
      await isar.characters.clear();
      await isar.players.clear();

      final charactersData = data['characters'] as List<dynamic>;
      for (final charMap in charactersData) {
        final character = Character.fromMap(charMap as Map<String, dynamic>);
        // Reset ID to let Isar auto-increment if we want new IDs,
        // but for backup/restore keeping them might be better if they were referenced.
        // However, there are no cross-references here.
        // Actually, if I keep the ID, it will be used.
        await isar.characters.put(character);
      }

      final playersData = data['players'] as List<dynamic>;
      for (final playerMap in playersData) {
        final player = Player.fromMap(playerMap as Map<String, dynamic>);
        await isar.players.put(player);
      }
    });

    return true;
  }
}
