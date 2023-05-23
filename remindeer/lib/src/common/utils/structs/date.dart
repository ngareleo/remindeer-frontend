class Date {
  final DateTime date; // date
  final int year;
  final int month;
  final int day;
  final int weekdate;
  final String weekday; // mon, tue, wed

  const Date(
      {required this.date,
      required this.weekday,
      required this.year,
      required this.month,
      required this.weekdate,
      required this.day});

  @override
  String toString() {
    return "[Date] $year $month $day";
  }
}
