import 'package:isar_community/isar.dart';
import 'gear.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  @Index()
  String? name;

  @enumerated
  WeaponType weaponType = WeaponType.sword;

  Weapon? weapon;

  Gear? shield;

  Gear? helmet;

  Gear? armor;

  Gear? boots;

  Gear? earrings;

  int affection = 0;

  int bedtimes = 0;
}

@embedded
class Weapon {
  /// Attack value
  int statValue = 0;

  /// 1 or 2 hands
  int hands = 1;

  String? extraStats;
}

enum WeaponType {
  sword,
  rapier,
  dagger,
  mace,
  axe,
  scimitar,
  katana,
  twoHandedSword,
  spear,
}
