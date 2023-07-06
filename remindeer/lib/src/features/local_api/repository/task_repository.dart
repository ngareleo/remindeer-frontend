import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/task.dart';

class TaskRepository {
  static final TaskRepository _instance = TaskRepository._internal();
  final Isar _isar;

  TaskRepository(this._isar);

  factory TaskRepository._internal() => _instance;

  factory TaskRepository.instance() => _instance;

  Future<void> addTask(Task task) async {
    await _isar.writeTxn(() async {
      return await _isar.tasks.put(task);
    });
  }
}
