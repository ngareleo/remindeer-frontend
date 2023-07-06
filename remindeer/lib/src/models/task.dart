// Archived for reference purposes only (DO NOT USE)

import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/models/resource.dart';

class Task extends Resource {
  static const _name = "Task";

  final String label;
  final String? venue;
  final String? description;
  final bool? repeat;
  final int? repeatTo;
  final DateTime? due;
  final DateTime? completed;

  Task({
    required String uid,
    required this.label,
    this.description,
    this.venue,
    this.due,
    this.repeat,
    this.repeatTo,
    required DateTime created,
    required DateTime lastModified,
    this.completed,
  }) : super(uid: uid, created: created, lastModified: lastModified);

  factory Task.form() {
    return Task(
        uid: "",
        label: "",
        created: DateTime.now(),
        lastModified: DateTime.now());
  }

  factory Task.fromJson() {
    return Task(
        uid: '',
        label: '',
        created: DateTime.now(),
        lastModified: DateTime.now());
  }

  @override
  Widget toResourceItem(BuildContext context) {
    final timeBtwn = lastModified?.difference(DateTime.now());
    return ResourceCard(
      label: label,
      tag: _name,
      lastModified: timeBtwn.toString(),
    );
  }
}
