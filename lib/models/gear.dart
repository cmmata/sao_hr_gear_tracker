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
    int statVal = map['statValue'] as int? ?? 0;
    if (statVal < 0) statVal = 0;

    String? rawExtra = map['extraStats'] as String?;
    if (rawExtra != null && rawExtra.length > 100) {
      rawExtra = rawExtra.substring(0, 100);
    }

    return Gear()
      ..statValue = statVal
      ..extraStats = rawExtra;
  }
}
