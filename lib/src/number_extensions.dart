import 'collection_extensions.dart';
import 'string_extensions.dart';

/// Extensions for [int].
extension IntX on int {
  /// Returns all digits of this [int].
  List<int> get digits => '${abs()}'.charArray.mapToList(int.parse);

  /// Returns this [int] if it's not zero,
  /// otherwise returns [value].
  int ifZero(int value) => this == 0 ? value : this;

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

  /// Converts this [int] to [Duration] in days.
  Duration toDays() => Duration(days: this);

  /// Converts this [int] to [Duration] in hours.
  Duration toHours() => Duration(hours: this);

  /// Converts this [int] to [Duration] in minutes.
  Duration toMinutes() => Duration(minutes: this);

  /// Converts this [int] to [Duration] in seconds.
  Duration toSeconds() => Duration(seconds: this);

  /// Converts this [int] to [Duration] in milliseconds.
  Duration toMilliseconds() => Duration(milliseconds: this);

  /// Converts this [int] to [Duration] in microseconds.
  Duration toMicroseconds() => Duration(microseconds: this);
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

  /// Returns this [double] if it's not zero,
  /// otherwise returns [value].
  double ifZero(double value) => this == 0 ? value : this;

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

  /// Returns this [num] if it's not zero,
  /// otherwise returns [value].
  num ifZero(num value) => this == 0 ? value : this;

  /// Returns a [String] that prepends [padding] on the left of this [int]
  /// if it is shorter than [width].
  String padLeft(int width, [String padding = '0']) =>
      '$this'.padLeft(width, padding);

  /// Returns a [String] that appends [padding] on the right of this [int]
  /// if it is shorter than [width].
  String padRight(int width, [String padding = '0']) =>
      '$this'.padRight(width, padding);

  /// Returns true if this [num] is within the given range [start]..[end].
  ///
  /// Range is closed if [startInclusive] and [endInclusive] are true,
  /// otherwise - open.
  bool isBetween(
    num start,
    num end, {
    bool startInclusive = false,
    bool endInclusive = false,
  }) {
    if (start >= end) {
      throw ArgumentError('Invalid range: $start..$end');
    }
    if (startInclusive && endInclusive) {
      return start <= this && this <= end;
    } else if (startInclusive) {
      return start <= this && this < end;
    } else if (endInclusive) {
      return start < this && this <= end;
    } else {
      return start < this && this < end;
    }
  }

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
