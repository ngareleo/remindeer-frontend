import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/features/api/units_api.dart';
import 'package:remindeer/src/models/lecture.dart';

class LecturesAPI {
  Future<List<Lecture>> getAllLectures() async {
    var store =
        await rootBundle.loadString("assets/store/sample_lectures.json");
    var content = Map.from(jsonDecode(store));
    var lectures = <Lecture>[];
    for (final entry in content.entries) {
      var unitUid = entry.value["unit"].toString();
      var timetableUid = entry.value["timetable"].toString();
      final unit = await UnitsAPI().getUnit(unitUid);
      final timetable = await TimetableAPI().getTimetable(timetableUid);
      lectures.add(Lecture.fromJson(
          uid: entry.key, json: entry.value, unit: unit, timetable: timetable));
    }
    return lectures;
  }

  Future<Lecture?> getLecture(String uid) async {
    final timetables = await getAllLectures();
    return timetables.where((element) => element.uid == uid).firstOrNull;
  }
}
