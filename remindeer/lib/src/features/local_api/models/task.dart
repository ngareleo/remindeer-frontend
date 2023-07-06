import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/task.dart'
    as app_task_model;
part 'task.g.dart';

@Collection()
@Name("Task")
class Task {
  Id? id;
  String? label;
  String? venue;
  String? description;
  bool? repeat;
  int? repeatTo;
  DateTime? due;
  DateTime? completed;
  final DateTime created = DateTime.now();
  DateTime lastModified = DateTime.now();

  Task();

  factory Task.fromLocalTaskModel(app_task_model.Task task) {
    return Task()
      ..label = task.label
      ..description = task.description
      ..venue = task.venue
      ..repeat = task.repeat
      ..repeatTo = task.repeatTo
      ..due = task.due
      ..completed = task.completed
      ..lastModified = task.lastModified;
  }
}
