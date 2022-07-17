import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('String Extensions', () {
    test('checks if string is blank', () {
      expect(''.isBlank, isTrue);
      expect('   '.isBlank, isTrue);
      expect('Hello world!'.isBlank, isFalse);
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

    test('checks if string is phone number', () {
      expect('+380501231212'.isPhoneNumber, isTrue);
      expect('(888) 8881118'.isPhoneNumber, isTrue);
      expect('(888) 888-1118'.isPhoneNumber, isTrue);
      expect('888'.isPhoneNumber, isFalse);
      expect('(888) 888111222222222'.isPhoneNumber, isFalse);
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

    test('checks if string is middle password', () {
      expect('qwerty'.isMiddlePassword, isFalse);
      expect('Qwerty100'.isMiddlePassword, isTrue);
    });

    test('checks if string is strong password', () {
      expect('qwerty'.isStrongPassword, isFalse);
      expect('Qwerty100500!'.isStrongPassword, isTrue);
    });

    test('checks if string is UUID', () {
      expect('7fe14699-0001-0000-0000-1ddeaa51af4a'.isUuid, isTrue);
      expect('123e4567-e89b-12d3-a4561426614174000'.isUuid, isFalse);
    });

    test('returns array of chars', () {
      expect(''.charArray.toString(), '[]');
      expect('Hello!'.charArray.toString(), '[H, e, l, l, o, !]');
    });

    test('returns reversed', () {
      expect(''.reversed, '');
      expect('Hello world!'.reversed, '!dlrow olleH');
    });

    test('Casts to bool', () {
      expect('true'.asBool(), isTrue);
      expect('false'.asBool(), isFalse);
      expect('TRUE'.asBool(), isTrue);
      expect('FALSE'.asBool(), isFalse);
      expect('Yes'.asBool(), isTrue);
      expect('No'.asBool(), isFalse);
      expect('oN'.asBool(), isTrue);
      expect('oFF'.asBool(), isFalse);
      expect('Hello world!'.asBool(), isFalse);
    });

    test('capitalizes first', () {
      expect(''.capitalizeFirst(), '');
      expect('hello'.capitalizeFirst(), 'Hello');
      expect('hello World!'.capitalizeFirst(), 'Hello world!');
    });

    test('capitalizes all', () {
      expect(''.capitalizeAll(), '');
      expect('hello'.capitalizeAll(), 'Hello');
      expect('hello world!'.capitalizeAll(), 'Hello World!');
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

    test('removes special symbols', () {
      expect(''.removeSpecial(), '');
      expect('hello'.removeSpecial(), 'hello');
      expect('Hello@ World!'.removeSpecial(), 'Hello World');
    });

    test('removes all expect of digits', () {
      expect(''.leaveOnlyDigits(), '');
      expect('hello'.leaveOnlyDigits(), '');
      expect('+3 (112) 33-44'.leaveOnlyDigits(), '31123344');
    });

    test('removes all expect of Latin letters', () {
      expect(''.leaveOnlyLetters(), '');
      expect('hello'.leaveOnlyLetters(), 'hello');
      expect('Hello100 World500!'.leaveOnlyLetters(), 'HelloWorld');
    });

    test('splits by spaces', () {
      expect(''.splitBySpaces().toString(), '[]');
      expect('hello'.splitBySpaces().toString(), '[hello]');
      expect('Hello World!'.splitBySpaces().toString(), '[Hello, World!]');
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

    test('converts to Camel case', () {
      expect(''.toCamelCase(), '');
      expect('hello'.toCamelCase(), 'hello');
      expect('Hello World'.toCamelCase(), 'helloWorld');
    });

    test('converts to Snake case', () {
      expect(''.toSnakeCase(), '');
      expect('hello'.toSnakeCase(), 'hello');
      expect('Hello World'.toSnakeCase(), 'hello_world');
    });

    test('converts to Param case', () {
      expect(''.toParamCase(), '');
      expect('hello'.toParamCase(), 'hello');
      expect('Hello World'.toParamCase(), 'hello-world');
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
    });
  });
}
