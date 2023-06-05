import 'package:remindeer/src/models/event.dart';
import 'package:remindeer/src/models/timetable.dart';
import 'package:remindeer/src/models/unit.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/common/utils/values.dart';

class Lecture extends Event {
  Unit? unit;
  Timetable? timetable;
  DaysOfWeek dayOfWeek;

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

  factory Lecture.fromJson(
      {required String uid,
      required Map<String, dynamic> json,
      required Unit? unit,
      required Timetable? timetable}) {
    var created = json["created"].toString();
    var lastModified = json["last_modified"].toString();
    var repeatTo = json["repeat_to"].toString();
    var from = json["from"].toString();
    var to = json["to"].toString();
    var dayOfWeek = json["day_of_week"].toString();
    var venue = json["venue"].toString();
    return Lecture(
        uid: uid,
        unit: unit,
        venue: venue,
        window: Window(from: int.parse(from), to: int.parse(to)),
        repeatTo: DateTime.parse(repeatTo),
        timetable: timetable,
        dayOfWeek: mapToDayOfWeek(int.parse(dayOfWeek)),
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  @override
  dynamic toJson() {
    return {
      uid: {
        "unit": unit?.uid,
        "timetable": timetable?.uid,
        "venue": venue,
        "from": window?.from,
        "to": window?.to,
        "repeat_to": repeatTo.toString(),
        "created": created.toString(),
        "last_modified": lastModified.toString(),
        "day_of_week": dayOfWeek.index
      }
    };
  }

  @override
  String toString() {
    return "[Lecture] ${toJson()}";
  }
}
