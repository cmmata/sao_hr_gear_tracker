import 'package:flutter_test/flutter_test.dart';
import 'package:sao_gear_tracker/providers/data_provider.dart';

void main() {
  test('isVersionGreater correctly compares versions', () {
    final notifier = DataNotifier();

    // Equal
    expect(notifier.isVersionGreater('1.1.0', '1.1.0'), isFalse);

    // Greater
    expect(notifier.isVersionGreater('1.1.1', '1.1.0'), isTrue);
    expect(notifier.isVersionGreater('1.2.0', '1.1.0'), isTrue);
    expect(notifier.isVersionGreater('2.0.0', '1.1.0'), isTrue);
    expect(notifier.isVersionGreater('1.1.0.1', '1.1.0'), isTrue);

    // Lower
    expect(notifier.isVersionGreater('1.0.9', '1.1.0'), isFalse);
    expect(notifier.isVersionGreater('0.9.0', '1.1.0'), isFalse);
    expect(notifier.isVersionGreater('1.1', '1.1.0'), isFalse);

    // Non-numeric handling (should treat as 0)
    expect(notifier.isVersionGreater('1.1.a', '1.1.0'), isFalse);
    expect(notifier.isVersionGreater('1.1.1', '1.1.a'), isTrue);
  });
}
