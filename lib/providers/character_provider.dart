import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import 'database_provider.dart';

part 'character_provider.g.dart';

@riverpod
Stream<List<Character>> characters(Ref ref) async* {
  final isar = await ref.watch(isarProvider.future);
  yield* isar.characters.where().sortByName().watch(fireImmediately: true);
}

@riverpod
Stream<Character?> character(Ref ref, int id) async* {
  final isar = await ref.watch(isarProvider.future);
  yield* isar.characters.watchObject(id, fireImmediately: true);
}

@riverpod
class CharacterController extends _$CharacterController {
  @override
  FutureOr<void> build() {}

  Future<void> addCharacter(Character character) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      await isar.characters.put(character);
    });
  }

  Future<void> deleteCharacter(Id id) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      await isar.characters.delete(id);
    });
  }

  Future<void> updateCharacter(Character character) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      await isar.characters.put(character);
    });
  }
}
