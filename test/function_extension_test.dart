import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('void Function() Extensions', () {
    test('invokes one time during duration', () async {
      var value = 0;
      final func1 = () => value++;

      for (var i = 0; i <= 5; i++) {
        func1.throttle();
      }
      await Future<void>.delayed(const Duration(seconds: 1));
      func1.throttle();
      expect(value, 2);

      for (var i = 0; i <= 5; i++) {
        (() => value++).throttle(
          tag: 'func',
          duration: const Duration(seconds: 2),
        );
      }
      await Future<void>.delayed(const Duration(seconds: 2));
      (() => value++).throttle(tag: 'func');
      expect(value, 4);
    });

    test('invokes after duration', () async {
      var value = 0;
      final func = () => value++;

      func.delayed();
      expect(value, 0);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 1);

      func.delayed(duration: const Duration(seconds: 2));
      expect(value, 1);
      await Future<void>.delayed(const Duration(seconds: 2));
      expect(value, 2);

      final timer = func.delayed();
      timer.cancel();
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 2);
    });

    test('invokes periodically', () async {
      var value = 0;
      final func = () => value++;
      final timer = func.periodic();
      expect(value, 0);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 1);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 2);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 3);
      timer.cancel();
    });

    test('invokes by predicate', () async {
      var value = 0;
      final func = () => value++;
      func.callWhen(predicate: value != 0);
      expect(value, 0);
      func.callWhen(predicate: value == 0);
      expect(value, 1);
    });

    test('returns function or null', () async {
      var value = 0;
      final func = () => value++;
      expect(func.orNull(predicate: value != 0), isNull);
      func();
      expect(func.orNull(predicate: value != 0), isNotNull);
      expect(func.orNull(predicate: value != 0), isA<void Function()>());
    });
  });
}
