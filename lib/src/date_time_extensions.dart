import 'number_extensions.dart';

/// Extensions for [DateTime].
extension DateTimeX on DateTime {
  /// Epoch [DateTime].
  static final epoch = DateTime.fromMicrosecondsSinceEpoch(0);

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
      getDaysRange(start, end).contains(toDate());

  /// Returns the age for the current date in the next format - [31, 2, 3, 6]:
  /// `[31, 2, 3, 6] corresponds to 31 years, 2 months, 3 weeks and 6 days`.
  List<int> get age => getTimeBetween(this, DateTimeX.today);

  /// Returns the day of the [year].
  int get yearDay => getDaysBetween(firstYearDay, this) + 1;

  /// Returns the number of days in this [DateTime]'s month.
  int get monthLength => getDaysPerMonth(year, month);

  /// Returns the number of days in this [DateTime]'s year.
  int get yearLength => getDaysPerYear(year);

  /// Returns days of this [DateTime]'s week.
  Iterable<DateTime> get weekDays => getDaysRange(firstWeekDay, lastWeekDay);

  /// Returns days of this [DateTime]'s month.
  Iterable<DateTime> get monthDays => getDaysRange(firstMonthDay, lastMonthDay);

  /// Returns days of this [DateTime]'s year.
  Iterable<DateTime> get yearDays => getDaysRange(firstYearDay, lastYearDay);

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

  /// Returns the time until [date] in the next format - [31, 2, 3, 6]:
  /// `[31, 2, 3, 6] corresponds to 31 years, 2 months, 3 weeks and 6 days`.
  List<int> timeUntil(DateTime date) => getTimeBetween(this, date);

  /// Returns the number of full years until [date].
  int yearsUntil(DateTime date) => getYearsBetween(this, date);

  /// Returns the number of full months until [date].
  int monthsUntil(DateTime date) => getMonthsBetween(this, date);

  /// Returns the number of full weeks until [date].
  int weeksUntil(DateTime date) => getWeeksBetween(this, date);

  /// Returns the number of days until [date].
  int daysUntil(DateTime date) => getDaysBetween(this, date);

  /// Returns the number of hours until [date].
  int hoursUntil(DateTime date) => getHoursBetween(this, date);

  /// Returns the number of minutes until [date].
  int minutesUntil(DateTime date) => getMinutesBetween(this, date);

  /// Returns the number of seconds until [date].
  int secondsUntil(DateTime date) => getSecondsBetween(this, date);

  /// Returns the number of milliseconds until [date].
  int millisecondsUntil(DateTime date) => getMillisecondsBetween(this, date);

  /// Returns the number of microseconds until [date].
  int microsecondsUntil(DateTime date) => getMicrosecondsBetween(this, date);

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
  static int getDaysPerMonth(int year, int month) =>
      DateTime(year, month + 1, 0).day;

  /// Returns the number of days in the [year].
  static int getDaysPerYear(int year) => isLeap(year) ? 366 : 365;

  /// Returns days in the [DateTime]'s range: [start]..[end].
  static Iterable<DateTime> getDaysRange(DateTime start, DateTime end) {
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
      DateTime(year, month, getDaysPerMonth(year, month));

  /// Returns the first day of the [year].
  static DateTime getFirstYearDay(int year) =>
      getFirstMonthDay(year, DateTime.january);

  /// Returns the last day of the [year].
  static DateTime getLastYearDay(int year) =>
      getLastMonthDay(year, DateTime.december);

  /// Returns the time between [start] and [end] dates in
  /// years, months, weeks and days. For example:
  /// `[31, 2, 3, 6] corresponds to 31 years, 2 months, 3 weeks and 6 days`.
  static List<int> getTimeBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');

    const monthsPerYear = DateTime.monthsPerYear;
    const daysPerWeek = DateTime.daysPerWeek;

    var years = end.year - start.year;
    var months = end.month - start.month;
    var days = end.day - start.day;

    final totalMonths = monthsPerYear * years + months;
    years = (totalMonths / monthsPerYear).floor();
    months = totalMonths % monthsPerYear;

    if (end.day < start.day) {
      days = getDaysPerMonth(start.year, start.month) + days;
      if (months > 0) {
        months--;
      } else {
        years--;
        months = monthsPerYear - 1;
      }
    }
    return [years, months, (days / daysPerWeek).floor(), days % daysPerWeek];
  }

  /// Returns the number of full years between [start] and [end] dates.
  static int getYearsBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return getTimeBetween(start, end)[0];
  }

  /// Returns the number of full months between [start] and [end] dates.
  static int getMonthsBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    final duration = getTimeBetween(start, end);
    return duration[0] * DateTime.monthsPerYear + duration[1];
  }

  /// Returns the number of full weeks between [start] and [end] dates.
  static int getWeeksBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return (end.difference(start).inDays / DateTime.daysPerWeek).floor();
  }

  /// Returns the number of days between [start] and [end] dates.
  static int getDaysBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inDays;
  }

  /// Returns the number of hours between [start] and [end] dates.
  static int getHoursBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inHours;
  }

  /// Returns the number of minutes between [start] and [end] dates.
  static int getMinutesBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inMinutes;
  }

  /// Returns the number of seconds between [start] and [end] dates.
  static int getSecondsBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inSeconds;
  }

  /// Returns the number of milliseconds between [start] and [end] dates.
  static int getMillisecondsBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inMilliseconds;
  }

  /// Returns the number of microseconds between [start] and [end] dates.
  static int getMicrosecondsBetween(DateTime start, DateTime end) {
    if (start.isAfter(end)) throw ArgumentError('Invalid range: $start..$end');
    return end.difference(start).inMicroseconds;
  }
}
