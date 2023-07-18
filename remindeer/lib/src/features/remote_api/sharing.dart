import 'package:dio/dio.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/models/user.dart';

import '../local_api/models/semester/semester.dart';
import '../local_api/models/unit/unit.dart';
import '../local_api/repository/semester_repository.dart';
import '../local_api/repository/unit_repository.dart';

enum SharingProcessState {
  notStarted,
  loading,
  success,
  error,
  unauthorized,
}

class SharingProvider {
  static SharingProvider? _instance;
  late Dio? _dio;
  static final SemesterRepository _semesterRepository =
      SemesterRepository.instance();
  static final UnitRepository _unitRepository = UnitRepository.instance();
  static final TimetableRepository _timetableRepository =
      TimetableRepository.instance();

  SharingProvider._() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://d74b-41-84-131-94.ngrok-free.app/api/share",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Accept": "application/json",
      },
    ));
    _instance = this;
  }

  factory SharingProvider.build() {
    if (_instance != null) {
      throw Exception("SharingProvider already built");
    }
    return SharingProvider._();
  }

  factory SharingProvider.instance() {
    if (_instance == null) {
      throw Exception("SharingProvider not built");
    }
    return _instance!;
  }

  Future<SharingProcessState> shareSemester(int id) async {
    final (semester, status) = await _uploadSemester(id);

    if (status != SharingProcessState.success || semester == null) {
      return status;
    }

    final (units, unitUploadStatus) =
        await _uploadUnits(id, semester.objectID!);

    if (unitUploadStatus != SharingProcessState.success || units == null) {
      return unitUploadStatus;
    }

    final (timetables, timetableUploadStatus) =
        await _uploadTimetable(id, semester.objectID!);

    if (timetableUploadStatus != SharingProcessState.success ||
        timetables == null) {
      return timetableUploadStatus;
    }

    return SharingProcessState.success;
  }

  Future<(List<Timetable>?, SharingProcessState)> _uploadTimetable(
      int id, String objectID) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    final timetables = await _semesterRepository.getAllTimetables(id)
      ..map((timetable) => timetable.toJsonWithAssociation(objectID)).toList();
    final results = <Timetable>[];
    for (final timetable in timetables) {
      timetable.owner =
          userID; // add the owner once the timetable is global to many users
      final res = await _dio?.post("/timetable", data: timetable);
      if (res == null || res.statusCode != 200) {
        return (null, SharingProcessState.error);
      }
      final timetableFromServer = Timetable.fromJson(res.data);
      timetable.updateFromServerCopy(timetableFromServer);
      final uploadedTimetable =
          await _timetableRepository.createTimetable(timetable);
      if (uploadedTimetable == null) {
        return (null, SharingProcessState.error);
      }
      results.add(uploadedTimetable);
    }
    return (results, SharingProcessState.success);
  }

  Future<(List<Unit>?, SharingProcessState)> _uploadUnits(
      int id, String objectID) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    final units = await _semesterRepository.getAllUnits(id)
      ..map((unit) => unit.toJsonWithAssociation(objectID)).toList();
    final results = <Unit>[];
    for (final unit in units) {
      unit.owner =
          userID; // add the owner once the unit is global to many users
      final res = await _dio?.post("/unit", data: unit);
      if (res == null || res.statusCode != 200) {
        return (null, SharingProcessState.error);
      }
      final unitFromServer = Unit.fromJson(res.data);
      unit.updateFromServerCopy(unitFromServer);
      final uploadedUnit = await _unitRepository.createUnit(unit);
      if (uploadedUnit == null) {
        return (null, SharingProcessState.error);
      }
      results.add(uploadedUnit);
    }
    return (results, SharingProcessState.success);
  }

  Future<(Semester?, SharingProcessState)> _uploadSemester(int id) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    var semester = await _semesterRepository.getSemester(id);
    if (semester == null) {
      return (null, SharingProcessState.error);
    } else if (semester.owner != userID) {
      return (null, SharingProcessState.unauthorized);
    }
    semester.owner =
        userID; // we add the owner once the semester is global to many users
    final res = await _dio?.post("/semester", data: semester.toJson());
    if (res == null || res.statusCode != 200) {
      return (null, SharingProcessState.error);
    }
    final semesterFromServer = Semester.fromJson(res.data);
    semester.updateFromServerCopy(semesterFromServer);
    final uploadedSemester = await _semesterRepository
        .createSemester(semester); // does creation and update if id is the same
    return (uploadedSemester, SharingProcessState.success);
  }
}
