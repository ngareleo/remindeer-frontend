import 'package:isar/isar.dart';

import '../models/lecture/lecture.dart';

class LectureRepository {
  static LectureRepository? _instance;
  final Isar _isar;

  LectureRepository(this._isar) {
    if (_instance != null) {
      throw Exception("LectureRepository is already initialized");
    }
    _instance = this;
  }

  factory LectureRepository.instance() {
    if (_instance == null) {
      throw Exception("LectureRepository is not initialized");
    }
    return _instance!;
  }

  Future<List<Lecture>> getAllLectures() async {
    return await _isar.lectures.where().sortByCreatedDesc().findAll();
  }
}
