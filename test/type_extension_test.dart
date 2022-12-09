import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('T Extensions', () {
    test('returns object or null', () async {
      var value = 0;
      final func = () => value++;
      expect(9.orNull(predicate: value != 0), isNull);
      expect('Hello'.orNull(predicate: value != 0), isNull);
      expect(func.orNull(predicate: value != 0), isNull);
      func();
      expect(9.orNull(predicate: value != 0), 9);
      expect(9.orNull(predicate: value != 0), isNotNull);
      expect('Hello'.orNull(predicate: value != 0), 'Hello');
      expect('Hello'.orNull(predicate: value != 0), isNotNull);
      expect(func.orNull(predicate: value != 0), func);
      expect(func.orNull(predicate: value != 0), isA<void Function()>());
    });
  });
}
