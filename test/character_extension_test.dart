import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/models/character.dart';
import 'package:sao_gear_tracker/models/character_extension.dart';
import 'package:sao_gear_tracker/models/gear.dart';

void main() {
  group('CharacterStats extension tests', () {
    group('attack', () {
      test('returns weapon statValue when weapon is present', () {
        final character = Character()..weapon = (Weapon()..statValue = 100);
        expect(character.attack, 100);
      });

      test('returns 0 when weapon is null', () {
        final character = Character()..weapon = null;
        expect(character.attack, 0);
      });
    });

    group('totalDefense', () {
      test('returns sum of all gear statValues when all are present', () {
        final character = Character()
          ..helmet = (Gear()..statValue = 10)
          ..armor = (Gear()..statValue = 20)
          ..boots = (Gear()..statValue = 5)
          ..shield = (Gear()..statValue = 15);

        expect(character.totalDefense, 10 + 20 + 5 + 15);
      });

      test('returns sum of present gear statValues when some are null', () {
        final character = Character()
          ..helmet = (Gear()..statValue = 10)
          ..boots = (Gear()..statValue = 5);

        expect(character.totalDefense, 15);
      });

      test('returns 0 when all gear pieces are null', () {
        final character = Character()
          ..helmet = null
          ..armor = null
          ..boots = null
          ..shield = null;

        expect(character.totalDefense, 0);
      });
    });
  });
}
