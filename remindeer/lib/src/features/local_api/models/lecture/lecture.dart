import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/values.dart';

import '../resource.dart';
import '../timetable/timetable.dart';
import '../unit/unit.dart';

part 'lecture.g.dart';

const _resourceName = "Lecture";

@Collection()
class Lecture extends Resource {
  Id? id;
  late String label;
  late String venue;
  String? description;

  final unit = IsarLink<Unit>();
  final timetable = IsarLink<Timetable>();

  @enumerated
  @Name("date_of_week")
  late DaysOfWeek dayOfWeek;
  late Window window;

  @Name("repeat_to")
  late DateTime repeatTo;

  @Name("created")
  late DateTime created = DateTime.now();

  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Lecture({
    required this.dayOfWeek,
    required this.label,
    required this.venue,
    this.description,
    required this.window,
    required this.repeatTo,
  });

  factory Lecture.fromJson(
      {required String uid,
      required Map<String, dynamic> json,
      required Unit? unit,
      required Timetable? timetable}) {
    // final created = json["created"].toString();
    // final lastModified = json["last_modified"].toString();
    final repeatTo = json["repeat_to"].toString();
    final from = json["from"].toString();
    final to = json["to"].toString();
    final dayOfWeek = json["day_of_week"].toString();
    final venue = json["venue"].toString();
    return Lecture(
      label: "",
      venue: venue,
      window: Window(from: int.parse(from), to: int.parse(to)),
      repeatTo: DateTime.parse(repeatTo),
      dayOfWeek: mapToDayOfWeek(int.parse(dayOfWeek)),
    );
  }

  dynamic toJson() {
    return {
      "unit": unit.load(),
      "timetable": timetable.load(),
      "venue": venue,
      "from": window.from,
      "to": window.to,
      "repeat_to": repeatTo.toString(),
      "created": created.toString(),
      "last_modified": lastModified.toString(),
      "day_of_week": dayOfWeek.index
    };
  }

  @override
  String toString() {
    return "[Lecture] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      lastModified: lastModified.toString(),
    );
  }
}

@embedded
class Window {
  final int? from;
  final int? to;
  Window({
    this.from,
    this.to,
  });
}
