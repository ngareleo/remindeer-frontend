import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/models/resource.dart';
import 'package:remindeer/src/screens/pages/timetable/timetable_dashboard.dart';

class Timetable extends Resource {
  static const _name = "timetable";
  static const _displayName = "Timetable";

  final String label;
  final String? description;
  final DateTime? validUntil;

  Timetable(
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

  @override
  Widget toResourceItem(
    BuildContext context,
  ) {
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
      label: label,
      tag: _displayName,
      lastModified: timeBtwn.toString(),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TimetableHomePage()));
      },
    );
  }
}
