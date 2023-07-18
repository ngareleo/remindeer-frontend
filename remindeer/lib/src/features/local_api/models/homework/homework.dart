import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card_expanded.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';

import '../resource.dart';
import '../unit/unit.dart';

part 'homework.g.dart';

const _resourceName = "Homework";

@Collection()
@Name(_resourceName)
class Homework extends Resource {
  Id? id;
  late String label;
  String? description;
  DateTime due;

  @Name("object_id")
  String? objectID;

  String? owner;

  final unit = IsarLink<Unit>();
  final semester = IsarLink<Semester>();

  DateTime? completed;
  late DateTime created = DateTime.now();
  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Homework({
    required this.label,
    this.description,
    required this.due,
  });

  factory Homework.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final owner = json["owner"].toString();
    final label = json["label"].toString();
    final description = json["description"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    final due = json["due"].toString();
    final completed = json["completed"].toString();

    return Homework(
      label: label,
      description: description,
      due: DateTime.parse(due),
    )
      ..completed = DateTime.parse(completed)
      ..objectID = objectID
      ..owner = owner
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified);
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCardExpanded(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
      additionalText: getReadableDuration(due),
    );
  }

  @override
  dynamic toJson() => {
        "_id": objectID,
        "label": label,
        "description": description,
        "due": due.toIso8601String(),
        "completed": completed?.toIso8601String(),
        "owner": owner,
        "created_at": created.toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
      };

  dynamic toJsonWithAssociation(
          {String? unitObjectID, String? semesterObjectID}) =>
      Map.from(toJson()).addAll({
        "unit_id": unitObjectID,
        "semester_id": semesterObjectID,
      });

  void updateFromServerCopy(Homework newCopy) {
    objectID = newCopy.objectID;
    owner = newCopy.owner;
    label = newCopy.label;
    description = newCopy.description;
    due = newCopy.due;
    completed = newCopy.completed;
  }
}
