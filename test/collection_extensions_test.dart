import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('List Extensions', () {
    final testList = <int>[];
    const testEmptyList = <int>[];
    const List<int>? testNullableList = null;

    setUp(() => testList.addAll([1, 2, 3, 4, 5]));
    tearDown(testList.clear);

    test('returns a random element', () {
      final random = testList.random;
      expect(testList.contains(random), isTrue);
      expect(() => testEmptyList.random, throwsRangeError);
    });

    test('returns value in empty case', () {
      final list = testList.ifEmpty([2]);
      expect(list, isA<List>());
      expect(list.toString(), '[1, 2, 3, 4, 5]');
      expect(testEmptyList.ifEmpty(testList).toString(), '[1, 2, 3, 4, 5]');
    });

    test('moves element to the specified position', () {
      testList.move(2, 3);
      expect(testList.toString(), '[1, 3, 4, 2, 5]');
      expect(() => testEmptyList.move(2, 3), throwsRangeError);
    });

    test('splits elements into chunks', () {
      expect(testList.split(2).toString(), '([1, 2], [3, 4], [5])');
      expect(testEmptyList.split(1).toString(), '()');
      expect(() => testList.split(0), throwsArgumentError);
    });

    test('creates empty modifiable list if current is null', () {
      final list = testNullableList.orEmpty;
      expect(list, isA<List>());
      expect(list.toString(), '[]');
      expect((list..add(1)).toString(), '[1]');
    });
  });

  group('Set Extensions', () {
    final testSet = {1, 2, 3, 4, 5};
    const testEmptySet = <int>{};
    const Set<int>? testNullableSet = null;

    test('returns value in empty case', () {
      final set = testSet.ifEmpty({2});
      expect(set, isA<Set>());
      expect(set.toString(), '{1, 2, 3, 4, 5}');
      expect(testEmptySet.ifEmpty(testSet).toString(), '{1, 2, 3, 4, 5}');
    });

    test('creates empty modifiable set if current is null', () {
      final set = testNullableSet.orEmpty;
      expect(set, isA<Set>());
      expect(set.toString(), '{}');
      expect((set..add(1)).toString(), '{1}');
    });
  });

  group('Iterable Extensions', () {
    final testIterable = Iterable.generate(5, (index) => index + 1);
    const testEmptyIterable = Iterable<int>.empty();
    const Iterable<int>? testNullableIterable = null;

    test('returns value in empty case', () {
      final iterable = testIterable.ifEmpty([2]);
      expect(iterable, isA<Iterable>());
      expect(iterable.toString(), '(1, 2, 3, 4, 5)');
      expect(
        testEmptyIterable.ifEmpty(testIterable).toString(),
        '(1, 2, 3, 4, 5)',
      );
    });

    test('creates fixed-length list', () {
      final list = testIterable.toFixedList();
      expect(list, isA<List>());
      expect(() => list.add(6), throwsUnsupportedError);
      expect(() => list.remove(5), throwsUnsupportedError);
      list[1] = 1;
      expect(list.toString(), '[1, 1, 3, 4, 5]');
    });

    test('creates unmodifiable list', () {
      final list = testIterable.toUnmodifiableList();
      expect(list, isA<List>());
      expect(() => list.add(6), throwsUnsupportedError);
      expect(() => list.remove(5), throwsUnsupportedError);
      expect(() => list[1] = 1, throwsUnsupportedError);
    });

    test('creates unmodifiable set', () {
      final set = testIterable.toUnmodifiableSet();
      expect(set, isA<Set>());
      expect(() => set.add(6), throwsUnsupportedError);
      expect(() => set.remove(5), throwsUnsupportedError);
    });

    test('maps iterable to list', () {
      final list = testIterable.mapToList((element) => element * element);
      expect(list, isA<List>());
      expect(list.toString(), '[1, 4, 9, 16, 25]');
    });

    test('counts of elements matching the predicate', () {
      expect(testIterable.count((element) => element > 2), 3);
    });

    test('creates empty iterable if current is null', () {
      final iterable = testNullableIterable.orEmpty;
      expect(iterable, isA<Iterable>());
      expect(iterable.toString(), '()');
    });

    test('checks nullable operators', () {
      expect(testIterable.isEmptyOrNull, isFalse);
      expect(testEmptyIterable.isEmptyOrNull, isTrue);
      expect(testNullableIterable.isEmptyOrNull, isTrue);
    });
  });

  group('Map Extensions', () {
    final testMap = {2022: 'Mary'};
    const testEmptyMap = <int, String>{};
    const Map<int, String>? testNullableMap = null;

    test('returns value in empty case', () {
      final map = testMap.ifEmpty({1: 'Hello'});
      expect(map, isA<Map>());
      expect(map.toString(), '{2022: Mary}');
      expect(testEmptyMap.ifEmpty(testMap).toString(), '{2022: Mary}');
    });

    test('creates empty modifiable map if current is null', () {
      final map = testNullableMap.orEmpty;
      expect(map, isA<Map>());
      expect(map.toString(), '{}');
      expect((map..[2022] = 'Mary').toString(), '{2022: Mary}');
    });

    test('checks nullable operators', () {
      expect(testMap.isEmptyOrNull, isFalse);
      expect(testEmptyMap.isEmptyOrNull, isTrue);
      expect(testNullableMap.isEmptyOrNull, isTrue);
    });
  });
}
