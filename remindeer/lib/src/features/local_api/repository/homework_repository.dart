import 'package:isar/isar.dart';

import '../models/homework/homework.dart';
import '../models/unit/unit.dart';

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

  Future<Homework?> createHomework(Homework homework, int unitId) async {
    final unit = await _isar.units.get(unitId);

    if (unit == null) {
      return null;
    }

    await _isar.writeTxn(() async {
      return await _isar.homeworks.put(homework);
    });

    final result =
        await _isar.homeworks.where().sortByCreatedDesc().findFirst();
    result?.unit.value = unit;
    result?.lastModified = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.homeworks.put(result!);
      await _isar.units.put(unit);
      await result.unit.save();
    });

    return await _isar.homeworks.where().sortByLastModifiedDesc().findFirst();
  }

  Future<Unit?> getLinkedUnit(int homeworkId) async {
    final homework = await _isar.homeworks.get(homeworkId);
    return homework!.unit.value;
  }
}
