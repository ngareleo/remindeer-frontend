import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/screens/pages/semester/semester_dashboard.dart';

import 'resource.dart';

class Semester extends Resource {
  final _name = "semester";
  final _displayName = "Semester";

  final String name;
  final String? descrption;
  final DateTime? from;
  final DateTime? to;

  const Semester(
      {required String uid,
      required this.name,
      this.descrption,
      this.from,
      this.to,
      required DateTime created,
      required DateTime lastModified})
      : super(uid: uid, created: created, lastModified: lastModified);

  factory Semester.fromJson({
    required String uid,
    required Map<String, dynamic> json,
  }) {
    var created = json["created"].toString();
    var lastModified = json["last_modified"].toString();
    var from = json["from"].toString();
    var to = json["to"].toString();
    var name = json["name"].toString();
    var descrption = json["description"].toString();

    return Semester(
        uid: uid,
        name: name,
        descrption: descrption,
        from: DateTime.parse(from),
        to: DateTime.parse(to),
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      uid: {
        "name": name,
        "description": descrption,
        "from": from.toString(),
        "to": to.toString(),
        "created": created.toString(),
        "last_modified": lastModified.toString(),
      }
    };
  }

  @override
  String toString() {
    return "[Semester] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
      label: name,
      lastModified: timeBtwn.toString(),
      tag: _displayName,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SemesterDashboardPage()));
      },
    );
  }
}
