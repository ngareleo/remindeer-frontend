import 'package:flutter/src/widgets/framework.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/models/resource.dart';

class Task extends Resource {
  final _name = "task";
  final _displayName = "Task";

  final String label;
  final String? venue;
  final String? description;
  final DateTime? from;
  final DateTime? to;
  final bool? repeat;
  final int? repeatTo;
  final DateTime? due;

  const Task({
    required String uid,
    required this.label,
    this.description,
    this.from,
    this.to,
    this.venue,
    this.due,
    this.repeat,
    this.repeatTo,
    required DateTime created,
    required DateTime lastModified,
  }) : super(uid: uid, created: created, lastModified: lastModified);

  @override
  Widget toResourceItem() {
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
      label: label,
      tag: _displayName,
      lastModified: timeBtwn.toString(),
    );
  }
}
