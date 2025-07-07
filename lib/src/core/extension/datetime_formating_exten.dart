import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String toCustomFormattedTime() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));
    final inputDate = DateTime(year, month, day); // `this` ka date part

    String timePart = DateFormat('hh:mm a').format(this); // 08:30 AM

    if (inputDate == today) {
      return 'Today $timePart';
    } else if (inputDate == tomorrow) {
      return 'Tomorrow $timePart';
    } else {
      return DateFormat('dd/MM/yy hh:mm a').format(this);
    }
  }
}
