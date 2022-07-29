import 'package:daily_extensions/daily_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('DateTime Extensions', () {
    test('returns minimum possible date', () {
      expect(DateTimeX.min, DateTime.utc(-271821, 04, 20));
    });

    test('returns maximum possible date', () {
      expect(DateTimeX.max, DateTime.utc(275760, 09, 13));
    });

    test('returns today', () {
      expect(
        DateTimeX.today.toDate(),
        DateTime.now().toDate(),
      );
    });

    test('returns tomorrow', () {
      expect(
        DateTimeX.tomorrow.toDate(),
        DateTimeX.today.nextDay.toDate(),
      );
    });

    test('returns yesterday', () {
      expect(
        DateTimeX.yesterday.toDate(),
        DateTimeX.today.previousDay.toDate(),
      );
    });

    test('checks if date is today', () {
      expect(DateTimeX.today.isToday, isTrue);
      expect(DateTimeX.tomorrow.isToday, isFalse);
    });

    test('checks if date is tomorrow', () {
      expect(DateTimeX.today.isTomorrow, isFalse);
      expect(DateTimeX.tomorrow.isTomorrow, isTrue);
    });

    test('checks if date is yesterday', () {
      expect(DateTimeX.today.isYesterday, isFalse);
      expect(DateTimeX.yesterday.isYesterday, isTrue);
    });

    test('checks if date is first week day', () {
      expect(DateTimeX.today.firstWeekDay.isFirstWeekDay, isTrue);
      expect(DateTime(2022, 7, 25).isFirstWeekDay, isTrue);
      expect(DateTime(2022, 7, 26).isFirstWeekDay, isFalse);
    });

    test('checks if date is last week day', () {
      expect(DateTimeX.today.lastWeekDay.isLastWeekDay, isTrue);
      expect(DateTime(2022, 7, 31).isLastWeekDay, isTrue);
      expect(DateTime(2022, 7, 30).isLastWeekDay, isFalse);
    });

    test('checks if date is first month day', () {
      expect(DateTimeX.today.firstMonthDay.isFirstMonthDay, isTrue);
      expect(DateTime(2022, 7, 1).isFirstMonthDay, isTrue);
      expect(DateTime(2022, 7, 2).isFirstMonthDay, isFalse);
    });

    test('checks if date is last month day', () {
      expect(DateTimeX.today.lastMonthDay.isLastMonthDay, isTrue);
      expect(DateTime(2022, 7, 31).isLastMonthDay, isTrue);
      expect(DateTime(2022, 7, 30).isLastMonthDay, isFalse);
    });

    test('checks if date is first year day', () {
      expect(DateTimeX.today.firstYearDay.isFirstYearDay, isTrue);
      expect(DateTime(2022, 1, 1).isFirstYearDay, isTrue);
      expect(DateTime(2022, 12, 31).isFirstYearDay, isFalse);
    });

    test('checks if date is last year day', () {
      expect(DateTimeX.today.lastYearDay.isLastYearDay, isTrue);
      expect(DateTime(2022, 1, 1).isLastYearDay, isFalse);
      expect(DateTime(2022, 12, 31).isLastYearDay, isTrue);
    });

    test('checks if year of date is leap', () {
      expect(DateTime(2020, 1, 1).isLeapYear, isTrue);
      expect(DateTime(2022, 12, 31).isLeapYear, isFalse);
    });

    test('checks if day of date is monday', () {
      expect(DateTime(2022, 7, 25).isMonday, isTrue);
      expect(DateTime(2022, 7, 26).isMonday, isFalse);
    });

    test('checks if day of date is tuesday', () {
      expect(DateTime(2022, 7, 26).isTuesday, isTrue);
      expect(DateTime(2022, 7, 27).isTuesday, isFalse);
    });

    test('checks if day of date is wednesday', () {
      expect(DateTime(2022, 7, 27).isWednesday, isTrue);
      expect(DateTime(2022, 7, 28).isWednesday, isFalse);
    });

    test('checks if day of date is thursday', () {
      expect(DateTime(2022, 7, 28).isThursday, isTrue);
      expect(DateTime(2022, 7, 29).isThursday, isFalse);
    });

    test('checks if day of date is friday', () {
      expect(DateTime(2022, 7, 29).isFriday, isTrue);
      expect(DateTime(2022, 7, 30).isFriday, isFalse);
    });

    test('checks if day of date is saturday', () {
      expect(DateTime(2022, 7, 30).isSaturday, isTrue);
      expect(DateTime(2022, 7, 31).isSaturday, isFalse);
    });

    test('checks if day of date is sunday', () {
      expect(DateTime(2022, 7, 31).isSunday, isTrue);
      expect(DateTime(2022, 8, 1).isSunday, isFalse);
    });

    test('checks if month of date is january', () {
      expect(DateTime(2022, 1, 1).isJanuary, isTrue);
      expect(DateTime(2022, 2, 1).isJanuary, isFalse);
    });

    test('checks if month of date is february', () {
      expect(DateTime(2022, 2, 1).isFebruary, isTrue);
      expect(DateTime(2022, 3, 1).isFebruary, isFalse);
    });

    test('checks if month of date is march', () {
      expect(DateTime(2022, 3, 1).isMarch, isTrue);
      expect(DateTime(2022, 4, 1).isMarch, isFalse);
    });

    test('checks if month of date is april', () {
      expect(DateTime(2022, 4, 1).isApril, isTrue);
      expect(DateTime(2022, 5, 1).isApril, isFalse);
    });

    test('checks if month of date is may', () {
      expect(DateTime(2022, 5, 1).isMay, isTrue);
      expect(DateTime(2022, 6, 1).isMay, isFalse);
    });

    test('checks if month of date is june', () {
      expect(DateTime(2022, 6, 1).isJune, isTrue);
      expect(DateTime(2022, 7, 1).isJune, isFalse);
    });

    test('checks if month of date is july', () {
      expect(DateTime(2022, 7, 1).isJuly, isTrue);
      expect(DateTime(2022, 8, 1).isJuly, isFalse);
    });

    test('checks if month of date is august', () {
      expect(DateTime(2022, 8, 1).isAugust, isTrue);
      expect(DateTime(2022, 9, 1).isAugust, isFalse);
    });

    test('checks if month of date is september', () {
      expect(DateTime(2022, 9, 1).isSeptember, isTrue);
      expect(DateTime(2022, 10, 1).isSeptember, isFalse);
    });

    test('checks if month of date is october', () {
      expect(DateTime(2022, 10, 1).isOctober, isTrue);
      expect(DateTime(2022, 11, 1).isOctober, isFalse);
    });

    test('checks if month of date is november', () {
      expect(DateTime(2022, 11, 1).isNovember, isTrue);
      expect(DateTime(2022, 12, 1).isNovember, isFalse);
    });

    test('checks if month of date is december', () {
      expect(DateTime(2022, 12, 1).isDecember, isTrue);
      expect(DateTime(2022, 1, 1).isDecember, isFalse);
    });

    test('checks if dates are equal up to year', () {
      expect(
        DateTime(2022, 12, 10).isAtSameYearAs(DateTime(2022, 1, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 12, 1).isAtSameYearAs(DateTime(2021, 1, 1)),
        isFalse,
      );
    });

    test('checks if dates are equal up to month', () {
      expect(
        DateTime(2022, 12, 1).isAtSameMonthAs(DateTime(2022, 12, 15)),
        isTrue,
      );
      expect(
        DateTime(2022, 12, 1).isAtSameMonthAs(DateTime(2022, 11, 1)),
        isFalse,
      );
    });

    test('checks if dates are equal up to week', () {
      expect(
        DateTime(2022, 7, 26).isAtSameWeekAs(DateTime(2022, 7, 29)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 20).isAtSameWeekAs(DateTime(2022, 7, 29)),
        isFalse,
      );
    });

    test('checks if dates are equal up to day', () {
      expect(
        DateTime(2022, 7, 26).isAtSameDayAs(DateTime(2022, 7, 26)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26).isAtSameDayAs(DateTime(2022, 7, 27)),
        isFalse,
      );
    });

    test('checks if dates are equal up to hour', () {
      expect(
        DateTime(2022, 7, 26, 1).isAtSameHourAs(DateTime(2022, 7, 26, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26, 1).isAtSameHourAs(DateTime(2022, 7, 26, 2)),
        isFalse,
      );
    });

    test('checks if dates are equal up to minute', () {
      expect(
        DateTime(2022, 7, 26, 1, 1)
            .isAtSameMinuteAs(DateTime(2022, 7, 26, 1, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26, 1, 1)
            .isAtSameMinuteAs(DateTime(2022, 7, 26, 1, 2)),
        isFalse,
      );
    });

    test('checks if dates are equal up to second', () {
      expect(
        DateTime(2022, 7, 26, 1, 1, 1)
            .isAtSameSecondAs(DateTime(2022, 7, 26, 1, 1, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26, 1, 1, 1)
            .isAtSameSecondAs(DateTime(2022, 7, 26, 1, 1, 2)),
        isFalse,
      );
    });

    test('checks if dates are equal up to millisecond', () {
      expect(
        DateTime(2022, 7, 26, 1, 1, 1, 1)
            .isAtSameMillisecondAs(DateTime(2022, 7, 26, 1, 1, 1, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26, 1, 1, 1, 1)
            .isAtSameMillisecondAs(DateTime(2022, 7, 26, 1, 1, 1, 2)),
        isFalse,
      );
    });

    test('checks if dates are equal up to microsecond', () {
      expect(
        DateTime(2022, 7, 26, 1, 1, 1, 1, 1)
            .isAtSameMicrosecondAs(DateTime(2022, 7, 26, 1, 1, 1, 1, 1)),
        isTrue,
      );
      expect(
        DateTime(2022, 7, 26, 1, 1, 1, 1, 1)
            .isAtSameMicrosecondAs(DateTime(2022, 7, 26, 1, 1, 1, 1, 2)),
        isFalse,
      );
    });

    test('checks if date is in range of dates', () {
      expect(
        DateTime(2022, 1, 1)
            .isBetween(DateTime(2021, 12, 25), DateTime(2022, 1, 15)),
        isTrue,
      );
      expect(
        DateTime(2022, 1, 1)
            .isBetween(DateTime(2022, 1, 2), DateTime(2022, 1, 10)),
        isFalse,
      );
    });

    test('returns number of days in month of date', () {
      expect(DateTime(2022, 6, 1).monthLength, 30);
      expect(DateTime(2022, 7, 1).monthLength, 31);
    });

    test('returns week days of date', () {
      expect(
        DateTime(2022, 7, 27).weekDays.toString(),
        DateTimeX.daysBetween(
          DateTime(2022, 7, 25),
          DateTime(2022, 7, 31),
        ).toString(),
      );
    });

    test('returns month days of date', () {
      expect(
        DateTime(2022, 7, 27).monthDays.toString(),
        DateTimeX.daysBetween(
          DateTime(2022, 7, 1),
          DateTime(2022, 7, 31),
        ).toString(),
      );
    });

    test('returns year days of date', () {
      expect(
        DateTime(2022, 7, 27).yearDays.toString(),
        DateTimeX.daysBetween(
          DateTime(2022, 1, 1),
          DateTime(2022, 12, 31),
        ).toString(),
      );
    });

    test('returns next day of date', () {
      expect(
        DateTime(2022, 7, 27).nextDay.toDate(),
        DateTime(2022, 7, 28),
      );
    });

    test('returns previous day of date', () {
      expect(
        DateTime(2022, 7, 27).previousDay.toDate(),
        DateTime(2022, 7, 26),
      );
    });

    test('returns next week of date', () {
      expect(
        DateTime(2022, 7, 27).nextWeek.toDate(),
        DateTime(2022, 8, 3),
      );
    });

    test('returns previous week of date', () {
      expect(
        DateTime(2022, 7, 27).previousWeek.toDate(),
        DateTime(2022, 7, 20),
      );
    });

    test('returns next month of date', () {
      expect(
        DateTime(2022, 7, 27).nextMonth.toDate(),
        DateTime(2022, 8, 27),
      );
    });

    test('returns previous month of date', () {
      expect(
        DateTime(2022, 7, 27).previousMonth.toDate(),
        DateTime(2022, 6, 27),
      );
    });

    test('returns next year of date', () {
      expect(
        DateTime(2022, 7, 27).nextYear.toDate(),
        DateTime(2023, 7, 27),
      );
    });

    test('returns previous year of date', () {
      expect(
        DateTime(2022, 7, 27).previousYear.toDate(),
        DateTime(2021, 7, 27),
      );
    });

    test('returns first week day of date', () {
      expect(
        DateTime(2022, 7, 27).firstWeekDay,
        DateTime(2022, 7, 25),
      );
    });

    test('returns last week day of date', () {
      expect(
        DateTime(2022, 7, 27).lastWeekDay,
        DateTime(2022, 7, 31),
      );
    });

    test('returns first month day of date', () {
      expect(
        DateTime(2022, 7, 27).firstMonthDay,
        DateTime(2022, 7, 1),
      );
    });

    test('returns last month day of date', () {
      expect(
        DateTime(2022, 7, 27).lastMonthDay,
        DateTime(2022, 7, 31),
      );
    });

    test('returns first year day of date', () {
      expect(
        DateTime(2022, 7, 27).firstYearDay,
        DateTime(2022, 1, 1),
      );
    });

    test('returns last year day of date', () {
      expect(
        DateTime(2022, 7, 27).lastYearDay,
        DateTime(2022, 12, 31),
      );
    });

    test('returns digital time zone', () {
      expect(
        DateTime.utc(2022, 7, 27).digitalTimeZoneOffset,
        '+00:00',
      );
    });

    test('returns only date', () {
      expect(
        DateTime(2022, 7, 27, 1, 1, 1, 1, 1).toDate(),
        DateTime(2022, 7, 27),
      );
    });

    test('copies date', () {
      expect(
        DateTime(2022, 7, 27).copyWith(year: 2023, day: 1).toDate(),
        DateTime(2023, 7, 1),
      );
    });

    test('checks if year is leap', () {
      expect(DateTimeX.isLeap(2020), isTrue);
      expect(DateTimeX.isLeap(2021), isFalse);
    });

    test('returns the number of days in month', () {
      expect(DateTimeX.daysIn(2020, 2), 29);
      expect(DateTimeX.daysIn(2021, 2), 28);
      expect(DateTimeX.daysIn(2021, 12), 31);
    });

    test('returns range of days', () {
      expect(
        DateTimeX.daysBetween(
          DateTime(2022, 7, 25),
          DateTime(2022, 7, 31),
        ).toString(),
        DateTime(2022, 7, 27).weekDays.toString(),
      );
    });

    test('returns first day of week', () {
      expect(
        DateTimeX.getFirstWeekDay(DateTime(2022, 7, 27)),
        DateTime(2022, 7, 25),
      );
    });

    test('returns last day of week', () {
      expect(
        DateTimeX.getLastWeekDay(DateTime(2022, 7, 27)),
        DateTime(2022, 7, 31),
      );
    });

    test('returns first day of month', () {
      expect(
        DateTimeX.getFirstMonthDay(2022, 7),
        DateTime(2022, 7, 1),
      );
    });

    test('returns last day of month', () {
      expect(
        DateTimeX.getLastMonthDay(2022, 7),
        DateTime(2022, 7, 31),
      );
    });

    test('returns first day of year', () {
      expect(
        DateTimeX.getFirstYearDay(2022),
        DateTime(2022, 1, 1),
      );
    });

    test('returns last day of year', () {
      expect(
        DateTimeX.getLastYearDay(2022),
        DateTime(2022, 12, 31),
      );
    });
  });
}