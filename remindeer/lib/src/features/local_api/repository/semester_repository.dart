import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/task/task.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';

import '../models/event/event.dart';
import '../models/semester/semester.dart';

class SemesterRepository {
  static SemesterRepository? _instance;
  final Isar _isar;

  SemesterRepository(this._isar) {
    if (_instance != null) {
      throw Exception("SemesterRepository is already initialized");
    }
    _instance = this;
  }

  factory SemesterRepository.instance() {
    if (_instance == null) {
      throw Exception("SemesterRepository is not initialized");
    }
    return _instance!;
  }

  Future<Semester?> getSemester(int id) async {
    return await _isar.semesters.get(id);
  }

  Future<Semester?> createSemester(Semester semester) async {
    await _isar.writeTxn(() async {
      return await _isar.semesters.put(semester);
    });

    return await _isar.semesters.where().sortByCreatedDesc().findFirst();
  }

  Future<List<Semester>> getAllSemesters() async {
    return await _isar.semesters.where().sortByCreatedDesc().findAll();
  }

  Future<List<Event>> getAllEvents(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.events.load();
    return semester?.events.toList() ?? [];
  }

  Future<List<Task>> getAllTasks(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.tasks.load();
    return semester?.tasks.toList() ?? [];
  }

  Future<void> addEventToSemester(int semesterId, Event event) async {
    final semester = await getSemester(semesterId);
    semester?.events.add(event);
    await _isar.writeTxn(() async {
      await semester?.events.save();
    });
  }
}
