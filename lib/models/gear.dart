import 'package:isar/isar.dart';

part 'gear.g.dart';

@embedded
class Gear {
  String? name;

  /// Attack for weapons, Defense for armor parts
  int statValue = 0;

  String? extraStats;
}
