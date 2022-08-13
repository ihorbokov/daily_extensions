import 'dart:async';

/// Extensions for void [Function].
extension VoidFunctionX on void Function() {
  static final _timers = <String, Timer>{};

  /// Invokes the [Function] one time during given [duration].
  ///
  /// If [tag] isn't defined then [hashCode] will be used
  /// to identify the [Function].
  void throttle({String? tag, Duration duration = const Duration(seconds: 1)}) {
    tag ??= '$hashCode';
    final timer = _timers[tag];
    if (timer == null) {
      _timers[tag] = Timer(
        duration,
        () => _timers.remove(tag),
      );
      this();
    }
  }

  /// Invokes the [Function] after the given [duration] if not
  /// canceled with the [Timer.cancel] function.
  Timer delayed({Duration duration = const Duration(seconds: 1)}) =>
      Timer(duration, this);

  /// Invokes the [Function] repeatedly with [duration] intervals until
  /// canceled with the [Timer.cancel] function.
  Timer periodic({Duration duration = const Duration(seconds: 1)}) =>
      Timer.periodic(duration, (_) => this());

  /// Invokes the [Function] if given [predicate] is true.
  void callWhen({required bool predicate}) {
    if (predicate) this();
  }

  /// Returns this [Function] if given [predicate] is true,
  /// otherwise returns null.
  void Function()? orNull({required bool predicate}) => predicate ? this : null;
}
