import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';

import '../models/unit/unit.dart';
import '../models/timetable/timetable.dart';

class UnitRepository {
  static UnitRepository? _instance;
  final Isar _isar;

  UnitRepository(this._isar) {
    if (_instance != null) {
      throw Exception("UnitRepository is already initialized");
    }
    _instance = this;
  }

  factory UnitRepository.instance() {
    if (_instance == null) {
      throw Exception("UnitRepository is not initialized");
    }
    return _instance!;
  }

  Future<List<Unit>> getAllUnits() async {
    return await _isar.units.where().sortByCreatedDesc().findAll();
  }

  Future<Unit?> createUnit(Unit unit) {
    _isar.writeTxn(() async {
      return await _isar.units.put(unit);
    });
    return _isar.units.where().sortByCreatedDesc().findFirst();
  }

  Future<Unit?> getUnit(int id) async {
    return await _isar.units.get(id);
  }

  Future<List<Unit>> getUnitsLinkedToSemester(int id) async {
    final semester = await _isar.semesters.get(id);
    semester?.units.load();
    return semester?.units.toList() ?? [];
  }

  Future<List<Unit>> getUnitsLinkedToTimetable(int id) async {
    final timetable = await _isar.timetables.get(id);
    timetable?.semester.load();
    final semester = timetable?.semester.value;
    return getUnitsLinkedToSemester(semester!.id!);
  }
}
