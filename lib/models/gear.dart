import 'package:isar_community/isar.dart';

part 'gear.g.dart';

@embedded
class Gear {
  Gear();

  /// Defense value
  int statValue = 0;

  String? extraStats;

  Map<String, dynamic> toMap() {
    return {'statValue': statValue, 'extraStats': extraStats};
  }

  factory Gear.fromMap(Map<String, dynamic> map) {
    return Gear()
      ..statValue = map['statValue'] as int? ?? 0
      ..extraStats = map['extraStats'] as String?;
  }
}
