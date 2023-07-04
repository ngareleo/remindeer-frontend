import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/semester.dart';

class SemestersAPI {
  Future<List<Semester>> getAllSemesters() async {
    var store =
        await rootBundle.loadString("assets/store/sample_semesters.json");
    var content = Map.from(jsonDecode(store));
    var semesters = <Semester>[];
    for (final entry in content.entries) {
      semesters.add(Semester.fromJson(uid: entry.key, json: entry.value));
    }
    return semesters;
  }

  Future<Semester?> getSemester(String uid) async {
    final semesters = await getAllSemesters();
    return semesters.where((element) => element.uid == uid).firstOrNull;
  }
}
