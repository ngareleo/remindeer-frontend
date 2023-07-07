import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';

import '../resource.dart';
part 'task.g.dart';

const _resourceName = "Task";

@Collection()
@Name(_resourceName)
class Task extends Resource {
  Id? id;
  String label;
  String? venue;
  String? description;
  bool? repeat;

  @Name("repeat_to")
  int? repeatTo;
  DateTime? due;
  DateTime? completed;

  @Name("created")
  final DateTime _created = DateTime.now();

  @Name("last_modified")
  final DateTime _lastModified = DateTime.now();

  DateTime get created => _created;
  DateTime get lastModified => _lastModified;

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
    final timeBtwn = _lastModified.difference(DateTime.now());
    return ResourceCard(
      label: label,
      tag: _resourceName,
      lastModified: timeBtwn.toString(),
    );
  }
}
