import 'package:isar_community/isar.dart';
import 'character.dart';
import 'gear.dart';

part 'player.g.dart';

@collection
class Player {
  Player();

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

  /// Deprecated, use new gear slots. Kept for Isar ID stability.
  Gear earrings = Gear();

  Gear zAmulet = Gear();
  Gear zFinger = Gear();
  Gear zNeck = Gear();
  Gear zWaist = Gear();
  Gear zWrist = Gear();

  @ignore
  Gear get amulet => zAmulet;
  set amulet(Gear v) => zAmulet = v;

  @ignore
  Gear get finger => zFinger;
  set finger(Gear v) => zFinger = v;

  @ignore
  Gear get neck => zNeck;
  set neck(Gear v) => zNeck = v;

  @ignore
  Gear get waist => zWaist;
  set waist(Gear v) => zWaist = v;

  @ignore
  Gear get wrist => zWrist;
  set wrist(Gear v) => zWrist = v;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sword': sword.toMap(),
      'rapier': rapier.toMap(),
      'dagger': dagger.toMap(),
      'mace': mace.toMap(),
      'axe': axe.toMap(),
      'scimitar': scimitar.toMap(),
      'katana': katana.toMap(),
      'twoHandedSword': twoHandedSword.toMap(),
      'spear': spear.toMap(),
      'shield': shield.toMap(),
      'helmet': helmet.toMap(),
      'armor': armor.toMap(),
      'boots': boots.toMap(),
      'amulet': amulet.toMap(),
      'finger': finger.toMap(),
      'neck': neck.toMap(),
      'waist': waist.toMap(),
      'wrist': wrist.toMap(),
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player()
      ..id = map['id'] as int? ?? 0
      ..sword = Weapon.fromMap(map['sword'] as Map<String, dynamic>? ?? {})
      ..rapier = Weapon.fromMap(map['rapier'] as Map<String, dynamic>? ?? {})
      ..dagger = Weapon.fromMap(map['dagger'] as Map<String, dynamic>? ?? {})
      ..mace = Weapon.fromMap(map['mace'] as Map<String, dynamic>? ?? {})
      ..axe = Weapon.fromMap(map['axe'] as Map<String, dynamic>? ?? {})
      ..scimitar = Weapon.fromMap(
        map['scimitar'] as Map<String, dynamic>? ?? {},
      )
      ..katana = Weapon.fromMap(map['katana'] as Map<String, dynamic>? ?? {})
      ..twoHandedSword = Weapon.fromMap(
        map['twoHandedSword'] as Map<String, dynamic>? ?? {},
      )
      ..spear = Weapon.fromMap(map['spear'] as Map<String, dynamic>? ?? {})
      ..shield = Gear.fromMap(map['shield'] as Map<String, dynamic>? ?? {})
      ..helmet = Gear.fromMap(map['helmet'] as Map<String, dynamic>? ?? {})
      ..armor = Gear.fromMap(map['armor'] as Map<String, dynamic>? ?? {})
      ..boots = Gear.fromMap(map['boots'] as Map<String, dynamic>? ?? {})
      ..amulet = Gear.fromMap(map['amulet'] as Map<String, dynamic>? ?? {})
      ..finger = Gear.fromMap(map['finger'] as Map<String, dynamic>? ?? {})
      ..neck = Gear.fromMap(map['neck'] as Map<String, dynamic>? ?? {})
      ..waist = Gear.fromMap(map['waist'] as Map<String, dynamic>? ?? {})
      ..wrist = Gear.fromMap(map['wrist'] as Map<String, dynamic>? ?? {});
  }
}
