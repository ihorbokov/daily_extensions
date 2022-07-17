import 'dart:math';

/// Extensions for [List].
extension ListX<T> on List<T> {
  /// Returns a random element from this [List].
  T get random => this[Random().nextInt(length)];

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

/// Extensions for [Iterable].
extension IterableX<T> on Iterable<T> {
  /// Creates a fixed-length [List] containing the elements of this [Iterable].
  List<T> toFixedList() => toList(growable: false);

  /// Creates an unmodifiable [List] containing the elements of this [Iterable].
  List<T> toUnmodifiableList() => List.unmodifiable(this);

  /// Creates an unmodifiable [Set] containing the elements of this [Iterable].
  Set<T> toUnmodifiableSet() => Set.unmodifiable(this);

  /// Creates a [List] based on the current elements of this [Iterable]
  /// modified by [toElement].
  ///
  /// The [List] is fixed-length if [growable] is false.
  List<R> mapToList<R>(R Function(T e) toElement, {bool growable = false}) =>
      map<R>(toElement).toList(growable: growable);

  /// Returns the number of elements matching the given [test] predicate.
  int count(bool Function(T element) test) => where(test).length;
}

/// Extensions for [Map].
extension MapX<K, V> on Map<K, V> {
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
