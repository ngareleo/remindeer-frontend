import 'package:remindeer/src/models/event.dart';
import 'package:remindeer/src/models/unit.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/common/utils/values.dart';

class Lecture extends Event {
  Unit? unit;

  Lecture({
    required uid,
    required this.unit,
    String? label,
    String? venue,
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
            lastModified: lastModified);
}
