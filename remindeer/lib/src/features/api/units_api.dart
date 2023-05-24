import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/unit.dart';

class UnitsAPI {
  Future<List<Unit>> getAllUnits() async {
    var file = await rootBundle.loadString("assets/store/sample_lectures.json");
    var content = Map.from(jsonDecode(file));
    content.updateAll((key, value) => Unit.fromJson(uid: key, json: value));
    return content.values.toList().cast();
  }

  Future<Unit?> getUnit(String uid) async {
    final units = await getAllUnits();
    return units.where((element) => element.uid == uid).firstOrNull;
  }
}
