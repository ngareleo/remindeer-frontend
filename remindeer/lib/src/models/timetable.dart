import 'package:remindeer/src/models/resource.dart';

class Timetable extends Resource {
  final String label;
  final String? description;
  final DateTime? validUntil;

  const Timetable(
      {required String uid,
      required this.label,
      this.description,
      this.validUntil,
      required DateTime created,
      required DateTime lastModified})
      : super(uid: uid, created: created, lastModified: lastModified);

  factory Timetable.fromJson(
      {required String uid, required Map<String, dynamic> json}) {
    final label = json["label"].toString();
    final description = json["description"].toString();
    final validUntil = json["valid_until"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    return Timetable(
        uid: uid,
        label: label,
        description: description,
        validUntil: DateTime.parse(validUntil),
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      uid: {
        "label": label,
        "description": description,
        "valid_until": validUntil.toString(),
        "created": created.toString(),
        "last_modified": lastModified.toString()
      }
    };
  }

  @override
  String toString() {
    return "[Timetable] ${toJson()}";
  }
}
