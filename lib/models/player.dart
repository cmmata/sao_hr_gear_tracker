import 'package:isar/isar.dart';
import 'character.dart';
import 'gear.dart';

part 'player.g.dart';

@collection
class Player {
  Id id = Isar.autoIncrement;

  // Weapons - one for each WeaponType
  Weapon? sword;
  Weapon? rapier;
  Weapon? dagger;
  Weapon? mace;
  Weapon? axe;
  Weapon? scimitar;
  Weapon? katana;
  Weapon? twoHandedSword;
  Weapon? spear;

  // Gear - one for each slot
  Gear? shield;
  Gear? helmet;
  Gear? armor;
  Gear? boots;
  Gear? earrings;
}

enum GearSlot {
  shield,
  helmet,
  armor,
  boots,
  earrings,
}
