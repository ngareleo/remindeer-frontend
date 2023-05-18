enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

class Lecture {
  final String? uid;
  final DayOfWeek? dayOfWeek;
  final DateTime? from;
  final DateTime? to;
  final String? venue;
  final DateTime? created;
  final DateTime? lastModified;

  const Lecture(
      {required this.uid,
      this.dayOfWeek,
      this.from,
      this.to,
      this.venue,
      this.created,
      this.lastModified});
}
