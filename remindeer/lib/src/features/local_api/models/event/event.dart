import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';

import '../resource.dart';
part 'event.g.dart';

const _resourceName = "Event";

@Collection()
@Name(_resourceName)
class Event extends Resource {
  Id? id;
  late String label;
  String? venue;
  String? description;
  late EventWindow window;

  @enumerated
  RepeatFrequency repeat = RepeatFrequency.none;

  @Name("repeat_to")
  DateTime? repeatTo;

  @Name("event_date")
  DateTime? eventDate;

  final DateTime created = DateTime.now();

  @Name("last_modified")
  final DateTime lastModified = DateTime.now();

  Event({
    required this.label,
    this.description,
    this.venue,
    required this.window,
    this.repeatTo,
    this.eventDate,
    this.repeat = RepeatFrequency.none,
  });

  dynamic toJson() => {
        venue: venue,
        label: label,
        description: description,
        window: window.toJson(),
        repeat: repeat,
        repeatTo: repeatTo.toString(),
        eventDate: eventDate.toString(),
        created: created.toString(),
        lastModified: lastModified.toString()
      };

  @override
  String toString() => "[Event] ${toJson()}";

  @override
  ResourceCard toResourceItem(BuildContext context) {
    final timeBtwn = lastModified.difference(DateTime.now());
    return ResourceCard(
        label: label, tag: _resourceName, lastModified: timeBtwn.toString());
  }
}

@embedded
class EventWindow {
  final int? from;
  final int? to;
  final bool? isAllDay;
  EventWindow({this.from, this.to, this.isAllDay = false});

  dynamic toJson() => {
        from: from,
        to: to,
        isAllDay: isAllDay,
      };
}

enum RepeatFrequency {
  none,
  daily,
  weekly,
  monthly,
  annually,
}
