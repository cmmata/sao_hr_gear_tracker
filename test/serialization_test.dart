import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/models/gear.dart';
import 'package:sao_gear_tracker/models/player.dart';

void main() {
  group('Model Serialization Tests', () {
    test('Gear toMap and fromMap', () {
      final gear = Gear()
        ..statValue = 10
        ..extraStats = 'STR+5';

      final map = gear.toMap();
      final fromMap = Gear.fromMap(map);

      expect(fromMap.statValue, 10);
      expect(fromMap.extraStats, 'STR+5');
    });

    test('Weapon toMap and fromMap', () {
      final weapon = Weapon()
        ..statValue = 100
        ..hands = 2
        ..extraStats = 'AGI+10';

      final map = weapon.toMap();
      final fromMap = Weapon.fromMap(map);

      expect(fromMap.statValue, 100);
      expect(fromMap.hands, 2);
      expect(fromMap.extraStats, 'AGI+10');
    });

    test('Character toMap and fromMap', () {
      final char = Character()
        ..id = 123
        ..name = 'Kirito'
        ..weaponType = WeaponType.twoHandedSword
        ..weapon = (Weapon()..statValue = 150)
        ..armor = (Gear()..statValue = 50)
        ..affection = 5
        ..bedtimes = 2
        ..allConversationsSeen = true;

      final map = char.toMap();
      final fromMap = Character.fromMap(map);

      expect(fromMap.id, 123);
      expect(fromMap.name, 'Kirito');
      expect(fromMap.weaponType, WeaponType.twoHandedSword);
      expect(fromMap.weapon?.statValue, 150);
      expect(fromMap.armor?.statValue, 50);
      expect(fromMap.affection, 5);
      expect(fromMap.bedtimes, 2);
      expect(fromMap.allConversationsSeen, true);
    });

    test('Player toMap and fromMap', () {
      final player = Player()
        ..sword = (Weapon()..statValue = 200)
        ..shield = (Gear()..statValue = 80);

      final map = player.toMap();
      final fromMap = Player.fromMap(map);

      expect(fromMap.sword.statValue, 200);
      expect(fromMap.shield.statValue, 80);
    });

    test('SkillFusion serialization', () {
      final fusion = SkillFusion()
        ..type = SkillFusionType.tank
        ..level = 3;

      final map = fusion.toMap();
      final fromMap = SkillFusion.fromMap(map);

      expect(fromMap.type, SkillFusionType.tank);
      expect(fromMap.level, 3);
    });

    test('Character with SkillFusions serialization', () {
      final char = Character()
        ..name = 'Asuna'
        ..skillFusions = [
          SkillFusion()
            ..type = SkillFusionType.healer
            ..level = 5,
          SkillFusion()
            ..type = SkillFusionType.attacker
            ..level = 2,
        ];

      final map = char.toMap();
      final fromMap = Character.fromMap(map);

      expect(fromMap.skillFusions.length, 2);
      expect(fromMap.skillFusions[0].type, SkillFusionType.healer);
      expect(fromMap.skillFusions[0].level, 5);
      expect(fromMap.skillFusions[1].type, SkillFusionType.attacker);
      expect(fromMap.skillFusions[1].level, 2);
    });

    test('Player with Active Fusion serialization', () {
      final player = Player()
        ..activeFusionCharacterId = 456
        ..activeFusionType = SkillFusionType.buffer;

      final map = player.toMap();
      final fromMap = Player.fromMap(map);

      expect(fromMap.activeFusionCharacterId, 456);
      expect(fromMap.activeFusionType, SkillFusionType.buffer);
    });

    test('Player fromMap with missing keys handles defaults', () {
      final map = {
        'id': 0,
        'sword': {'statValue': 50},
        // other keys missing
      };
      final fromMap = Player.fromMap(map);

      expect(fromMap.id, 0);
      expect(fromMap.sword.statValue, 50);
      expect(fromMap.rapier.statValue, 0); // Default
      expect(fromMap.shield.statValue, 0); // Default
    });
  });
}
