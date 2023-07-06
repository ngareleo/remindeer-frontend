import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/values.dart';

import 'resource.dart';
part 'event.g.dart';

const _resourceName = "Event";

@Collection()
@Name(_resourceName)
class Event extends Resource {
  Id? id;
  String? venue;
  String label;
  String? description;
  Window? window;

  @enumerated
  RepeatFrequency repeat;

  @Name("repeat_to")
  DateTime? repeatTo;

  @Name("event_date")
  DateTime? eventDate;

  @Name("created")
  final DateTime _created = DateTime.now();

  @Name("last_modified")
  final DateTime _lastModified = DateTime.now();

  DateTime get created => _created;
  DateTime get lastModified => _lastModified;

  Event({
    required this.label,
    this.description,
    this.venue,
    this.window,
    this.repeatTo,
    this.eventDate,
    this.repeat = RepeatFrequency.none,
  });

  dynamic toJson() {
    return {
      venue: venue,
      label: label,
      description: description,
      window: window,
      repeat: repeat,
      repeatTo: repeatTo.toString(),
      eventDate: eventDate.toString(),
      _created: _created.toString(),
      _lastModified: _lastModified.toString()
    };
  }

  @override
  String toString() {
    return "[Event] ${toJson()}";
  }

  @override
  ResourceCard toResourceItem(BuildContext context) {
    final timeBtwn = _lastModified.difference(DateTime.now());
    return ResourceCard(
        label: label, tag: _resourceName, lastModified: timeBtwn.toString());
  }
}

@embedded
class Window {
  final int? from;
  final int? to;
  final bool? isAllDay;
  Window({this.from, this.to, this.isAllDay = false});
}
