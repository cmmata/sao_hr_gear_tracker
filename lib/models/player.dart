import 'package:isar/isar.dart';
import 'character.dart';
import 'gear.dart';

part 'player.g.dart';

@collection
class Player {
  Id id = Isar.autoIncrement;

  Weapon sword = Weapon();
  Weapon rapier = Weapon();
  Weapon dagger = Weapon();
  Weapon mace = Weapon();
  Weapon axe = Weapon();
  Weapon scimitar = Weapon();
  Weapon katana = Weapon();
  Weapon twoHandedSword = Weapon();
  Weapon spear = Weapon();

  Gear shield = Gear();
  Gear helmet = Gear();
  Gear armor = Gear();
  Gear boots = Gear();
  Gear earrings = Gear();
}
