import 'package:remindeer/src/models/timetable.dart';

class TimetableAPI {
  List<Timetable> getTimetables() {
    return [
      Timetable(
          uid: "4343",
          label: "2022/23 Intelligent systems",
          description: "Timetable for 2022/23 academic year",
          validUntil: DateTime(2023, 8, 10),
          created: DateTime.now(),
          lastModified: DateTime.now()),
      Timetable(
          uid: "435345",
          label: "School Timetable",
          description: "Timetable for classes",
          validUntil: DateTime(2020, 0, 0, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime(2020, 0, 0, 0)),
      Timetable(
          uid: "323234",
          label: "Meal Timetable",
          description: "Timetable for classes",
          validUntil: DateTime(2020, 0, 0, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime(2020, 0, 0, 0)),
    ];
  }
}
