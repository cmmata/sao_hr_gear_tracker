import 'package:isar_community/isar.dart';
import 'character.dart';
import 'gear.dart';

part 'player.g.dart';

@collection
class Player {
  Id id = 0; // Singleton player with fixed ID 0

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
