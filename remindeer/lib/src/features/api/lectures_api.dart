import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/features/api/units_api.dart';
import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';

class LecturesAPI {
  List<Lecture> getLectures() {
    var units = UnitsAPI().getUnits();
    var timetables = TimetableAPI().getTimetables();

    return [
      Lecture(
          uid: "0001",
          timetable: timetables[0],
          unit: units[0],
          venue: "HHA",
          window: Window(
            from: DateTime(0, 0, 0, 7, 0),
            to: DateTime(0, 0, 0, 7, 0),
          ),
          repeatTo: DateTime(2023, 8, 12, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Lecture(
          uid: "0001",
          timetable: timetables[0],
          unit: units[1],
          venue: "HHA",
          window: Window(
            from: DateTime(0, 0, 0, 7, 0),
            to: DateTime(0, 0, 0, 7, 0),
          ),
          repeatTo: DateTime(2023, 8, 12, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Lecture(
          uid: "0001",
          timetable: timetables[0],
          unit: units[3],
          venue: "HHA",
          window: Window(
            from: DateTime(0, 0, 0, 7, 0),
            to: DateTime(0, 0, 0, 7, 0),
          ),
          repeatTo: DateTime(2023, 8, 12, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Lecture(
          uid: "0001",
          timetable: timetables[0],
          unit: units[4],
          venue: "HHA",
          window: Window(
            from: DateTime(0, 0, 0, 7, 0),
            to: DateTime(0, 0, 0, 7, 0),
          ),
          repeatTo: DateTime(2023, 8, 12, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Lecture(
          uid: "0001",
          timetable: timetables[0],
          unit: units[5],
          venue: "HHA",
          window: Window(
            from: DateTime(0, 0, 0, 7, 0),
            to: DateTime(0, 0, 0, 7, 0),
          ),
          repeatTo: DateTime(2023, 8, 12, 0, 0),
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
    ];
  }
}
