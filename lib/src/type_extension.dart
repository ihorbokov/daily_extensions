/// Extensions for [T].
extension TypeX<T> on T {
  /// Returns this if given [predicate] is true,
  /// otherwise returns null.
  T? orNull({required bool predicate}) => predicate ? this : null;
}
