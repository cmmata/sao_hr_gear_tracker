int parseStat(String? text) {
  final val = int.tryParse(text ?? '') ?? 0;
  return val < 0 ? 0 : val;
}
