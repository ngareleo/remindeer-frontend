import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/models/resource.dart';

class Unit extends Resource {
  static const _name = "Unit";

  final String name;
  final String unitCode;
  final String? description;
  final String lecturer;

  Unit(
      {required String uid,
      required this.name,
      required this.unitCode,
      this.description,
      required this.lecturer,
      required DateTime created,
      required DateTime lastModified})
      : super(uid: uid, created: created, lastModified: lastModified);

  factory Unit.fromJson(
      {required String uid, required Map<String, dynamic> json}) {
    final name = json["name"].toString();
    final unitCode = json["unit_code"].toString();
    final description = json["descrption"].toString();
    final lecturer = json["lecturer"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    return Unit(
        uid: uid,
        name: name,
        description: description,
        unitCode: unitCode,
        lecturer: lecturer,
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      uid: {
        "name": name,
        "unit_code": unitCode,
        "description": description,
        "lecturer": lecturer,
        "created": created.toString(),
        "last_modified": lastModified.toString()
      }
    };
  }

  @override
  String toString() {
    return "[Unit] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    final timeBtwn = lastModified?.difference(DateTime.now());
    return ResourceCard(
      label: name,
      tag: _name,
      trailingText: timeBtwn.toString(),
      onTap: () {},
    );
  }
}
