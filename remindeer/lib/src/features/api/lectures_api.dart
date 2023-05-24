import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/lecture.dart';

class LecturesAPI {
  Future<List<Lecture>> getLectures() async {
    final file =
        await rootBundle.loadString("assets/store/sample_lectures.json");
    var values = Map.from(jsonDecode(file));
    return [];
  }

  Future<List<Lecture>> getLecturesByDate(DateTime date) async {
    return (await getLectures()).where((element) {
      return element.eventDate?.weekday == date.weekday;
    }).toList();
  }
}
