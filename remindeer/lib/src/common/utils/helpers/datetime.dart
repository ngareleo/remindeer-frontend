import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remindeer/src/common/utils/structs/date.dart';

Map<int, String> mapMonthToString() {
  return {
    0: "Jan",
    1: "Feb",
    2: "Mar",
    3: "Apr",
    4: "May",
    5: "Jun",
    6: "Jul",
    7: "Aug",
    8: "Sep",
    9: "Oct",
    10: "Nov",
    11: "Dec"
  };
}

List<Map<int, Date>> fillWeeks({required DateTime seed}) {
  var days = ['Mon', 'Tue', 'We', 'Thu', 'Fri', 'Sat', 'Sun'];

  var firstMondayTwoWeeksAgo = seed.weekday == DateTime.monday
      ? seed.subtract(const Duration(days: 14))
      : seed.subtract(Duration(days: seed.weekday + 13));

  var weeks = <Map<int, Date>>[];
  for (int j = 0; j < 4; j++) {
    var map = <int, Date>{};
    for (int i = 0; i < 7; i++) {
      var next = firstMondayTwoWeeksAgo.add(Duration(days: j * 7 + i));
      map.addAll({
        next.day: Date(
            date: next,
            weekday: days[next.weekday - 1],
            year: next.year,
            month: next.month,
            weekdate: next.weekday,
            day: next.day)
      });
    }
    weeks.add(map);
  }
  return weeks;
}

String convertToReadableTime(int hours, int minutes) {
  DateTime now = DateTime.now();
  DateTime time = DateTime(now.year, now.month, now.day, hours, minutes);
  String formattedTime = DateFormat.jm().format(time);
  return formattedTime;
}

TimeOfDay convertFromPersistenceFormat(int n) {
  return TimeOfDay(hour: (n / 100).floor(), minute: n % 100);
}

String convertToReadableDifference(DateTime lastModified) {
  final String? time;
  if (lastModified.difference(DateTime.now()).inMinutes.abs() < 60) {
    time =
        "${lastModified.difference(DateTime.now()).inMinutes.abs().toString()}min ago";
  } else if (lastModified.difference(DateTime.now()).inHours.abs() < 24) {
    time =
        "${lastModified.difference(DateTime.now()).inHours.abs().toString()}h ago";
  } else if (lastModified.difference(DateTime.now()).inDays.abs() < 30) {
    time = "${lastModified.difference(DateTime.now()).inDays.abs()}d ago";
  } else if (lastModified.difference(DateTime.now()).inDays.abs() < 365) {
    time = "${lastModified.difference(DateTime.now()).inDays.abs() / 30}mo ago";
  } else {
    time = "${lastModified.difference(DateTime.now()).inDays.abs() / 365}y ago";
  }
  return time;
}

String getReadableDuration(DateTime targetDateTime) {
  final now = DateTime.now();
  final duration = targetDateTime.difference(now);

  if (duration.isNegative) {
    return 'Overdue';
  } else if (duration.inMinutes < 1) {
    return 'Due soon';
  } else if (duration.inMinutes < 60) {
    return 'Due ${duration.inMinutes} mins';
  } else if (duration.inHours < 24) {
    return 'Due ${duration.inHours} hours';
  } else {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    String result = 'Due ';
    if (days > 0) {
      result += '$days day${days > 1 ? 's' : ''}';
      if (hours > 0 || minutes > 0) {
        result += ' ';
      }
    }
    if (hours > 0) {
      result += '$hours hour${hours > 1 ? 's' : ''}';
      if (minutes > 0) {
        result += ' ';
      }
    }
    if (minutes > 0) {
      result += '$minutes min${minutes > 1 ? 's' : ''}';
    }

    return result;
  }
}
