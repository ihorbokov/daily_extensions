/// Extensions for [String].
extension StringX on String {
  /// Whether this [String] is empty or consists solely
  /// of whitespace characters.
  bool get isBlank => trim().isEmpty;

  /// Whether this [String] is [int].
  bool get isInt => int.tryParse(this) != null;

  /// Whether this [String] is [double].
  bool get isDouble => double.tryParse(this) != null;

  /// Whether this [String] is [num].
  bool get isNum => num.tryParse(this) != null;

  /// Whether this [String] is [bool].
  bool get isBool {
    return equalsAny(const [
      'true',
      'false',
      'yes',
      'no',
      'y',
      'n',
      'on',
      'off',
      'online',
      'offline',
      '1',
      '0',
    ]);
  }

  /// Whether this [String] consists only Latin letters.
  bool get isAlphabetic => hasMatch(r'^[a-zA-Z]+$');

  /// Whether this [String] consists only digits.
  bool get isNumeric => hasMatch(r'^\d+$');

  /// Whether this [String] is bin.
  bool get isBin => toLowerCase().hasMatch(r'.bin$');

  /// Whether this [String] is hex.
  bool get isHex => toLowerCase().hasMatch(r'.hex$');

  /// Whether this [String] is srec.
  bool get isSrec => toLowerCase().hasMatch(r'.srec$');

  /// Whether this [String] is vector.
  bool get isVector => toLowerCase().hasMatch(r'.svg$');

  /// Whether this [String] is image.
  bool get isImage => toLowerCase().hasMatch(r'.(jpeg|jpg|gif|png|bmp)$');

  /// Whether this [String] is audio.
  bool get isAudio => toLowerCase().hasMatch(r'.(mp3|wav|wma|amr|ogg)$');

  /// Whether this [String] is video.
  bool get isVideo =>
      toLowerCase().hasMatch(r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp)$');

  /// Whether this [String] is txt.
  bool get isTxt => toLowerCase().hasMatch(r'.txt$');

  /// Whether this [String] is word.
  bool get isDoc => toLowerCase().hasMatch(r'.(doc|docx)$');

  /// Whether this [String] is excel.
  bool get isExcel => toLowerCase().hasMatch(r'.(xls|xlsx)$');

  /// Whether this [String] is ppt.
  bool get isPpt => toLowerCase().hasMatch(r'.(ppt|pptx)$');

  /// Whether this [String] is apk.
  bool get isApk => toLowerCase().hasMatch(r'.apk$');

  /// Whether this [String] is pdf.
  bool get isPdf => toLowerCase().hasMatch(r'.pdf$');

  /// Whether this [String] is html.
  bool get isHtml => toLowerCase().hasMatch(r'.html$');

  /// Whether this [String] is url.
  bool get isUrl {
    return hasMatch(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    );
  }

