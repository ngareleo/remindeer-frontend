import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';

import '../resource.dart';
import '../semester/semester.dart';
import '../timetable/timetable.dart';
import '../unit/unit.dart';
part 'task.g.dart';

const _resourceName = "Task";

@Collection()
@Name(_resourceName)
class Task extends Resource {
  Id? id;
  late String label;
  String? venue;
  String? description;
  bool? repeat;

  @Name("object_id")
  String? objectID;

  String? owner;

  @Name("repeat_to")
  DateTime? repeatTo;

  DateTime? due;
  DateTime? completed;

  final timetable = IsarLink<Timetable>();
  final unit = IsarLink<Unit>();
  final semester = IsarLink<Semester>();

  DateTime created = DateTime.now();

  @Name("last_modified")
  DateTime lastModified = DateTime.now();

  Task({
    required this.label,
    this.description,
    this.venue,
    this.due,
    this.repeat,
    this.repeatTo,
    this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final label = json["label"].toString();
    final description = json["description"].toString();
    final venue = json["venue"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    final due = json["due"].toString();
    final completed = json["completed"].toString();
    final repeat = json["repeat"].toString();
    final repeatTo = json["repeat_to"].toString();
    final owner = json["owner"].toString();

    return Task(
      label: label,
      description: description,
      venue: venue,
      due: DateTime.parse(due),
      repeat: bool.parse(repeat),
      repeatTo: DateTime.parse(repeatTo),
    )
      ..completed = DateTime.parse(completed)
      ..objectID = objectID
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified)
      ..owner = owner;
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
    );
  }

  @override
  dynamic toJson() => {
        "_id": objectID,
        "label": label,
        "description": description,
        "venue": venue,
        "due": due?.toIso8601String(),
        "repeat": repeat,
        "repeat_to": repeatTo?.toIso8601String(),
        "completed": completed?.toIso8601String(),
        "created": created.toIso8601String(),
        "last_modified": lastModified.toIso8601String(),
        "owner": owner,
      };

  dynamic toJsonWithAssociation({
    String? timetableObjectID,
    String? unitObjectID,
    String? semesterObjectID,
  }) =>
      Map.from(toJson()).addAll({
        "timetable_id": timetableObjectID,
        "unit_id": unitObjectID,
        "semester_id": semesterObjectID,
      });

  void updateFromServerCopy(Task newCopy) {
    label = newCopy.label;
    description = newCopy.description;
    venue = newCopy.venue;
    due = newCopy.due;
    repeat = newCopy.repeat;
    repeatTo = newCopy.repeatTo;
    completed = newCopy.completed;
    lastModified = newCopy.lastModified;
    owner = newCopy.owner;
    objectID = newCopy.objectID;
  }
}
