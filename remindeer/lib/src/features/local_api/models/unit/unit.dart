import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';

import '../event/event.dart';
import '../homework/homework.dart';
import '../lecture/lecture.dart';
import '../resource.dart';
import '../semester/semester.dart';
import '../task/task.dart';
part 'unit.g.dart';

const _resourceName = "Unit";

@Collection()
@Name(_resourceName)
class Unit extends Resource {
  Id? id;
  late String name;

  @Name("object_id")
  String? objectID;

  String? owner;

  @Name("unit_code")
  late String unitCode;

  String? description;
  late String lecturer;

  final semester = IsarLink<Semester>();

  @Backlink(to: "unit")
  final homeworks = IsarLinks<Homework>();

  @Backlink(to: "unit")
  final lectures = IsarLinks<Lecture>();

  @Backlink(to: "unit")
  final tasks = IsarLinks<Task>();

  @Backlink(to: "unit")
  final events = IsarLinks<Event>();

  late DateTime created = DateTime.now();

  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Unit({
    this.id,
    required this.name,
    required this.unitCode,
    this.description,
    required this.lecturer,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final name = json["name"].toString();
    final unitCode = json["unit_code"].toString();
    final description = json["description"].toString();
    final lecturer = json["lecturer"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    final owner = json["owner"].toString();

    return Unit(
      name: name,
      description: description,
      unitCode: unitCode,
      lecturer: lecturer,
    )
      ..objectID = objectID
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified)
      ..owner = owner;
  }

  @override
  dynamic toJson() => {
        "_id": objectID,
        "name": name,
        "unit_code": unitCode,
        "description": description,
        "lecturer": lecturer,
        "created_at": created.toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
        "owner": owner,
      };

  void updateFromServerCopy(Unit unit) {
    objectID = unit.objectID;
    owner = unit.owner;
    name = unit.name;
    unitCode = unit.unitCode;
    description = unit.description;
    lecturer = unit.lecturer;
    lastModified = unit.lastModified;
  }

  dynamic toJsonWithAssociation(String semesterObjectID) =>
      Map.from(toJson()).addAll({"semester_id": semesterObjectID});

  @override
  String toString() {
    return "[Unit] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: name,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
      onTap: () => {},
    );
  }
}
