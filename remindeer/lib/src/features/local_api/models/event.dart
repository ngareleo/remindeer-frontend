import 'package:isar/isar.dart';
import 'package:remindeer/src/common/utils/values.dart';
import 'package:remindeer/src/models/event.dart' as app_event_model;
part 'event.g.dart';

@Collection()
@Name("Event")
class Event {
  Id? id;
  String? venue;
  String? label;
  String? description;
  Window? window;

  @enumerated
  late RepeatFrequency repeat;
  DateTime? repeatTo;
  DateTime? eventDate;
  final DateTime created = DateTime.now();
  DateTime lastModified = DateTime.now();

  Event();

  factory Event.fromLocalEventModel(app_event_model.Event event) {
    return Event()
      ..label = event.label
      ..description = event.description
      ..description = event.description
      ..window = Window(
          from: event.window?.from,
          to: event.window?.to,
          isAllDay: event.window?.isAllDay)
      ..repeat = event.repeat!
      ..repeatTo = event.repeatTo
      ..lastModified = event.lastModified;
  }
}

@embedded
class Window {
  int? from;
  int? to;
  bool? isAllDay;

  Window({this.from, this.to, this.isAllDay});
}
