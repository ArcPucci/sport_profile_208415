import 'package:intl/intl.dart';

extension DatetimeExtensions on DateTime {
  String get shortWeek =>
      DateFormat("E").format(this).substring(0, 2).toUpperCase();
}
