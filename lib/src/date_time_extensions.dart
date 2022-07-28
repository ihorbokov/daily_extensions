import 'number_extensions.dart';

/// Extensions for [DateTime].
extension DateTimeX on DateTime {
  /// Minimum possible [DateTime].
  static final min = DateTime.utc(-271821, 04, 20);

  /// Maximum possible [DateTime].
  static final max = DateTime.utc(275760, 09, 13);

  /// Returns today's [DateTime].
  static DateTime get today => DateTime.now();

  /// Returns tomorrow's [DateTime].
  static DateTime get tomorrow => today.add(1.toDays());

  /// Returns yesterday's [DateTime].
  static DateTime get yesterday => today.subtract(1.toDays());

  /// Whether this [DateTime] is today.
  bool get isToday => isAtSameDayAs(today);

  /// Whether this [DateTime] is tomorrow.
  bool get isTomorrow => isAtSameDayAs(tomorrow);

  /// Whether this [DateTime] is yesterday.
  bool get isYesterday => isAtSameDayAs(yesterday);

  /// Whether this [DateTime] is the first day of week.
  bool get isFirstWeekDay => isAtSameDayAs(firstWeekDay);

  /// Whether this [DateTime] is the last day of week.
  bool get isLastWeekDay => isAtSameDayAs(lastWeekDay);

  /// Whether this [DateTime] is the first day of month.
  bool get isFirstMonthDay => isAtSameDayAs(firstMonthDay);

  /// Whether this [DateTime] is the last day of month.
  bool get isLastMonthDay => isAtSameDayAs(lastMonthDay);

  /// Whether this [DateTime] is the first day of year.
  bool get isFirstYearDay => isAtSameDayAs(firstYearDay);

  /// Whether this [DateTime] is the last day of year.
  bool get isLastYearDay => isAtSameDayAs(lastYearDay);

  /// Whether year of this [DateTime] is a leap year.
  bool get isLeapYear => isLeap(year);

  /// Whether weekday of this [DateTime] is monday.
  bool get isMonday => weekday == DateTime.monday;

  /// Whether weekday of this [DateTime] is tuesday.
  bool get isTuesday => weekday == DateTime.tuesday;

  /// Whether weekday of this [DateTime] is wednesday.
  bool get isWednesday => weekday == DateTime.wednesday;

  /// Whether weekday of this [DateTime] is thursday.
  bool get isThursday => weekday == DateTime.thursday;

  /// Whether weekday of this [DateTime] is friday.
  bool get isFriday => weekday == DateTime.friday;

  /// Whether weekday of this [DateTime] is saturday.
  bool get isSaturday => weekday == DateTime.saturday;

  /// Whether weekday of this [DateTime] is sunday.
  bool get isSunday => weekday == DateTime.sunday;

  /// Whether month of this [DateTime] is january.
  bool get isJanuary => month == DateTime.january;

  /// Whether month of this [DateTime] is february.
  bool get isFebruary => month == DateTime.february;

  /// Whether month of this [DateTime] is march.
  bool get isMarch => month == DateTime.march;

  /// Whether month of this [DateTime] is april.
  bool get isApril => month == DateTime.april;

  /// Whether month of this [DateTime] is may.
  bool get isMay => month == DateTime.may;

  /// Whether month of this [DateTime] is june.
  bool get isJune => month == DateTime.june;

  /// Whether month of this [DateTime] is july.
  bool get isJuly => month == DateTime.july;

  /// Whether month of this [DateTime] is august.
  bool get isAugust => month == DateTime.august;

  /// Whether month of this [DateTime] is september.
  bool get isSeptember => month == DateTime.september;

  /// Whether month of this [DateTime] is october.
  bool get isOctober => month == DateTime.october;

  /// Whether month of this [DateTime] is november.
  bool get isNovember => month == DateTime.november;

  /// Whether month of this [DateTime] is december.
  bool get isDecember => month == DateTime.december;

  /// Returns true if this [DateTime] occurs at the same year as [other].
  bool isAtSameYearAs(DateTime other) => year == other.year;

  /// Returns true if this [DateTime] occurs at the same month as [other].
  bool isAtSameMonthAs(DateTime other) =>
      isAtSameYearAs(other) && month == other.month;

  /// Returns true if this [DateTime] occurs at the same week as [other].
  bool isAtSameWeekAs(DateTime other) =>
      firstWeekDay.isAtSameDayAs(other.firstWeekDay);

  /// Returns true if this [DateTime] occurs at the same day as [other].
  bool isAtSameDayAs(DateTime other) =>
      isAtSameMonthAs(other) && day == other.day;

  /// Returns true if this [DateTime] occurs at the same hour as [other].
  bool isAtSameHourAs(DateTime other) =>
      isAtSameDayAs(other) && hour == other.hour;

  /// Returns true if this [DateTime] occurs at the same minute as [other].
  bool isAtSameMinuteAs(DateTime other) =>
      isAtSameHourAs(other) && minute == other.minute;

