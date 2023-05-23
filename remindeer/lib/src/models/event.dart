import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/common/utils/values.dart';

class Event {
  final String? uid;
  final String? venue;
  final String? label;
  final String? description;
  final Window? window;
  final RepeatFrequency? repeat;
  final DateTime? repeatTo;
  final DateTime? eventDate;
  final DateTime? created;
  final DateTime? lastModified;

  const Event(
      {required this.uid,
      required this.label,
      this.description,
      this.venue,
      this.window,
      this.repeatTo,
      this.eventDate,
      this.repeat,
      this.created,
      this.lastModified});

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
}
