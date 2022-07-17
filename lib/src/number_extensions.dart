import 'collection_extensions.dart';
import 'string_extensions.dart';

/// Extensions for [int].
extension IntX on int {
  /// Returns all digits of this [int].
  List<int> get digits => '${abs()}'.charArray.mapToList(int.parse);

  /// Returns [int] which consists of the first [n] digits of this [int].
  ///
  /// The parameter [n] must be an integer satisfying:
  /// `1 <= n <= length of this number`.
  int first(int n) {
    final absolute = abs();
    final length = absolute.length;
    RangeError.checkValidRange(1, n, length);
    return int.parse('$absolute'.substring(0, n));
  }

  /// Returns [int] which consists of the last [n] digits of this [int].
  ///
  /// The parameter [n] must be an integer satisfying:
  /// `1 <= n <= length of this number`.
  int last(int n) {
    final absolute = abs();
    final length = absolute.length;
    RangeError.checkValidRange(1, n, length);
    return int.parse('$absolute'.substring(length - n, length));
  }

  /// Returns a string-representation of this [int] that contains
  /// at least [length] digits with leading zeros.
  String toIndex(int length) {
    if (isNegative) throw ArgumentError('$this is negative.');
    return '$this'.padLeft(length, '0');
  }
}

/// Extensions for [double].
extension DoubleX on double {
  /// Returns the real part of this [double].
  int get real => truncate();

  /// Returns the fractional part of this [double].
  double get fractional {
    final parts = '$this'.split('.');
    if (parts.length != 2) throw ArgumentError('Invalid value: $this');
    return double.parse('${isNegative ? '-' : ''}0.${parts[1]}');
  }

  /// Returns closest [double] with [fractionDigits] digits precision
  /// after the decimal point.
  ///
  /// The parameter [fractionDigits] must be an integer satisfying:
  /// `0 <= fractionDigits <= 20`.
  double roundUp(int fractionDigits) =>
      double.parse(toStringAsFixed(fractionDigits));
}

/// Extensions for [num].
extension NumX on num {
  /// Returns the length of this [num].
  int get length => '$this'.length;

  /// Returns true if this [num] is [int].
  bool get isInt => this is int || this == roundToDouble();

  /// Returns true if this [num] is [double].
  bool get isDouble => !isInt;

  /// Truncates this [num] to [int] if this [num] is [int],
  /// otherwise returns this [num].
  num toActual() => isInt ? toInt() : this;
}

/// Extensions for nullable [num].
extension NullableNumX on num? {
  /// Returns zero if this nullable [num] is null,
  /// otherwise returns this [num].
  num get orZero => this ?? 0;
}
