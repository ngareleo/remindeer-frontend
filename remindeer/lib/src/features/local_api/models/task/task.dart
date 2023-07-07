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
  late String label;
  String? venue;
  String? description;
  bool? repeat;

  @Name("repeat_to")
  int? repeatTo;
  DateTime? due;
  DateTime? completed;
  final DateTime created = DateTime.now();
  
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
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
      label: label,
      tag: _resourceName,
      lastModified: timeBtwn.toString(),
    );
  }
}
