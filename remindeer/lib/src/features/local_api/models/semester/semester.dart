import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
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

  factory Semester.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) {
    // var created = json["created"].toString();
    // var lastModified = json["last_modified"].toString();
    var from = json["from"].toString();
    var to = json["to"].toString();
    var name = json["name"].toString();
    var description = json["description"].toString();

    return Semester(
      label: name,
      descrption: description,
      from: DateTime.parse(from),
      to: DateTime.parse(to),
    );
  }

  dynamic toJson() {
    return {
      "name": label,
      "description": descrption,
      "from": from.toString(),
      "to": to.toString(),
      "created": created.toString(),
      "last_modified": lastModified.toString()
    };
  }

  @override
  String toString() {
    return "[Semester] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
      label: label,
      lastModified: timeBtwn.toString(),
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
