import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Int Extensions', () {
    test('returns all digits', () {
      expect(2022.digits, [2, 0, 2, 2]);
      expect((-12).digits, [1, 2]);
      expect(0.digits, [0]);
    });

    test('returns value in zero case', () {
      final value = 2022.ifZero(2);
      expect(value, isA<int>());
      expect(value, 2022);
      expect(0.ifZero(2022), 2022);
    });

    test('returns int which consists of the first [n] digits', () {
      expect(2022.first(2), 20);
      expect((-12).first(1), 1);
      expect(() => 2020.first(5), throwsRangeError);
    });

    test('returns int which consists of the last [n] digits', () {
      expect(2022.last(2), 22);
      expect(2022.last(3), 22);
      expect((-12).last(1), 2);
      expect(() => 2020.last(5), throwsRangeError);
    });

    test('returns index string-representation', () {
      expect(202.toIndex(4), '0202');
      expect(2022.toIndex(4), '2022');
      expect(12345.toIndex(3), '12345');
      expect(() => (-2).toIndex(3), throwsArgumentError);
    });
  });

  group('Double Extensions', () {
    test('returns the real part', () {
      expect(29.07.real, 29);
      expect(0.01.real, 0);
      expect(-19.89.real, -19);
    });

    test('returns the fractional part', () {
      expect(29.07.fractional, 0.07);
      expect(0.01.fractional, 0.01);
      expect(-19.89.fractional, -0.89);
      expect(0.0.fractional, 0.0);
      expect(-0.0.fractional, -0.0);
      expect(() => double.infinity.fractional, throwsArgumentError);
      expect(() => double.nan.fractional, throwsArgumentError);
    });

    test('returns value in zero case', () {
      final value = 2022.2.ifZero(2);
      expect(value, isA<double>());
      expect(value, 2022.2);
      expect(0.0.ifZero(2022.2), 2022.2);
    });

    test('returns closest double with digits precision', () {
      expect(29.07.roundUp(0), 29);
      expect(0.0155.roundUp(5), 0.0155);
      expect(-19.89.roundUp(1), -19.9);
      expect(-19.89.roundUp(0), -20);
      expect(17.89776.roundUp(4), 17.8978);
      expect(17.89776.roundUp(0), 18);
    });
  });

  group('Num Extensions', () {
    test('returns the length', () {
      expect(29.07.length, 5);
      expect((-19.89).length, 6);
      expect(2022.length, 4);
    });

    test('checks if int', () {
      expect(29.07.isInt, false);
      expect(2022.isInt, true);
      expect(20.0.isInt, true);
    });

    test('checks if double', () {
      expect(29.07.isDouble, true);
      expect(2022.isDouble, false);
      expect(20.0.isDouble, false);
    });

    test('returns value in zero case', () {
      const num zero = 0;
      const num number = 2022.2;
      final value = number.ifZero(2);
      expect(value, isA<num>());
      expect(value, 2022.2);
      expect(zero.ifZero(2022.2), 2022.2);
    });

    test('returns actual value', () {
      expect(29.07.toActual(), 29.07);
      expect((-2022).toActual(), -2022);
      expect(20.0.toActual(), 20);
    });

    test('returns zero if null', () {
      expect(null.orZero, 0);
      expect((-2022).orZero, -2022);
      expect(20.0.orZero, 20.0);
    });
  });
}
