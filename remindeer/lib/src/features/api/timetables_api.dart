import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/timetable.dart';

class TimetableAPI {
  Future<List<Timetable>> getTimetables() async {
    var store =
        await rootBundle.loadString("assets/store/sample_timetables.json");
    var content = Map.from(jsonDecode(store));
    var timetables = <Timetable>[];
    for (final entry in content.entries) {
      timetables.add(Timetable.fromJson(uid: entry.key, json: entry.value));
    }
    return timetables;
  }

  Future<Timetable?> getTimetable(String uid) async {
    final timetables = await getTimetables();
    return timetables.where((element) => element.uid == uid).firstOrNull;
  }
}