  /// Whether this [String] is email.
  bool get isEmail {
    return hasMatch(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
  }

  /// Whether this [String] is DateTime.
  bool get isDateTime => DateTime.tryParse(this) != null;

  /// Whether this [String] is Social Security number.
  bool get isSsn {
    return hasMatch(
      r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$',
    );
  }

  /// Whether this [String] is Passport No.
  bool get isPassport => hasMatch(r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  /// Whether this [String] is ISBN.
  bool get isIsbn {
    return hasMatch(
      r'(ISBN(\-1[03])?[:]?[ ]?)?(([0-9Xx][- ]?){13}|([0-9Xx][- ]?){10})',
    );
  }

  /// Whether this [String] is credit or debit card.
  bool get isCreditCard {
    return hasMatch(
      r'^(?:3[47]\d{2}([\- ]?)\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ]?)\d{4}\2\d{4}\2\d{4})$',
    );
  }

  /// Whether this [String] is currency.
  bool get isCurrency {
    return hasMatch(
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$',
    );
  }

  /// Whether this [String] is MD5.
  bool get isMd5 => hasMatch(r'^[a-f0-9]{32}$');

  /// Whether this [String] is SHA1.
  bool get isSha1 =>
      hasMatch(r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');

  /// Whether this [String] is SHA256.
  bool get isSha256 =>
      hasMatch(r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');

  /// Whether this [String] is Base64.
  bool get isBase64 {
    return hasMatch(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$',
    );
  }

  /// Whether this [String] is binary.
  bool get isBinary => hasMatch(r'^[0-1]+$');

  /// Whether this [String] is IPv4.
  bool get isIPv4 =>
      hasMatch(r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');

  /// Whether this [String] is IPv6.
  bool get isIPv6 {
    return hasMatch(
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$',
    );
  }

  /// Whether this [String] is hexadecimal.
  bool get isHexadecimal => hasMatch(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  /// Whether this [String] is UUID.
  bool get isUuid {
    return hasMatch(
      r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$',
    );
  }

  /// Whether this [String] is phone number in length range
  /// between excluded [min] and [max].
  bool isPhoneNumber([int min = 9, int max = 16]) {
    if (length < min || length > max) return false;
    return hasMatch(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Whether this [String] is weak password.
  ///
  /// Length of the password should be >= [min] and password
  /// should consist of any characters except of spaces.
  bool isWeakPassword([int min = 4]) => hasMatch(r'^\S{%s,}$'.format(['$min']));

  /// Whether this [String] is medium password.
  ///
  /// Length of the password should be >= [min] and password
  /// should consist of any characters except of spaces, but at least:
  /// `1 upper case letter, 1 lower case letter and 1 digit`.
  bool isMediumPassword([int min = 6]) =>
      hasMatch(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{%s,}$'.format(['$min']));

  /// Whether this [String] is strong password.
  ///
  /// Length of the password should be >= [min] and password
  /// should consist of any characters except of spaces, but at least:
  /// `1 upper case letter, 1 lower case letter, 1 digit and 1 symbol`.
  bool isStrongPassword([int min = 8]) => hasMatch(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{%s,}$'.format(['$min']),
      );

  /// Whether this [String] is new version.
  ///
  /// Length and [delimiter] of this [String] and [version] must be the same.
  bool isNewVersion(String version, {String delimiter = '.'}) {
    final firstVersion = split(delimiter);
    final secondVersion = version.split(delimiter);
    var isNew = false;
    for (var i = 0; i < firstVersion.length; i++) {
      final firstNumber = int.parse(firstVersion[i]);
      final secondNumber = int.parse(secondVersion[i]);
      isNew = firstNumber >= secondNumber;
      if (firstNumber != secondNumber) break;
    }
    return isNew;
  }

  /// Returns this [String] if it's not empty,
  /// otherwise returns [value].
  String ifEmpty(String value) => isEmpty ? value : this;

  /// Returns this [String] if it's not blank,
  /// otherwise returns [value].
  String ifBlank(String value) => isBlank ? value : this;

  /// Returns digits of this [String].
  String get digits => remove(RegExp(r'\D'));

  /// Returns Latin letters of this [String].
  String get letters => remove(RegExp('[^a-zA-Z]'));

  /// Returns symbols of this [String].
  String get symbols => remove(RegExp('[a-zA-Z0-9 ]'));

  /// Returns special symbols of this [String].
  String get specialSymbols =>
      remove(RegExp(r'[^/!@#$%^\-&*()+",.?:{}|<>~_-`]'));

  /// Returns true if this [String] contains digits.
  bool get hasDigits => digits.isNotEmpty;

  /// Returns true if this [String] contains letters.
  bool get hasLetters => letters.isNotEmpty;

  /// Returns true if this [String] contains symbols.
  bool get hasSymbols => symbols.isNotEmpty;

  /// Returns true if this [String] contains special symbols.
  bool get hasSpecialSymbols => specialSymbols.isNotEmpty;

  /// Returns char's array of this [String].
  List<String> get charArray => split('');

  /// Returns reversed [String].
  String get reversed => charArray.reversed.join();

  /// Converts this [String] to [int].
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  int asInt({int? radix}) => int.parse(this, radix: radix);

  /// Converts this [String] to [double].
  double asDouble() => double.parse(this);

  /// Converts this [String] to [num].
  num asNum() => num.parse(this);

  /// Converts this [String] to [bool].
  bool asBool() => equalsAny(const ['true', 'yes', 'y', 'on', 'online', '1']);

  /// Converts this [String] to [DateTime].
  DateTime asDateTime() => DateTime.parse(this);

  /// Capitalize the first letter of this [String].
  String capitalizeFirst() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Removes all substrings that match [pattern] from this [String].
  String remove(Pattern pattern) => replaceAll(pattern, '');

  /// Removes spaces from this [String].
  String removeSpaces() => remove(' ');

  /// Removes all digits from this [String].
  String removeDigits() => remove(RegExp(r'(\d+)'));

  /// Removes all Latin letters from this [String].
  String removeLetters() => remove(RegExp('([a-zA-Z]+)'));

  /// Removes all symbols from this [String].
  String removeSymbols() => remove(RegExp('([^a-zA-Z0-9 ]+)'));

  /// Removes all special symbols from this [String].
  String removeSpecialSymbols() =>
      remove(RegExp(r'[/!@#$%^\-&*()+",.?:{}|<>~_-`]'));

  /// Whether the regular expression has a match in this [String].
  bool hasMatch(String source) => RegExp(source).hasMatch(this);

  /// Inserts [value] to specified position [index] of this [String].
  String insert(String value, int index) =>
      (charArray..insert(index, value)).join();

  /// Truncates this [String] if it is longer than the given maximum [length]
  /// and adds [end] to the very end.
  String truncate(int length, {String end = '...'}) {
    if (isEmpty) return this;
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

  /// Converts this [String] to Title case.
  ///
  /// Example: `Hello to all -> Hello To All`.
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst()).join(' ');
  }

  /// Converts this [String] to Camel case.
  ///
  /// Example: `Hello to all -> helloToAll`.
  String toCamelCase() {
    if (isEmpty) return this;
    final value = toPascalCase();
    return '${value[0].toLowerCase()}${value.substring(1)}';
  }

  /// Converts this [String] to Pascal case.
  ///
  /// Example: `Hello to all -> HelloToAll`.
  String toPascalCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst()).join();
  }

  /// Converts this [String] to Snake case.
  ///
  /// Example: `Hello to all -> hello_to_all`.
  String toSnakeCase() {
    if (isEmpty) return this;
    return replaceAll(' ', '_').toLowerCase();
  }

  /// Converts this [String] to Kebab case.
  ///
  /// Example: `Hello to all -> hello-to-all`.
  String toKebabCase() {
    if (isEmpty) return this;
    return replaceAll(' ', '-').toLowerCase();
  }

  /// Converts this [String] to abbreviation.
  ///
  /// Example: `Hello to all -> Hta`.
  String toAbbreviation() {
    if (isEmpty) return this;
    return split(' ').map((word) => word[0]).join();
  }

  /// Converts this [String] to country flag, ignoring lower case and
  /// upper case differences.
  ///
  /// Example: `US -> 🇺🇸, UA -> 🇺🇦`.
  String toCountryFlag() {
    final charArray = toUpperCase().charArray;
    final codes = charArray.map((char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(codes);
  }

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

  /// Returns [value] if this nullable [String] is blank or null,
  /// otherwise returns this [String].
  String ifBlankOrNull(String value) => isBlankOrNull ? value : this!;

  /// Returns [value] if this nullable [String] is empty or null,
  /// otherwise returns this [String].
  String ifEmptyOrNull(String value) => isEmptyOrNull ? value : this!;
}
