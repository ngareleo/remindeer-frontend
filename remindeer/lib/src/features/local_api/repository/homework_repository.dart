import 'package:isar/isar.dart';

import '../models/homework/homework.dart';

class HomeworkRepository {
  static HomeworkRepository? _instance;
  final Isar _isar;

  HomeworkRepository(this._isar) {
    if (_instance != null) {
      throw Exception("HomeworkRepository is already initialized");
    }
    _instance = this;
  }

  factory HomeworkRepository.instance() {
    if (_instance == null) {
      throw Exception("HomeworkRepository is not initialized");
    }
    return _instance!;
  }

  Future<List<Homework>> getAllHomework() async {
    return await _isar.homeworks.where().sortByCreatedDesc().findAll();
  }
}
