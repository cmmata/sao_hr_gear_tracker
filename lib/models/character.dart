import 'package:isar/isar.dart';
import 'gear.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  String? name;

  @enumerated
  WeaponType weaponType = WeaponType.sword;

  Gear? weapon;

  Gear? helmet;

  Gear? armor;

  Gear? boots;
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
  shield, // Technically off-hand
}
