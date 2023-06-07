import 'package:remindeer/src/models/resource.dart';

class Task extends Resource {
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
}
