import 'package:isar/isar.dart';

import '../models/timetable/timetable.dart';

class TimetableRepository {
  static TimetableRepository? _instance;
  final Isar _isar;

  TimetableRepository(this._isar) {
    if (_instance != null) {
      throw Exception("TimetableRepository is already initialized");
    }
    _instance = this;
  }

  factory TimetableRepository.instance() {
    if (_instance == null) {
      throw Exception("TimetableRepository is not initialized");
    }
    return _instance!;
  }

  Future<Timetable?> addTimetable(Timetable timetable) async {
    await _isar.writeTxn(() async {
      return await _isar.timetables.put(timetable);
    });
    return await _isar.timetables.where().sortByLastModifiedDesc().findFirst();
  }

  Future<List<Timetable>> getAllTimetables() async {
    return await _isar.timetables.where().sortByLastModifiedDesc().findAll();
  }
}
