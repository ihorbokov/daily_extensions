import 'dart:math';

/// Extensions for [List].
extension ListX<T> on List<T> {
  /// Returns a random element from this [List].
  T get random => this[Random().nextInt(length)];

  /// Returns this [List] if it's not empty,
  /// otherwise returns [value].
  List<T> ifEmpty(List<T> value) => isEmpty ? value : this;

  /// Moves the [element] to the specified [index] position in this [List].
  void move(T element, int index) {
    RangeError.checkValidIndex(index, this, 'index');
    if (remove(element)) insert(index, element);
  }

  /// Splits elements of this [List] into chunks of [size] length.
  Iterable<List<T>> split(int size) sync* {
    if (size == 0) throw ArgumentError('Invalid size: $size');
    for (var index = 0; index < length; index += size) {
      final chunkSize = index + size;
      yield sublist(index, chunkSize > length ? length : chunkSize);
    }
  }
}

/// Extensions for [Set].
extension SetX<T> on Set<T> {
  /// Returns this [Set] if it's not empty,
  /// otherwise returns [value].
  Set<T> ifEmpty(Set<T> value) => isEmpty ? value : this;
}

/// Extensions for [Iterable].
extension IterableX<T> on Iterable<T> {
  /// Returns true if length of this [Iterable] is 1.
  bool get hasOne => length == 1;

  /// Whether length of this [Iterable] is even.
  bool get isLengthEven => length.isEven;

  /// Whether length of this [Iterable] is odd.
  bool get isLengthOdd => length.isOdd;

  /// Returns this [Iterable] if it's not empty,
  /// otherwise returns [value].
  Iterable<T> ifEmpty(Iterable<T> value) => isEmpty ? value : this;

  /// Creates a fixed-length [List] containing the elements of this [Iterable].
  List<T> toFixedList() => toList(growable: false);

  /// Creates an unmodifiable [List] containing the elements of this [Iterable].
  List<T> toUnmodifiableList() => List.unmodifiable(this);

  /// Creates an unmodifiable [Set] containing the elements of this [Iterable].
  Set<T> toUnmodifiableSet() => Set.unmodifiable(this);

  /// Creates a [List] with all elements of this [Iterable]
  /// modified by [toElement].
  ///
  /// The [List] is fixed-length if [growable] is false.
  List<R> mapToList<R>(R Function(T e) toElement, {bool growable = false}) =>
      map<R>(toElement).toList(growable: growable);

  /// Creates a [List] with all elements of this [Iterable] that satisfy
  /// the predicate [test] and modified by [toElement].
  ///
  /// The [List] is fixed-length if [growable] is false.
  List<R> mapToListWhere<R>(
    R Function(T e) toElement,
    bool Function(T e) test, {
    bool growable = false,
  }) {
    final list = <R>[];
    for (final element in this) {
      if (test(element)) list.add(toElement(element));
    }
    return growable ? list : list.toFixedList();
  }

  /// Creates a [Set] with all elements of this [Iterable]
  /// modified by [toElement].
  ///
  /// The [Set] is modifiable if [modifiable] is true.
  Set<R> mapToSet<R>(R Function(T e) toElement, {bool modifiable = false}) {
    return modifiable
        ? map<R>(toElement).toSet()
        : map<R>(toElement).toUnmodifiableSet();
  }

  /// Creates a [Set] with all elements of this [Iterable] that satisfy
  /// the predicate [test] and modified by [toElement].
  ///
  /// The [Set] is modifiable if [modifiable] is true.
  Set<R> mapToSetWhere<R>(
    R Function(T e) toElement,
    bool Function(T e) test, {
    bool modifiable = false,
  }) {
    final set = <R>{};
    for (final element in this) {
      if (test(element)) set.add(toElement(element));
    }
    return modifiable ? set : set.toUnmodifiableSet();
  }

  /// Returns the number of elements matching the given [test] predicate.
  int count(bool Function(T element) test) => where(test).length;
}

/// Extensions for [Map].
extension MapX<K, V> on Map<K, V> {
  /// Returns true if length of this [Map] is 1.
  bool get hasOne => length == 1;

  /// Whether length of this [Map] is even.
  bool get isLengthEven => length.isEven;

  /// Whether length of this [Map] is odd.
  bool get isLengthOdd => length.isOdd;

  /// Returns this [Map] if it's not empty,
  /// otherwise returns [value].
  Map<K, V> ifEmpty(Map<K, V> value) => isEmpty ? value : this;

  /// Creates an unmodifiable [Map] containing the entries of this [Map].
  Map<K, V> toUnmodifiableMap() => Map.unmodifiable(this);
}

/// Extensions for nullable [List].
extension NullableListX<T> on List<T>? {
  /// Creates empty [List] if this nullable [List] is null,
  /// otherwise returns this [List].
  List<T> get orEmpty => this ?? [];
}

/// Extensions for nullable [Set].
extension NullableSetX<T> on Set<T>? {
  /// Creates empty [Set] if this nullable [Set] is null,
  /// otherwise returns this [Set].
  Set<T> get orEmpty => this ?? {};
}

/// Extensions for nullable [Iterable].
extension NullableIterableX<T> on Iterable<T>? {
  /// Returns true if this nullable [Iterable] is either null or empty.
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  /// Creates empty [Iterable] if this nullable [Iterable] is null,
  /// otherwise returns this [Iterable].
  Iterable<T> get orEmpty => this ?? const Iterable.empty();
}

/// Extensions for nullable [Map].
extension NullableMapX<K, V> on Map<K, V>? {
  /// Returns true if this nullable [Map] is either null or empty.
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  /// Creates empty [Map] if this nullable [Map] is null,
  /// otherwise returns this [Map].
  Map<K, V> get orEmpty => this ?? {};
}
