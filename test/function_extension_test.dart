import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('void Function() Extensions', () {
    test('invokes one time during duration', () async {
      var value = 0;
      void func() => value++;

      for (var i = 0; i <= 5; i++) {
        func.throttle();
      }
      await Future<void>.delayed(const Duration(seconds: 1));
      func.throttle();
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

    test('invokes the last call after given duration', () async {
      var value = 0;
      void func() => value++;

      for (var i = 0; i <= 5; i++) {
        func.debounce();
      }
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 1);

      for (var i = 0; i <= 5; i++) {
        (() => value++).debounce(
          tag: 'func',
          duration: const Duration(seconds: 2),
        );
      }
      await Future<void>.delayed(const Duration(seconds: 2));
      expect(value, 2);
    });

    test('invokes after duration', () async {
      var value = 0;
      void func() => value++;

      func.delayed();
      expect(value, 0);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 1);

      func.delayed(duration: const Duration(seconds: 2));
      expect(value, 1);
      await Future<void>.delayed(const Duration(seconds: 2));
      expect(value, 2);

      func.delayed().cancel();
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(value, 2);
    });

    test('invokes periodically', () async {
      var value = 0;
      void func() => value++;
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
      void func() => value++;
      func.callWhen(predicate: value != 0);
      expect(value, 0);
      func.callWhen(predicate: value == 0);
      expect(value, 1);
    });
  });
}
