import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';
import 'database_provider.dart';
import '../models/player.dart';
import '../models/character.dart';
import '../models/gear.dart';

part 'player_provider.g.dart';

@riverpod
Stream<Player?> player(PlayerRef ref) async* {
  final isar = await ref.watch(isarProvider.future);

  // Ensure player exists
  final count = await isar.players.count();
  if (count == 0) {
    final newPlayer = Player()
      ..sword = (Weapon()..statValue = 0)
      ..rapier = (Weapon()..statValue = 0)
      ..dagger = (Weapon()..statValue = 0)
      ..mace = (Weapon()..statValue = 0)
      ..axe = (Weapon()..statValue = 0)
      ..scimitar = (Weapon()..statValue = 0)
      ..katana = (Weapon()..statValue = 0)
      ..twoHandedSword = (Weapon()..statValue = 0)
      ..spear = (Weapon()..statValue = 0)
      ..shield = (Gear()..statValue = 0)
      ..helmet = (Gear()..statValue = 0)
      ..armor = (Gear()..statValue = 0)
      ..boots = (Gear()..statValue = 0)
      ..earrings = (Gear()..statValue = 0);

    await isar.writeTxn(() async {
      await isar.players.put(newPlayer);
    });
  }

  yield* isar.players.where().watch(fireImmediately: true).map((events) {
    if (events.isEmpty) return null;
    return events.first;
  });
}

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<void> build() {}

  Future<void> updateWeapon(WeaponType type, Weapon weapon) async {
    final isar = await ref.read(isarProvider.future);
    final player = await isar.players.where().findFirst();
    if (player == null) return;

    await isar.writeTxn(() async {
      switch (type) {
        case WeaponType.sword:
          player.sword = weapon;
          break;
        case WeaponType.rapier:
          player.rapier = weapon;
          break;
        case WeaponType.dagger:
          player.dagger = weapon;
          break;
        case WeaponType.mace:
          player.mace = weapon;
          break;
        case WeaponType.axe:
          player.axe = weapon;
          break;
        case WeaponType.scimitar:
          player.scimitar = weapon;
          break;
        case WeaponType.katana:
          player.katana = weapon;
          break;
        case WeaponType.twoHandedSword:
          player.twoHandedSword = weapon;
          break;
        case WeaponType.spear:
          player.spear = weapon;
          break;
      }
      await isar.players.put(player);
    });
  }

  Future<void> updateGear(String slot, Gear gear) async {
    final isar = await ref.read(isarProvider.future);
    final player = await isar.players.where().findFirst();
    if (player == null) return;

    await isar.writeTxn(() async {
      switch (slot) {
        case 'Shield':
        case 'shield':
          player.shield = gear;
          break;
        case 'Helmet':
        case 'helmet':
          player.helmet = gear;
          break;
        case 'Armor':
        case 'armor':
          player.armor = gear;
          break;
        case 'Boots':
        case 'boots':
          player.boots = gear;
          break;
        case 'Earrings':
        case 'earrings':
          player.earrings = gear;
          break;
      }
      await isar.players.put(player);
    });
  }
}
