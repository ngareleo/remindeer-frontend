enum RepeatFrequency {
  none,
  daily,
  weekly,
  monthly,
  annually,
}

enum DaysOfWeek {
  monday('Mon', "Monday"),
  tuesday('Tue', "Tuesday"),
  wednesday('Wed', "Wednesday"),
  thursday('Thu', "Thursday"),
  friday('Fri', "Friday"),
  saturday('Sat', "Saturday"),
  sunday('Sun', "Sunday");

  const DaysOfWeek(this.value, this.fullValue);
  final String value;
  final String fullValue;
}

enum MonthsOfYear {
  jan("Jan", "January"),
  feb("Feb", "February"),
  mar("Mar", "March"),
  apr("Apr", "April"),
  may("May", "May"),
  jun("Jun", "June"),
  jul("Jul", "July"),
  aug("Aug", "August"),
  sep("Sep", "September"),
  oct("Oct", "October"),
  nov("Nov", "November"),
  dec("Dec", "December");

  const MonthsOfYear(this.value, this.fullValue);
  final String value;
  final String fullValue;
}

DaysOfWeek mapToDayOfWeek(int num) {
  return DaysOfWeek.values[num];
}
