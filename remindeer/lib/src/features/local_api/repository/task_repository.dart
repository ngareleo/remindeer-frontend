import 'package:isar/isar.dart';

import '../models/task/task.dart';

class TaskRepository {
  static TaskRepository? _instance;
  final Isar _isar;

  TaskRepository(this._isar) {
    if (_instance != null) {
      throw Exception("TaskRepository is already initialized");
    }
    _instance = this;
  }

  factory TaskRepository.instance() {
    if (_instance == null) {
      throw Exception("TaskRepository is not initialized");
    }
    return _instance!;
  }

  Future<void> addTask(Task task) async {
    await _isar.writeTxn(() async {
      return await _isar.tasks.put(task);
    });
  }

  Future<List<Task>> getAllTasks() async {
    return await _isar.tasks.where().findAll();
  }
}
