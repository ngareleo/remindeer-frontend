import 'package:isar/isar.dart';

import '../models/unit/unit.dart';

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
}
