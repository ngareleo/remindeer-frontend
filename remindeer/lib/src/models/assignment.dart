import 'package:remindeer/src/models/unit.dart';

import 'task.dart';

class Assignment extends Task {
  final Unit? unit;

  Assignment({
    required String uid,
    required String venue,
    required String label,
    String? description,
    bool? repeat,
    DateTime? repeatTo,
    required DateTime created,
    required DateTime lastModified,
    required DateTime due,
    required this.unit,
  }) : super(
            uid: '',
            label: '',
            repeat: false,
            repeatTo: null,
            created: created,
            lastModified: lastModified,
            due: due);

  factory Assignment.fromJson() {
    return Assignment(
        uid: '',
        venue: '',
        label: '',
        created: DateTime.now(),
        lastModified: DateTime.now(),
        due: DateTime.now(),
        unit: null);
  }

  factory Assignment.fromForm() {
    return Assignment(
        uid: '',
        venue: '',
        label: '',
        created: DateTime.now(),
        lastModified: DateTime.now(),
        due: DateTime.now(),
        unit: null);
  }
}
