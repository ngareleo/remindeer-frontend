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
