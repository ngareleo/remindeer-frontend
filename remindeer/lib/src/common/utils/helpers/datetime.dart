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

int getMonthLimit({required int month, required int year}) {
  var limits = {
    0: 31,
    1: year % 4 == 0 ? 28 : 29,
    2: 31,
    3: 30,
    4: 31,
    5: 30,
    6: 31,
    7: 31,
    8: 30,
    9: 31,
    10: 30,
    11: 31,
  };
  return limits[month] ?? 31;
}

Map<int, String> fillDays({required DateTime seed}) {
  var days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  var map = {seed.day: days[seed.weekday]};
  for (int i = 0; i < 15; i++) {
    var forward = seed.add(Duration(days: i));
    var backward = seed.subtract(Duration(days: i));
    map.addAll({forward.day: days[forward.weekday]});
    map.addAll({backward.day: days[backward.weekday]});
  }
  return map;
}
