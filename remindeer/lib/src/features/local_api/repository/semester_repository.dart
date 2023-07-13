import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/resource.dart';
import 'package:remindeer/src/features/local_api/models/task/task.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';

import '../models/event/event.dart';
import '../models/homework/homework.dart';
import '../models/semester/semester.dart';
import '../models/timetable/timetable.dart';

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

  Future<List<Unit>> getAllUnits(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.units.load();
    return semester?.units.toList() ?? [];
  }

  Future<List<Homework>> getAllHomeworks(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.homeworks.load();
    return semester?.homeworks.toList() ?? [];
  }

  Future<List<Timetable>> getAllTimetables(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.timetables.load();
    return semester?.timetables.toList() ?? [];
  }

  Future<void> addEventToSemester(int semesterId, Event event) async {
    final semester = await getSemester(semesterId);
    semester?.events.add(event);
    await _isar.writeTxn(() async {
      await semester?.events.save();
    });
  }

  Future<void> addTimetableToSemester(
      int semesterId, Timetable timetable) async {
    final semester = await getSemester(semesterId);
    semester?.timetables.add(timetable);
    await _isar.writeTxn(() async {
      await semester?.timetables.save();
    });
  }

  Future<void> addUnitToSemester(int semesterId, Unit unit) async {
    final semester = await getSemester(semesterId);
    semester?.units.add(unit);
    await _isar.writeTxn(() async {
      await semester?.units.save();
    });
  }

  Future<List<Resource>> getAllResources(int id) async {
    return [
      ...await getAllEvents(id),
      ...await getAllTasks(id),
      ...await getAllUnits(id),
      ...await getAllHomeworks(id),
    ];
  }
}
