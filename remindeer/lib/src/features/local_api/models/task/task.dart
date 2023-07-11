import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';

import '../event/event.dart';
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

  @Name("repeat_to")
  int? repeatTo;
  DateTime? due;
  DateTime? completed;
  final DateTime created = DateTime.now();

  final timetable = IsarLink<Timetable>();
  final unit = IsarLink<Unit>();
  final semester = IsarLink<Semester>();

  @Name("last_modified")
  final DateTime lastModified = DateTime.now();

  Task({
    required this.label,
    this.description,
    this.venue,
    this.due,
    this.repeat,
    this.repeatTo,
    this.completed,
  });

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
    );
  }
}
