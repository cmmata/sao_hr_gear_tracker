import 'package:isar_community/isar.dart';
import 'gear.dart';

part 'character.g.dart';

@collection
class Character {
  Character();

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

  int affection = 0;

  int bedtimes = 0;

  bool zAllConversationsSeen = false;

  @ignore
  bool get allConversationsSeen => zAllConversationsSeen;
  set allConversationsSeen(bool value) => zAllConversationsSeen = value;

  Map<String, dynamic> toMap() {
    return {
      'id': id == Isar.autoIncrement ? null : id,
      'name': name,
      'weaponType': weaponType.name,
      'weapon': weapon?.toMap(),
      'shield': shield?.toMap(),
      'helmet': helmet?.toMap(),
      'armor': armor?.toMap(),
      'boots': boots?.toMap(),
      'affection': affection,
      'bedtimes': bedtimes,
      'allConversationsSeen': zAllConversationsSeen,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    final character = Character()
      ..name = map['name'] as String?
      ..weaponType = WeaponType.values.firstWhere(
        (e) => e.name == map['weaponType'],
        orElse: () => WeaponType.sword,
      )
      ..weapon = map['weapon'] != null
          ? Weapon.fromMap(map['weapon'] as Map<String, dynamic>)
          : null
      ..shield = map['shield'] != null
          ? Gear.fromMap(map['shield'] as Map<String, dynamic>)
          : null
      ..helmet = map['helmet'] != null
          ? Gear.fromMap(map['helmet'] as Map<String, dynamic>)
          : null
      ..armor = map['armor'] != null
          ? Gear.fromMap(map['armor'] as Map<String, dynamic>)
          : null
      ..boots = map['boots'] != null
          ? Gear.fromMap(map['boots'] as Map<String, dynamic>)
          : null
      ..affection = map['affection'] as int? ?? 0
      ..bedtimes = map['bedtimes'] as int? ?? 0
      ..allConversationsSeen = map['allConversationsSeen'] as bool? ?? false;

    if (map['id'] != null) {
      character.id = map['id'] as int;
    }

    return character;
  }
}

@embedded
class Weapon {
  Weapon();

  /// Attack value
  int statValue = 0;

  /// 1 or 2 hands
  int hands = 1;

  String? extraStats;

  Map<String, dynamic> toMap() {
    return {'statValue': statValue, 'hands': hands, 'extraStats': extraStats};
  }

  factory Weapon.fromMap(Map<String, dynamic> map) {
    return Weapon()
      ..statValue = map['statValue'] as int? ?? 0
      ..hands = map['hands'] as int? ?? 1
      ..extraStats = map['extraStats'] as String?;
  }
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