  /// Returns true if this [DateTime] occurs at the same second as [other].
  bool isAtSameSecondAs(DateTime other) =>
      isAtSameMinuteAs(other) && second == other.second;

  /// Returns true if this [DateTime] occurs at the same millisecond as [other].
  bool isAtSameMillisecondAs(DateTime other) =>
      isAtSameSecondAs(other) && millisecond == other.millisecond;

  /// Returns true if this [DateTime] occurs at the same microsecond as [other].
  bool isAtSameMicrosecondAs(DateTime other) =>
      isAtSameMillisecondAs(other) && microsecond == other.microsecond;

  /// Returns true if this [DateTime] is in the range: [start]..[end].
  bool isBetween(DateTime start, DateTime end) =>
      daysBetween(start, end).contains(toDate());

  /// Returns the number of days in this [DateTime]'s month.
  int get monthLength => daysIn(year, month);

  /// Returns days of this [DateTime]'s week.
  Iterable<DateTime> get weekDays => daysBetween(firstWeekDay, lastWeekDay);

  /// Returns days of this [DateTime]'s month.
  Iterable<DateTime> get monthDays => daysBetween(firstMonthDay, lastMonthDay);

  /// Returns days of this [DateTime]'s year.
  Iterable<DateTime> get yearDays => daysBetween(firstYearDay, lastYearDay);

  /// Returns the next day's [DateTime].
  DateTime get nextDay => add(1.toDays());

  /// Returns the previous day's [DateTime].
  DateTime get previousDay => subtract(1.toDays());

  /// Returns the next week's [DateTime].
  DateTime get nextWeek => add(7.toDays());

  /// Returns the previous week's [DateTime].
  DateTime get previousWeek => subtract(7.toDays());

  /// Returns the next month's [DateTime].
  DateTime get nextMonth => copyWith(month: month + 1);

  /// Returns the previous month's [DateTime].
  DateTime get previousMonth => copyWith(month: month - 1);

  /// Returns the next year's [DateTime].
  DateTime get nextYear => copyWith(year: year + 1);

  /// Returns the previous year's [DateTime].
  DateTime get previousYear => copyWith(year: year - 1);

  /// Returns the first day of this [DateTime]'s week.
  DateTime get firstWeekDay => getFirstWeekDay(this);

  /// Returns the last day of this [DateTime]'s week.
  DateTime get lastWeekDay => getLastWeekDay(this);

  /// Returns the first day of this [DateTime]'s month.
  DateTime get firstMonthDay => getFirstMonthDay(year, month);

  /// Returns the last day of this [DateTime]'s month.
  DateTime get lastMonthDay => getLastMonthDay(year, month);

  /// Returns the first day of this [DateTime]'s year.
  DateTime get firstYearDay => getFirstYearDay(year);

  /// Returns the last day of this [DateTime]'s year.
  DateTime get lastYearDay => getLastYearDay(year);

  /// Returns a string-representation of this [timeZoneOffset]
  /// in digital format.
  String get digitalTimeZoneOffset {
    final hours = timeZoneOffset.inHours.abs();
    final minutes = timeZoneOffset.inMinutes.remainder(60).abs();
    final time = [hours, minutes].map((timeUnit) => timeUnit.toIndex(2));
    return '${timeZoneOffset.inHours < 0 ? '-' : '+'}${time.join(':')}';
  }

  /// Returns only date from this [DateTime].
  DateTime toDate() => DateTime(year, month, day);

  /// Copies this [DateTime] into a new one, allowing to alter some of
  /// its values while keeping the rest unchanged.
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  /// Checks if the [year] is a leap year.
  static bool isLeap(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// Returns the number of days in the [month] of the [year].
  static int daysIn(int year, int month) => DateTime(year, month + 1, 0).day;

  /// Returns days in the [DateTime]'s range: [start]..[end].
  static Iterable<DateTime> daysBetween(DateTime start, DateTime end) {
    if (start.isAtSameDayAs(end) || start.isAfter(end)) {
      throw ArgumentError('Invalid range: $start..$end');
    }
    return Iterable.generate(
      end.difference(start).inDays + 1,
      (index) => DateTime(start.year, start.month, start.day + index),
    );
  }

  /// Returns the first day of the [date]'s week.
  static DateTime getFirstWeekDay(DateTime date) =>
      date.subtract((date.weekday - 1).toDays()).toDate();

  /// Returns the last day of the [date]'s week.
  static DateTime getLastWeekDay(DateTime date) =>
      date.add((DateTime.daysPerWeek - date.weekday).toDays()).toDate();

  /// Returns the first day of the [month] in the [year].
  static DateTime getFirstMonthDay(int year, int month) =>
      DateTime(year, month);

  /// Returns the last day of the [month] in the [year].
  static DateTime getLastMonthDay(int year, int month) =>
      DateTime(year, month, daysIn(year, month));

  /// Returns the first day of the [year].
  static DateTime getFirstYearDay(int year) =>
      getFirstMonthDay(year, DateTime.january);

  /// Returns the last day of the [year].
  static DateTime getLastYearDay(int year) =>
      getLastMonthDay(year, DateTime.december);
}
