import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
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

  @Name("object_id")
  late String objectID;

  String? owner;

  final unit = IsarLink<Unit>();
  final timetable = IsarLink<Timetable>();

  @enumerated
  late DaysOfWeek dayOfWeek;
  late LectureWindow window;

  @Name("repeat_to")
  late DateTime repeatTo;
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

  factory Lecture.fromJson(Map<String, dynamic> json) {
    final created = json["created_at"].toString();
    final lastModified = json["updated_at"].toString();
    final repeatTo = json["repeat_to"].toString();
    final from = json["from"].toString();
    final to = json["to"].toString();
    final dayOfWeek = json["day_of_week"].toString();
    final venue = json["venue"].toString();
    final label = json["label"].toString();
    final objectID = json["_id"].toString();
    final descriptions = json["description"].toString();
    final owner = json["owner"].toString();

    return Lecture(
      label: label,
      description: descriptions,
      venue: venue,
      window: LectureWindow(from: int.parse(from), to: int.parse(to)),
      repeatTo: DateTime.parse(repeatTo),
      dayOfWeek: mapToDayOfWeek(int.parse(dayOfWeek)),
    )
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified)
      ..objectID = objectID
      ..owner = owner;
  }

  @override
  dynamic toJson() => {
        "_id": objectID,
        "label": label,
        "description": description ?? "",
        "from": window.from,
        "to": window.to,
        "venue": venue,
        "repeat_to": repeatTo.toIso8601String(),
        "day": dayOfWeek.fullValue,
        "owner": owner,
        "created_at": created..toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
      };

  @override
  String toString() => "[Lecture] ${toJson()}";

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
    );
  }
}

@embedded
class LectureWindow {
  final int? from;
  final int? to;
  LectureWindow({
    this.from,
    this.to,
  });

  dynamic toJson() => {
        "from": from,
        "to": to,
      };
}
