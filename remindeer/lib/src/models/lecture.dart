import 'package:remindeer/src/models/event.dart';
import 'package:remindeer/src/models/timetable.dart';
import 'package:remindeer/src/models/unit.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/common/utils/values.dart';

class Lecture extends Event {
  Unit? unit;
  Timetable? timetable;
  DayOfWeek dayOfWeek;

  Lecture({
    required uid,
    required this.unit,
    required this.timetable,
    required this.dayOfWeek,
    String? label,
    String? venue,
    String? descrpition,
    Window? window,
    DateTime? repeatTo,
    DateTime? created,
    DateTime? lastModified,
  }) : super(
            uid: uid,
            label: label ?? unit?.name ?? "untitled",
            venue: venue,
            window: window,
            repeat: RepeatFrequency.weekly,
            repeatTo: repeatTo,
            created: created,
            lastModified: lastModified,
            description: descrpition);

  @override
  dynamic toJson() {
    return {
      uid: uid,
      unit: unit,
      label: label,
      venue: venue,
      window: window,
      repeatTo: repeatTo.toString(),
      created: created.toString(),
      lastModified: lastModified
    };
  }

  @override
  String toString() {
    return "[Lecture] $uid $label";
  }
}
