enum RepeatFrequency {
  none,
  daily,
  weekly,
  monthly,
  annually,
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

DayOfWeek mapToDayOfWeek(int num) {
  return DayOfWeek.values[num];
}
