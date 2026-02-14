import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import 'database_provider.dart';

part 'character_provider.g.dart';

@riverpod
Stream<List<Character>> characters(CharactersRef ref) async* {
  final isar = await ref.watch(isarProvider.future);
  yield* isar.characters.where().sortByName().watch(fireImmediately: true);
}

@riverpod
Stream<Character?> character(CharacterRef ref, int id) async* {
  final isar = await ref.watch(isarProvider.future);
  yield* isar.characters.watchObject(id, fireImmediately: true);
}

@riverpod
class CharacterController extends _$CharacterController {
  @override
  FutureOr<void> build() {}

  Future<void> addCharacter(String name, WeaponType weaponType) async {
    final isar = await ref.read(isarProvider.future);
    final character = Character()
      ..name = name
      ..weaponType = weaponType;

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
