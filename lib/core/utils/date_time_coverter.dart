import 'dart:convert';

import 'package:intl/intl.dart';

class DateTimeConverter {
  static String getWeekDay(DateTime date) {
    String dayData =
        '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

    return json.decode(dayData)['${date.weekday}'];
  }

  static String getMonth(DateTime date) {
    String monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

    return json.decode(monthData)['${date.month}'];
  }

  static String getTime(DateTime date) {
    DateFormat format = DateFormat('hh:mm a');
    return format.format(date);
  }
}
