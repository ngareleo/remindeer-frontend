import 'package:remindeer/src/models/timetable.dart';

class TimetableAPI {
  List<Timetable> getTimetables() {
    return [
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
