import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/cards/resource_card.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/common/utils/values.dart';

import '../resource.dart';
import '../semester/semester.dart';
import '../timetable/timetable.dart';
import '../unit/unit.dart';

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

  @Name("object_id")
  String? objectID;

  String? owner;

  @Enumerated(EnumType.name)
  DaysOfWeek? dayOfWeek;

  @enumerated
  RepeatFrequency repeat = RepeatFrequency.none;

  final unit = IsarLink<Unit>();
  final semester = IsarLink<Semester>();
  final timetable = IsarLink<Timetable>();

  @Name("repeat_to")
  DateTime? repeatTo;

  @Name("event_date")
  DateTime? eventDate;

  DateTime created = DateTime.now();

  @Name("last_modified")
  DateTime lastModified = DateTime.now();

  Event({
    required this.label,
    this.description,
    this.venue,
    required this.window,
    this.repeatTo,
    this.eventDate,
    this.dayOfWeek,
    this.repeat = RepeatFrequency.none,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final objectID = json["_id"].toString();
    final created = json["created_at"].toString();
    final lastModified = json["updated_at"].toString();
    final from = json["from"].toString();
    final to = json["to"].toString();
    final isAllDay = json["is_all_day"].toString();
    final label = json["label"].toString();
    final description = json["description"].toString();
    final venue = json["venue"].toString();
    final repeatTo = json["repeat_to"].toString();
    final eventDate = json["event_date"].toString();
    final owner = json["owner"].toString();

    var event = Event(
      label: label,
      description: description,
      venue: venue,
      repeatTo: DateTime.parse(repeatTo),
      eventDate: DateTime.parse(eventDate),
      window: EventWindow(
          from: int.parse(from),
          to: int.parse(to),
          isAllDay: bool.parse(isAllDay)),
    )
      ..created = DateTime.parse(created)
      ..lastModified = DateTime.parse(lastModified)
      ..objectID = objectID
      ..owner = owner;

    return event;
  }

  void updateFromServerCopy(Event newEvent) {
    owner = newEvent.owner;
    objectID = newEvent.objectID;
    label = newEvent.label;
    description = newEvent.description;
    venue = newEvent.venue;
    window = newEvent.window;
    repeatTo = newEvent.repeatTo;
    eventDate = newEvent.eventDate;
    dayOfWeek = newEvent.dayOfWeek;
    repeat = newEvent.repeat;
    lastModified = newEvent.lastModified;
  }

  @override
  dynamic toJson() => {
        "venue": venue,
        "label": label,
        "description": description,
        "to": window.to,
        "from": window.from,
        "day": dayOfWeek?.fullValue ?? "",
        "is_all_day": window.isAllDay,
        "repeat": repeat,
        "repeat_to": repeatTo?.toIso8601String(),
        "day_of_week": dayOfWeek,
        "event_date": eventDate?.toIso8601String(),
        "created_at": created.toIso8601String(),
        "updated_at": lastModified.toIso8601String(),
        "_id": objectID,
      };

  dynamic toJsonWithAssociations({
    String? unitObjectID,
    String? semesterObjectID,
    String? timetableObjectID,
  }) =>
      Map.from(toJson())
        ..addAll({
          "unit_id": unitObjectID,
          "semester_id": semesterObjectID,
          "timetable_id": timetableObjectID
        });

  @override
  String toString() => "[Event] ${toJson()}";

  @override
  Widget toResourceItem(BuildContext context) {
    return ResourceCard(
      label: label,
      tag: _resourceName,
      trailingText: convertToReadableDifference(lastModified),
    );
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
