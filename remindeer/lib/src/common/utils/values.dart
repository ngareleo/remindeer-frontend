enum RepeatFrequency {
  none,
  daily,
  weekly,
  monthly,
  annually,
}

enum DaysOfWeek {
  monday('Mon'),
  tuesday('Tue'),
  wednesday('Wed'),
  thursday('Thu'),
  friday('Fri'),
  saturday('Sat'),
  sunday('Sun');

  const DaysOfWeek(this.value);
  final String value;
}

enum MonthsOfYear {
  jan("Jan"),
  feb("Feb"),
  mar("Mar"),
  apr("Apr"),
  may("May"),
  jun("Jun"),
  jul("Jul"),
  aug("Aug"),
  sep("Sep"),
  oct("Oct"),
  nov("Nov"),
  dec("Dec");

  const MonthsOfYear(this.value);
  final String value;
}

DaysOfWeek mapToDayOfWeek(int num) {
  return DaysOfWeek.values[num];
}
