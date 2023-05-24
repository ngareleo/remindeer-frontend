import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/timetable.dart';

class TimetableAPI {
  Future<List<Timetable>> getTimetables() async {
    var store =
        await rootBundle.loadString("assets/store/sample_lectures.json");
    var content = Map.from(jsonDecode(store));
    content
        .updateAll((key, value) => Timetable.fromJson(uid: key, json: value));
    return content.values.toList().cast();
  }

  Future<Timetable?> getTimetable(String uid) async {
    final timetables = await getTimetables();
    return timetables.where((element) => element.uid == uid).firstOrNull;
  }
}
