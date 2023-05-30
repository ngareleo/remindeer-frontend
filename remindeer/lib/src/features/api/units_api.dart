import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/unit.dart';

class UnitsAPI {
  Future<List<Unit>> getAllUnits() async {
    var file = await rootBundle.loadString("assets/store/sample_lectures.json");
    var content = Map.from(jsonDecode(file));
    var units = <Unit>[];
    for (final entry in content.entries) {
      units.add(Unit.fromJson(uid: entry.key, json: entry.value));
    }
    return units;
  }

  Future<Unit?> getUnit(String uid) async {
    final units = await getAllUnits();
    return units.where((element) => element.uid == uid).firstOrNull;
  }
}
