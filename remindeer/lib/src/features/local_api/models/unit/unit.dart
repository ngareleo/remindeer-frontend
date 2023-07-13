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

  factory Unit.fromJson(
      {required String uid, required Map<String, dynamic> json}) {
    final name = json["name"].toString();
    final unitCode = json["unit_code"].toString();
    final description = json["descrption"].toString();
    final lecturer = json["lecturer"].toString();
    // final created = json["created"].toString();
    // final lastModified = json["last_modified"].toString();
    return Unit(
      name: name,
      description: description,
      unitCode: unitCode,
      lecturer: lecturer,
    );
  }

  dynamic toJson() {
    return {
      "name": name,
      "unit_code": unitCode,
      "description": description,
      "lecturer": lecturer,
      "created": created.toString(),
      "last_modified": lastModified.toString()
    };
  }

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
