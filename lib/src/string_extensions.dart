/// Extensions for [String].
extension StringX on String {
  /// Whether this [String] is empty or consists solely
  /// of whitespace characters.
  bool get isBlank => trim().isEmpty;

  /// Whether this [String] is [num].
  bool get isNum => num.tryParse(this) != null;

  /// Whether this [String] is [bool].
  bool get isBool => equalsAny(
      ['true', 'false', 'yes', 'no', 'y', 'n', 'on', 'off', '1', '0']);

  /// Whether this [String] consists only Latin letters.
  bool get isAlphabetic => hasMatch(r'^[a-zA-Z]+$');

  /// Whether this [String] consists only digits.
  bool get isNumeric => hasMatch(r'^\d+$');

  /// Whether this [String] is url.
  bool get isUrl => hasMatch(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");

  /// Whether this [String] is email.
  bool get isEmail => hasMatch(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Whether this [String] is MD5.
  bool get isMd5 => hasMatch(r'^[a-f0-9]{32}$');

  /// Whether this [String] is SHA1.
  bool get isSha1 =>
      hasMatch(r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  /// Whether this [String] is SHA256.
  bool get isSha256 =>
      hasMatch(r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  /// Whether this [String] is Base64.
  bool get isBase64 => hasMatch(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  /// Whether this [String] is binary.
  bool get isBinary => hasMatch(r'^[0-1]+$');

  /// Whether this [String] is IPv4.
  bool get isIPv4 =>
      hasMatch(r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  /// Whether this [String] is IPv6.
  bool get isIPv6 => hasMatch(
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  /// Whether this [String] is hexadecimal.
  bool get isHexadecimal => hasMatch(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  /// Whether this [String] is middle password.
  ///
  /// The password must satisfy:
  /// `At least: 1 upper case letter, 1 digit,
  /// 1 lower case letter and length >= 6`.
  bool get isMiddlePassword =>
      hasMatch(r'^(?=.*([A-Z]){1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{6,100}$');

  /// Whether this [String] is strong password.
  ///
  /// The password must satisfy:
  /// `At least: 1 upper case letter, 1 special symbol,
  /// 1 digit, 1 lower case letter and length >= 8`.
  bool get isStrongPassword => hasMatch(
      r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');

  /// Whether this [String] is UUID.
  bool get isUuid => hasMatch(
      r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$');

  /// Whether this [String] is phone number in length range
  /// between excluded [min] and [max].
  bool isPhoneNumber({int min = 9, int max = 16}) {
    if (length < min || length > max) return false;
    return hasMatch(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Returns this [String] if it's not empty,
  /// otherwise returns [value].
  String ifEmpty(String value) => isEmpty ? value : this;

  /// Returns this [String] if it's not blank,
  /// otherwise returns [value].
  String ifBlank(String value) => isBlank ? value : this;

  /// Returns char's array of this [String].
  List<String> get charArray => isBlank ? [] : split('');

  /// Returns reversed [String].
  String get reversed => charArray.reversed.join();

  /// Casts this [String] to [bool].
  bool asBool() => equalsAny(['true', 'yes', 'y', 'on', '1']);

  /// Capitalize the first letter of this [String].
  String capitalizeFirst() {
    if (isBlank) return '';
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Capitalize the first letter of each word in this [String].
  String capitalizeAll() {
    if (isBlank) return '';
    return splitBySpaces().map((word) => word.capitalizeFirst()).join(' ');
  }

  /// Removes all substrings that match [pattern] from this [String].
  String remove(Pattern pattern) => replaceAll(pattern, '');

  /// Removes spaces from this [String].
  String removeSpaces() => remove(' ');

  /// Removes all digits from this [String].
  String removeDigits() => remove(RegExp(r'(\d+)'));

  /// Removes all Latin letters from this [String].
  String removeLetters() => remove(RegExp(r'([a-zA-Z]+)'));

  /// Removes all special symbols from this [String].
  String removeSpecial() => remove(RegExp(r'[/!@#$%^\-&*()+",.?":{}|<>~_-`]'));

  /// Removes all expect of digits from this [String].
  String leaveOnlyDigits() => remove(RegExp(r'\D'));

  /// Removes all expect of Latin letters from this [String].
  String leaveOnlyLetters() => remove(RegExp('[^A-Za-z]'));

  /// Whether the regular expression has a match in this [String].
  bool hasMatch(String source) => RegExp(source).hasMatch(this);

  /// Splits this [String] by spaces.
  List<String> splitBySpaces() => split(' ');

  /// Inserts [value] to specified position [index] of this [String].
  String insert(String value, int index) =>
      (charArray..insert(index, value)).join();

  /// Truncates this [String] if it is longer than the given maximum [length]
  /// and adds [end] to the very end.
  String truncate(int length, {String end = '...'}) {
    if (isBlank) return '';
    return '${substring(0, length)}$end';
  }

  /// Replaces each [mask] value by [arguments] one by one.
  String format(List<String> arguments, {String mask = '%s'}) {
    var formatted = this;
    for (final argument in arguments) {
      formatted = formatted.replaceFirst(mask, argument);
    }
    return formatted;
  }

  /// Converts this [String] to Camel case.
  String toCamelCase() {
    if (isBlank) return '';
    final words = splitBySpaces();
    final buffer = StringBuffer(words[0].toLowerCase());
    for (var index = 1; index < words.length; index++) {
      buffer.write(words[index].capitalizeFirst());
    }
    return buffer.toString();
  }

  /// Converts this [String] to Snake case.
  String toSnakeCase() => isBlank ? '' : replaceAll(' ', '_').toLowerCase();

  /// Converts this [String] to Param case.
  String toParamCase() => isBlank ? '' : replaceAll(' ', '-').toLowerCase();

  /// Checks if this [String] is equal to [other], ignoring lower case and
  /// upper case differences.
  bool equalsIgnoreCase(String other) => toLowerCase() == other.toLowerCase();

  /// Checks if this [String] contains a match of [other], ignoring lower case
  /// and upper case differences.
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());

  /// Compares two [String], ignoring lower case and upper case differences.
  int compareToIgnoreCase(String other) =>
      toLowerCase().compareTo(other.toLowerCase());

  /// Checks if this [String] equals at least one value from [others].
  /// Ignores lower and upper cases differences when [ignoreCase] is true.
  bool equalsAny(List<String> others, {bool ignoreCase = true}) {
    bool isEqual(String other) =>
        ignoreCase ? equalsIgnoreCase(other) : this == other;

    for (final other in others) {
      if (isEqual(other)) return true;
    }
    return false;
  }

  /// Checks if this [String] contains at least one match from [others].
  /// Ignores lower and upper cases differences when [ignoreCase] is true.
  bool containsAny(List<String> others, {bool ignoreCase = true}) {
    bool isContain(String other) =>
        ignoreCase ? containsIgnoreCase(other) : contains(other);

    for (final other in others) {
      if (isContain(other)) return true;
    }
    return false;
  }
}

/// Extensions for nullable [String].
extension StringNullableX on String? {
  /// Whether this nullable [String] is blank or empty.
  bool get isBlankOrNull => this?.isBlank ?? true;

  /// Whether this nullable [String] is null or empty.
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  /// Returns empty [String] if this nullable [String] is null,
  /// otherwise returns this [String].
  String get orEmpty => this ?? '';
}
