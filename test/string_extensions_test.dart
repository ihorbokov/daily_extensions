import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('String Extensions', () {
    test('checks if string is blank', () {
      expect(''.isBlank, isTrue);
      expect('   '.isBlank, isTrue);
      expect('Hello world!'.isBlank, isFalse);
    });

    test('checks if string is int', () {
      expect('Hello world!'.isInt, isFalse);
      expect('2022'.isInt, isTrue);
      expect('-20.22'.isInt, isFalse);
    });

    test('checks if string is double', () {
      expect('Hello world!'.isDouble, isFalse);
      expect('2022'.isDouble, isTrue);
      expect('-20.22'.isDouble, isTrue);
    });

    test('checks if string is num', () {
      expect('Hello world!'.isNum, isFalse);
      expect('2022'.isNum, isTrue);
      expect('-20.22'.isNum, isTrue);
    });

    test('checks if string is bool', () {
      expect('Hello world!'.isBool, isFalse);
      expect('true'.isBool, isTrue);
      expect('True'.isBool, isTrue);
      expect('false'.isBool, isTrue);
      expect('False'.isBool, isTrue);
      expect('yes'.isBool, isTrue);
      expect('YES'.isBool, isTrue);
      expect('no'.isBool, isTrue);
      expect('NO'.isBool, isTrue);
      expect('oN'.isBool, isTrue);
      expect('oFF'.isBool, isTrue);
      expect('y'.isBool, isTrue);
      expect('N'.isBool, isTrue);
      expect('0'.isBool, isTrue);
      expect('1'.isBool, isTrue);
      expect('Online'.isBool, isTrue);
      expect('offline'.isBool, isTrue);
    });

    test('checks if string is alphabetic', () {
      expect('abcAbcABC'.isAlphabetic, isTrue);
      expect('Abc!'.isAlphabetic, isFalse);
      expect('Abc100500!'.isAlphabetic, isFalse);
    });

    test('checks if string is numeric', () {
      expect('-20.22'.isNumeric, isFalse);
      expect('001122'.isNumeric, isTrue);
    });

    test('checks if string is bin', () {
      expect('file.svg'.isBin, isFalse);
      expect('file.bin'.isBin, isTrue);
    });

    test('checks if string is hex', () {
      expect('file.svg'.isHex, isFalse);
      expect('file.hex'.isHex, isTrue);
    });

    test('checks if string is srec', () {
      expect('file.txt'.isSrec, isFalse);
      expect('file.srec'.isSrec, isTrue);
    });

    test('checks if string is vector', () {
      expect('file.png'.isVector, isFalse);
      expect('file.svg'.isVector, isTrue);
    });

    test('checks if string is image', () {
      expect('file.jpeg'.isImage, isTrue);
      expect('file.jpg'.isImage, isTrue);
      expect('file.gif'.isImage, isTrue);
      expect('file.png'.isImage, isTrue);
      expect('file.bmp'.isImage, isTrue);
      expect('file.svg'.isImage, isFalse);
    });

    test('checks if string is audio', () {
      expect('file.mp3'.isAudio, isTrue);
      expect('file.wav'.isAudio, isTrue);
      expect('file.wma'.isAudio, isTrue);
      expect('file.amr'.isAudio, isTrue);
      expect('file.ogg'.isAudio, isTrue);
      expect('file.mp4'.isAudio, isFalse);
    });

    test('checks if string is video', () {
      expect('file.mp4'.isVideo, isTrue);
      expect('file.avi'.isVideo, isTrue);
      expect('file.wmv'.isVideo, isTrue);
      expect('file.rmvb'.isVideo, isTrue);
      expect('file.mpg'.isVideo, isTrue);
      expect('file.mpeg'.isVideo, isTrue);
      expect('file.3gp'.isVideo, isTrue);
      expect('file.mp3'.isVideo, isFalse);
    });

    test('checks if string is txt', () {
      expect('file.txt'.isTxt, isTrue);
      expect('file.doc'.isTxt, isFalse);
    });

    test('checks if string is word', () {
      expect('file.doc'.isDoc, isTrue);
      expect('file.docx'.isDoc, isTrue);
      expect('file.txt'.isDoc, isFalse);
    });

    test('checks if string is excel', () {
      expect('file.xls'.isExcel, isTrue);
      expect('file.xlsx'.isExcel, isTrue);
      expect('file.doc'.isExcel, isFalse);
    });

    test('checks if string is ppt', () {
      expect('file.ppt'.isPpt, isTrue);
      expect('file.pptx'.isPpt, isTrue);
      expect('file.xlsx'.isPpt, isFalse);
    });

    test('checks if string is apk', () {
      expect('file.apk'.isApk, isTrue);
      expect('file.ppt'.isApk, isFalse);
    });

    test('checks if string is pdf', () {
      expect('file.pdf'.isPdf, isTrue);
      expect('file.apk'.isPdf, isFalse);
    });

    test('checks if string is html', () {
      expect('file.html'.isHtml, isTrue);
      expect('file.pdf'.isHtml, isFalse);
    });

    test('checks if string is url', () {
      expect('http://phimary.com'.isUrl, isTrue);
      expect('http://phimary.com/'.isUrl, isTrue);
      expect('https://phimary.com/'.isUrl, isTrue);
      expect('phimary.com'.isUrl, isTrue);
      expect('info@phimary.com'.isUrl, isFalse);
    });

    test('checks if string is email', () {
      expect('info@phimary.com'.isEmail, isTrue);
      expect('info@phimary'.isEmail, isFalse);
      expect('info@phimary.c'.isEmail, isFalse);
    });

    test('checks if string is DateTime', () {
      expect('2022-07-26 19:42:01.012369Z'.isDateTime, isTrue);
      expect('2022-07-26T22:42:01.015524'.isDateTime, isTrue);
      expect('2022-07-26'.isDateTime, isTrue);
      expect('2022-107-261'.isDateTime, isFalse);
    });

    test('checks if string is SSN', () {
      expect('856-45-6789'.isSsn, isTrue);
      expect('000-45-6789'.isSsn, isFalse);
    });

    test('checks if string is Passport No', () {
      expect('533380006'.isPassport, isTrue);
      expect('000-45-6789'.isPassport, isFalse);
    });

    test('checks if string is ISBN', () {
      expect('978-9-748577-12-8'.isIsbn, isTrue);
      expect('533380006'.isIsbn, isFalse);
    });

    test('checks if string is credit or debit card', () {
      expect('4338569737620319'.isCreditCard, isTrue);
      expect('978-9-748577-12-8'.isCreditCard, isFalse);
    });

    test('checks if string is currency', () {
      expect('10'.isCurrency, isTrue);
      expect('10 USD'.isCurrency, isTrue);
      expect('100 EUR'.isCurrency, isTrue);
      expect('100 A'.isCurrency, isFalse);
    });

    test('checks if string is MD5', () {
      expect('d8578edf8458ce06fbc5bb76a58c5ca4'.isMd5, isTrue);
      expect('b1b3773a05c0ed0176787a4f1574ff0075f7521e'.isMd5, isFalse);
    });

    test('checks if string is SHA1', () {
      expect('b1b3773a05c0ed0176787a4f1574ff0075f7521e'.isSha1, isTrue);
      expect('d8578edf8458ce06fbc5bb76a58c5ca4'.isSha1, isFalse);
    });

    test('checks if string is SHA256', () {
      expect(
        '65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5'
            .isSha256,
        isTrue,
      );
      expect('b1b3773a05c0ed0176787a4f1574ff0075f7521e'.isSha256, isFalse);
    });

    test('checks if string is Base64', () {
      expect('cXdlcnR5'.isBase64, isTrue);
      expect('12345'.isBase64, isFalse);
    });

    test('checks if string is binary', () {
      expect('0110111011'.isBinary, isTrue);
      expect('12345'.isBinary, isFalse);
    });

    test('checks if string is IPv4', () {
      expect('19.117.63.126'.isIPv4, isTrue);
      expect('255.255.253.0'.isIPv4, isTrue);
      expect('19.117.63.253'.isIPv4, isTrue);
      expect('684D:1111:222:3333:4444:5555:6:77'.isIPv4, isFalse);
    });

    test('checks if string is IPv6', () {
      expect('684D:1111:222:3333:4444:5555:6:77'.isIPv6, isTrue);
      expect('19.117.63.126'.isIPv6, isFalse);
    });

    test('checks if string is hexadecimal', () {
      expect('#A7B316'.isHexadecimal, isTrue);
      expect('#A7B'.isHexadecimal, isTrue);
      expect('#A7BA'.isIPv6, isFalse);
    });

    test('checks if string is UUID', () {
      expect('7fe14699-0001-0000-0000-1ddeaa51af4a'.isUuid, isTrue);
      expect('123e4567-e89b-12d3-a4561426614174000'.isUuid, isFalse);
    });

    test('checks if string is phone number', () {
      expect('+380501231212'.isPhoneNumber(), isTrue);
      expect('(888) 8881118'.isPhoneNumber(), isTrue);
      expect('(888) 888-1118'.isPhoneNumber(), isTrue);
      expect('888'.isPhoneNumber(), isFalse);
      expect('(888) 888111222222222'.isPhoneNumber(), isFalse);
    });

    test('checks if string is weak password', () {
      expect('qwe'.isWeakPassword(), isFalse);
      expect('qwerty'.isWeakPassword(), isTrue);
    });

    test('checks if string is medium password', () {
      expect('qwerty'.isMediumPassword(), isFalse);
      expect('Qwerty100'.isMediumPassword(), isTrue);
    });

    test('checks if string is strong password', () {
      expect('Qwerty100'.isStrongPassword(), isFalse);
      expect('Qwerty100500!'.isStrongPassword(), isTrue);
    });

    test('checks if string is actual version', () {
      expect('1.0.0'.isNewVersion('1.0.0'), isTrue);
      expect('2.0.0'.isNewVersion('1.0.0'), isTrue);
      expect('1.1.0'.isNewVersion('1.0.0'), isTrue);
      expect('1.0.1'.isNewVersion('1.0.0'), isTrue);
      expect('1.0.0'.isNewVersion('2.0.0'), isFalse);
      expect('1.0.0'.isNewVersion('1.1.0'), isFalse);
      expect('1.0.0'.isNewVersion('1.0.1'), isFalse);
      expect('2.0.0'.isNewVersion('1.10.0'), isTrue);
      expect('1_0_0'.isNewVersion('1_0_0', delimiter: '_'), isTrue);
      expect('1_0_0'.isNewVersion('1_10_0', delimiter: '_'), isFalse);
    });

    test('returns value in empty case', () {
      final value = 'Hello'.ifEmpty('World');
      expect(value, isA<String>());
      expect(value, 'Hello');
      expect(''.ifEmpty('World'), 'World');
    });

    test('returns value in blank case', () {
      final value = 'Hello'.ifBlank('World');
      expect(value, isA<String>());
      expect(value, 'Hello');
      expect(''.ifBlank('World'), 'World');
      expect('   '.ifBlank('World'), 'World');
    });

    test('returns all digits', () {
      expect(''.digits, '');
      expect('hello'.digits, '');
      expect('+3 (112) 33-44'.digits, '31123344');
    });

    test('returns all Latin letters', () {
      expect(''.letters, '');
      expect('hello'.letters, 'hello');
      expect('Hello100 World500!'.letters, 'HelloWorld');
    });

    test('returns all symbols', () {
      expect(''.symbols, '');
      expect('hello'.symbols, '');
      expect('Hello100±± @%^& Wo,.rld500!'.symbols, '±±@%^&,.!');
    });

    test('returns all special symbols', () {
      expect(''.specialSymbols, '');
      expect('hello'.specialSymbols, '');
      expect('Hello100±± @%^& Wo,.rld500!'.specialSymbols, '@%^&,.!');
    });

    test('checks if string contains digits', () {
      expect(''.hasDigits, isFalse);
      expect('hello'.hasDigits, isFalse);
      expect('Hello100±± @%^& Wo,.rld500!'.hasDigits, isTrue);
    });

    test('checks if string contains letters', () {
      expect(''.hasLetters, isFalse);
      expect('hello'.hasLetters, isTrue);
      expect('Hello100±± @%^& Wo,.rld500!'.hasLetters, isTrue);
    });

    test('checks if string contains symbols', () {
      expect(''.hasSymbols, isFalse);
      expect('hello'.hasSymbols, isFalse);
      expect('Hello100±± @%^& Wo,.rld500!'.hasSymbols, isTrue);
    });

    test('checks if string contains special symbols', () {
      expect(''.hasSpecialSymbols, isFalse);
      expect('hello'.hasSpecialSymbols, isFalse);
      expect('Hello100±± @%^& Wo,.rld500!'.hasSpecialSymbols, isTrue);
    });

    test('returns array of chars', () {
      expect(''.charArray.toString(), '[]');
      expect('Hello!'.charArray.toString(), '[H, e, l, l, o, !]');
    });

    test('returns reversed', () {
      expect(''.reversed, '');
      expect('Hello world!'.reversed, '!dlrow olleH');
    });

    test('converts to bool', () {
      expect('true'.asBool(), isTrue);
      expect('false'.asBool(), isFalse);
      expect('TRUE'.asBool(), isTrue);
      expect('FALSE'.asBool(), isFalse);
      expect('Yes'.asBool(), isTrue);
      expect('No'.asBool(), isFalse);
      expect('oN'.asBool(), isTrue);
      expect('oFF'.asBool(), isFalse);
      expect('y'.asBool(), isTrue);
      expect('N'.asBool(), isFalse);
      expect('1'.asBool(), isTrue);
      expect('0'.asBool(), isFalse);
      expect('online'.asBool(), isTrue);
      expect('Offline'.asBool(), isFalse);
      expect('Hello world!'.asBool(), isFalse);
    });

    test('capitalizes first', () {
      expect(''.capitalizeFirst(), '');
      expect('h'.capitalizeFirst(), 'H');
      expect('hello'.capitalizeFirst(), 'Hello');
      expect('hello World!'.capitalizeFirst(), 'Hello world!');
    });

    test('removes substrings', () {
      expect(''.remove('l'), '');
      expect('hello'.remove('l'), 'heo');
      expect('Hello world!'.remove('Hello '), 'world!');
    });

    test('removes spaces', () {
      expect(''.removeSpaces(), '');
      expect('hello'.removeSpaces(), 'hello');
      expect(' H e l l o World ! '.removeSpaces(), 'HelloWorld!');
    });

    test('removes digits', () {
      expect(''.removeDigits(), '');
      expect('hello'.removeDigits(), 'hello');
      expect('Hello100 World500!'.removeDigits(), 'Hello World!');
    });

    test('removes Latin letters', () {
      expect(''.removeLetters(), '');
      expect('hello'.removeLetters(), '');
      expect('Hello100 World500!'.removeLetters(), '100 500!');
    });

    test('removes symbols', () {
      expect(''.removeSymbols(), '');
      expect('hello'.removeSymbols(), 'hello');
      expect('Hello@±± World!'.removeSymbols(), 'Hello World');
    });

    test('removes special symbols', () {
      expect(''.removeSpecialSymbols(), '');
      expect('hello'.removeSpecialSymbols(), 'hello');
      expect('Hello@±± World!'.removeSpecialSymbols(), 'Hello±± World');
    });

    test('checks if has match', () {
      expect(''.hasMatch(''), isTrue);
      expect('hello'.hasMatch('ll'), isTrue);
      expect('hello'.hasMatch(r'^\d+$'), isFalse);
    });

    test('inserts value', () {
      expect(''.insert('Hi', 0), 'Hi');
      expect('hello'.insert(' world!', 5), 'hello world!');
      expect(() => 'hello'.insert(' world!', 6), throwsRangeError);
    });

    test('truncates string', () {
      expect(''.truncate(1), '');
      expect('hello'.truncate(0), '...');
      expect('hello'.truncate(2), 'he...');
      expect(() => 'hello'.truncate(-1), throwsRangeError);
    });

    test('formats string', () {
      expect(''.format(['Hi']), '');
      expect('%s World!'.format(['Hello']), 'Hello World!');
      expect('%s %s!'.format(['Hello']), 'Hello %s!');
      expect('%s %s!'.format(['Hello', 'World']), 'Hello World!');
    });

    test('converts to Title case', () {
      expect(''.toTitleCase(), '');
      expect('hello'.toTitleCase(), 'Hello');
      expect('hello world!'.toTitleCase(), 'Hello World!');
    });

    test('converts to Camel case', () {
      expect(''.toCamelCase(), '');
      expect('hello'.toCamelCase(), 'hello');
      expect('Hello World'.toCamelCase(), 'helloWorld');
    });

    test('converts to Pascal case', () {
      expect(''.toPascalCase(), '');
      expect('hello'.toPascalCase(), 'Hello');
      expect('Hello world'.toPascalCase(), 'HelloWorld');
    });

    test('converts to Snake case', () {
      expect(''.toSnakeCase(), '');
      expect('hello'.toSnakeCase(), 'hello');
      expect('Hello World'.toSnakeCase(), 'hello_world');
    });

    test('converts to Kebab case', () {
      expect(''.toKebabCase(), '');
      expect('hello'.toKebabCase(), 'hello');
      expect('Hello World'.toKebabCase(), 'hello-world');
    });

    test('converts to abbreviation', () {
      expect(''.toAbbreviation(), '');
      expect('hello'.toAbbreviation(), 'h');
      expect('Hello World'.toAbbreviation(), 'HW');
    });

    test('converts to country flag', () {
      expect('UA'.toCountryFlag(), '🇺🇦');
      expect('US'.toCountryFlag(), '🇺🇸');
    });

    test('checks if equal, ignoring upper / lower cases', () {
      expect(''.equalsIgnoreCase(''), isTrue);
      expect('hello'.equalsIgnoreCase('HeLLo'), isTrue);
      expect('hello'.equalsIgnoreCase('HeLLo!'), isFalse);
    });

    test('checks if contains, ignoring upper / lower cases', () {
      expect(''.containsIgnoreCase(''), isTrue);
      expect('hello!'.containsIgnoreCase('HeLLo'), isTrue);
      expect('hello'.containsIgnoreCase('HeLLo!'), isFalse);
    });

    test('compares, ignoring upper / lower cases', () {
      expect(''.compareToIgnoreCase(''), 0);
      expect('hello'.compareToIgnoreCase('HeLLo'), 0);
      expect('hello'.compareToIgnoreCase('HeLLo!'), -1);
      expect('hello!'.compareToIgnoreCase('HeLLo'), 1);
    });

    test('checks if equal any (ignoring upper / lower cases)', () {
      expect(''.equalsAny(['Hello', 'World']), isFalse);
      expect('hello'.equalsAny(['HeLLo', 'World']), isTrue);
      expect('hello'.equalsAny(['HeLLo', 'World'], ignoreCase: false), isFalse);
      expect('hello'.equalsAny(['HeLLo!']), isFalse);
    });

    test('checks if contains any (ignoring upper / lower cases)', () {
      expect(''.containsAny(['Hello', 'World']), isFalse);
      expect('Hello'.containsAny(['', 'World']), isTrue);
      expect('hello!'.containsAny(['HeLLo', 'World']), isTrue);
      expect('hello!'.containsAny(['HeLLo!'], ignoreCase: false), isFalse);
    });

    test('checks nullable operators', () {
      const String? testNullableString = null;

      expect(''.isBlankOrNull, isTrue);
      expect('   '.isBlankOrNull, isTrue);
      expect(testNullableString.isBlankOrNull, isTrue);
      expect('Hello!'.isBlankOrNull, isFalse);

      expect(''.isEmptyOrNull, isTrue);
      expect('   '.isEmptyOrNull, isFalse);
      expect(testNullableString.isEmptyOrNull, isTrue);
      expect('Hello!'.isEmptyOrNull, isFalse);

      expect(testNullableString.orEmpty, '');
      expect('Hello!'.orEmpty, 'Hello!');

      expect(''.ifBlankOrNull('Hello!'), 'Hello!');
      expect('   '.ifBlankOrNull('Hello!'), 'Hello!');
      expect(testNullableString.ifBlankOrNull('Hello!'), 'Hello!');
      expect('Hello, Dart!'.ifBlankOrNull('Hello!'), 'Hello, Dart!');

      expect(''.ifEmptyOrNull('Hello!'), 'Hello!');
      expect(testNullableString.ifEmptyOrNull('Hello!'), 'Hello!');
      expect('Hello, Dart!'.ifEmptyOrNull('Hello!'), 'Hello, Dart!');
    });
  });
}
