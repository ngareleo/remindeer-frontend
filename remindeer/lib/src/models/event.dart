// Archived for reference purposes only (DO NOT USE)

import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/common/utils/values.dart';
import 'package:remindeer/src/models/resource.dart';

class Event extends Resource {
  static const _name = "Event";

  final String? venue;
  final String label;
  final String? description;
  final Window? window;
  final RepeatFrequency? repeat;
  final DateTime? repeatTo;
  final DateTime? eventDate;

  Event(
      {required uid,
      required this.label,
      this.description,
      this.venue,
      this.window,
      this.repeatTo,
      this.eventDate,
      this.repeat,
      DateTime? created,
      DateTime? lastModified})
      : super(uid: uid, created: created, lastModified: lastModified);

  dynamic toJson() {
    return {
      uid: uid,
      venue: venue,
      label: label,
      description: description,
      window: window,
      repeat: repeat,
      repeatTo: repeatTo.toString(),
      eventDate: eventDate.toString(),
      created: created.toString(),
      lastModified: lastModified.toString()
    };
  }

  @override
  String toString() {
    return "[Event] $uid $label";
  }

  @override
  ResourceCard toResourceItem(BuildContext context) {
    final timeBtwn = lastModified?.difference(DateTime.now());
    return ResourceCard(
        label: label, tag: _name, lastModified: timeBtwn.toString());
  }
}
