import 'package:intl/intl.dart';

extension DatetimeExtensions on DateTime {
  String get shortWeek =>
      DateFormat("E").format(this).substring(0, 2).toUpperCase();

  String get fullFormat => DateFormat('dd.MM.yyyy, hh:mm a').format(this);

  String get shortDate => DateFormat("dd.MM.yyyy").format(this);

  String get monthAndYear => DateFormat("MMMM, yyyy").format(this);

  DateTime get withZeroTime => DateTime(year, month, day);
}
