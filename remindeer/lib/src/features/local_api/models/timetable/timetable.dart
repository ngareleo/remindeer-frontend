import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/screens/pages/timetable/timetable_dashboard.dart';

import '../resource.dart';
part 'timetable.g.dart';

const _resourceName = "Timetable";

@Collection()
@Name(_resourceName)
class Timetable extends Resource {
  Id? id;
  late String label;
  String? description;

  @Name("valid_until")
  late DateTime validUntil;
  late DateTime created = DateTime.now();

  @Name("last_modified")
  late DateTime lastModified = DateTime.now();

  Timetable({
    required this.label,
    required this.validUntil,
    this.description,
  });

  factory Timetable.fromJson(
      {required String uid, required Map<String, dynamic> json}) {
    final label = json["label"].toString();
    final description = json["description"].toString();
    final validUntil = json["valid_until"].toString();
    // final created = json["created"].toString();
    // final lastModified = json["last_modified"].toString();
    return Timetable(
      label: label,
      description: description,
      validUntil: DateTime.parse(validUntil),
    );
  }

  dynamic toJson() {
    return {
      "id": id,
      "label": label,
      "description": description,
      "valid_until": validUntil.toString(),
      "created": created.toString(),
      "last_modified": lastModified.toString()
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
      tag: _resourceName,
      lastModified: timeBtwn.toString(),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TimetableHomePage(
                      timetable: this,
                    )));
      },
    );
  }
}
