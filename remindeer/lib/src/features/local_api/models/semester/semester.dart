import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/screens/pages/semester/semester_dashboard.dart';

import '../event/event.dart';
import '../homework/homework.dart';
import '../resource.dart';
import '../task/task.dart';
import '../timetable/timetable.dart';
import '../unit/unit.dart';
part 'semester.g.dart';

const _resourceName = "Semester";

@Collection()
@Name(_resourceName)
class Semester extends Resource {
  Id? id;
  late String label;

  @Name("object_id")
  String? objectID;

  String? owner;

  String? descrption;
  late DateTime from = DateTime.now();
  late DateTime to;
  late DateTime created = DateTime.now();

  @Backlink(to: "semester")
  final timetables = IsarLinks<Timetable>();

  @Backlink(to: "semester")
  final tasks = IsarLinks<Task>();

  @Backlink(to: "semester")
  final units = IsarLinks<Unit>();

  @Backlink(to: "semester")
  final events = IsarLinks<Event>();

  @Backlink(to: "semester")
  final homeworks = IsarLinks<Homework>();

  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Semester(
      {required this.label,
      required this.to,
      this.descrption,
      required this.from});

  factory Semester.fromNewSemesterForm(
      {required String label, required DateTime to}) {
    return Semester(
      label: label,
      to: to,
      from: DateTime.now(),
    );
  }

  void updateFromServerCopy(Semester newSemester) {
    label = newSemester.label;
    to = newSemester.to;
    from = newSemester.from;
    descrption = newSemester.descrption;
    lastModified = newSemester.lastModified;
    objectID = newSemester.objectID;
    owner = newSemester.owner;
    lastModified = newSemester.lastModified;
  }

  factory Semester.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final created = json["created_at"].toString();
    final lastModified = json["updated_at"].toString();
    final from = json["from"].toString();
    final to = json["to"].toString();
    final label = json["label"].toString();
    final description = json["description"].toString();
    final owner = json["owner"].toString();

    return Semester(
      label: label,
      descrption: description,
      from: DateTime.parse(from),
      to: DateTime.parse(to),
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
        "description": descrption,
        "from": from.toIso8601String(),
        "to": to.toIso8601String(),
        "created_at": created.toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
        "owner": owner,
      };

  @override
  String toString() {
    return "[Semester] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      trailingText: convertToReadableDifference(lastModified),
      tag: _resourceName,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SemesterDashboardPage(
                      semesterId: id!,
                    )));
      },
    );
  }

  Widget toSemesterPageCardItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SemesterDashboardPage(
                      semesterId: id!,
                    )));
      },
    );
  }
}
