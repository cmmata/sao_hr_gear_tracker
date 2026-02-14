import '../models/character.dart';

extension CharacterStats on Character {
  int get totalDefense =>
      (helmet?.statValue ?? 0) +
      (armor?.statValue ?? 0) +
      (boots?.statValue ?? 0) +
      (shield?.statValue ?? 0) +
      (earrings?.statValue ?? 0);

  int get attack => weapon?.statValue ?? 0;
}
