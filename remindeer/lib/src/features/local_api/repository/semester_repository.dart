import 'package:isar/isar.dart';

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

  Future<Semester?> addSemester(Semester semester) async {
    await _isar.writeTxn(() async {
      return await _isar.semesters.put(semester);
    });

    return await _isar.semesters.where().sortByCreatedDesc().findFirst();
  }

  Future<List<Semester>> getAllSemesters() async {
    return await _isar.semesters.where().sortByCreatedDesc().findAll();
  }
}
