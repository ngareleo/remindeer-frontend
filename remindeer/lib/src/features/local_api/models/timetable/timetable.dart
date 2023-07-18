import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/screens/pages/timetable/timetable_dashboard.dart';

import '../lecture/lecture.dart';
import '../resource.dart';
import '../semester/semester.dart';
import '../task/task.dart';

part 'timetable.g.dart';

const _resourceName = "Timetable";

@Collection()
@Name(_resourceName)
class Timetable extends Resource {
  Id? id;
  late String label;
  String? description;

  @Name("object_id")
  String? objectID;

  String? owner;

  final semester = IsarLink<Semester>();

  @Backlink(to: "timetable")
  final events = IsarLinks<Event>();

  @Backlink(to: "timetable")
  final lectures = IsarLinks<Lecture>();

  @Backlink(to: "timetable")
  final tasks = IsarLinks<Task>();

  @Name("valid_until")
  late DateTime validUntil;
  late DateTime created = DateTime.now();

  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Timetable({
    required this.label,
    required this.validUntil,
    this.description,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final owner = json["owner"].toString();
    final label = json["label"].toString();
    final description = json["description"].toString();
    final validUntil = json["valid_until"].toString();
    final created = json["created_at"].toString();
    final lastModified = json["updated_at"].toString();
    return Timetable(
      label: label,
      description: description,
      validUntil: DateTime.parse(validUntil),
    )
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified)
      ..objectID = objectID
      ..owner = owner;
  }

  @override
  dynamic toJson() => {
        "_id": objectID,
        "owner": owner,
        "label": label,
        "description": description,
        "valid_until": validUntil.toIso8601String(),
        "created_at": created.toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
      };

  dynamic toJsonWithAssociation(String semesterObjectID) =>
      Map.from(toJson())..addAll({"semesterId": semesterObjectID});

  dynamic updateFromServerCopy(Timetable newTimetable) {
    objectID = newTimetable.objectID;
    owner = newTimetable.owner;
    label = newTimetable.label;
    description = newTimetable.description;
    validUntil = newTimetable.validUntil;
    lastModified = newTimetable.lastModified;
  }

  @override
  String toString() {
    return "[Timetable] ${toJson()}";
  }

  @override
  Widget toResourceItem(
    BuildContext context,
  ) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TimetableHomePage(
                      timetableId:
                          id!, // every resource that calls this function has been fetched from the database, so it has an id
                    )));
      },
    );
  }
}
