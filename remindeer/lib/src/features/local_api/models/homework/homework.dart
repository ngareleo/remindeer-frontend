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

  final unit = IsarLink<Unit>();
  final semester = IsarLink<Semester>();

  late DateTime created = DateTime.now();
  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Homework({
    required this.label,
    this.description,
    required this.due,
  });

  factory Homework.fromJson() => Homework(label: '', due: DateTime.now());

  factory Homework.fromForm() => Homework(
        label: '',
        due: DateTime.now(),
      );

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCardExpanded(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
      additionalText: getReadableDuration(due),
    );
  }
}
