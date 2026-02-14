import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/character.dart';
import '../models/player.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [CharacterSchema, PlayerSchema],
    directory: dir.path,
  );
}
