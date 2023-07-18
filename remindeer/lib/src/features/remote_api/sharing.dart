import 'package:dio/dio.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';

import '../local_api/models/event/event.dart';
import '../local_api/models/homework/homework.dart';
import '../local_api/models/semester/semester.dart';
import '../local_api/models/task/task.dart';
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

enum LinkRequestState {
  invalidResource(),
  success(),
  noSuchResource(),
  unauthorized();
}

class SharingProvider {
  static SharingProvider? _instance;
  late Dio? _dio;
  static final SemesterRepository _semesterRepository =
      SemesterRepository.instance();
  static final UnitRepository _unitRepository = UnitRepository.instance();
  static final TimetableRepository _timetableRepository =
      TimetableRepository.instance();
  static final EventRepository _eventRepository = EventRepository.instance();
  static final TaskRepository _taskRepository = TaskRepository.instance();
  static final HomeworkRepository _homeworkRepository =
      HomeworkRepository.instance();

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

  Future<(String?, SharingProcessState)> shareSemester(int id) async {
    final (semester, status) = await _uploadSemester(id);
    if (status != SharingProcessState.success || semester == null) {
      return (null, status);
    }
    final (units, unitUploadStatus) =
        await _uploadUnits(id, semester.objectID!);
    if (unitUploadStatus != SharingProcessState.success || units == null) {
      return (null, unitUploadStatus);
    }
    final (timetables, timetableUploadStatus) =
        await _uploadTimetable(id, semester.objectID!);
    if (timetableUploadStatus != SharingProcessState.success ||
        timetables == null) {
      return (null, timetableUploadStatus);
    }
    final (events, eventUploadStatus) =
        await _uploadEvents(id, semester.objectID!);
    if (eventUploadStatus != SharingProcessState.success || events == null) {
      return (null, eventUploadStatus);
    }
    final (tasks, taskUploadStatus) = await _uploadTask(id, semester.objectID!);
    if (taskUploadStatus != SharingProcessState.success || tasks == null) {
      return (null, taskUploadStatus);
    }
    final (homeworks, homeworkUploadStatus) =
        await _uploadHomework(id, semester.objectID!);
    if (homeworkUploadStatus != SharingProcessState.success ||
        homeworks == null) {
      return (null, homeworkUploadStatus);
    }

    final (link, _) = await requestSharingLink(id);

    return (link, SharingProcessState.success);
  }

  Future<(String?, LinkRequestState)> requestSharingLink(int id) async {
    final semester = await _semesterRepository.getSemester(id);
    if (semester == null || semester.objectID == null) {
      return (null, LinkRequestState.invalidResource);
    }
    final res = await _dio?.get("/link/${semester.objectID}");
    if (res == null || res.statusCode != 200) {
      return (null, LinkRequestState.noSuchResource);
    }
    return res.data;
  }

  Future<(List<Homework>?, SharingProcessState)> _uploadHomework(
      int id, String objectID) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    final homeworks = await _semesterRepository.getAllHomeworks(id);

    for (final homework in homeworks) {
      final unit = homework.unit.value?.objectID;
      final semester = homework.semester.value?.objectID;
      homework.owner = userID;
      final res = await _dio?.post("/homework",
          data: homework.toJsonWithAssociation(
            unitObjectID: unit,
            semesterObjectID: semester,
          ));
      if (res == null || res.statusCode != 200) {
        return (null, SharingProcessState.error);
      }
      final homeworkFromServer = Homework.fromJson(res.data);
      homework.updateFromServerCopy(homeworkFromServer);
      await _homeworkRepository.createHomework(homework, homework.id!);
    }

    return (
      await _semesterRepository.getAllHomeworks(id),
      SharingProcessState.success
    );
  }

  Future<(List<Task>?, SharingProcessState)> _uploadTask(
      int id, String objectID) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    final tasks = await _semesterRepository.getAllTasks(id);

    for (final task in tasks) {
      final unit = task.unit.value?.objectID;
      final semester = task.semester.value?.objectID;
      final timetable = task.timetable.value?.objectID;

      task.owner = userID;
      final res = await _dio?.post("/task",
          data: task.toJsonWithAssociation(
              unitObjectID: unit,
              semesterObjectID: semester,
              timetableObjectID: timetable));
      if (res == null || res.statusCode != 200) {
        return (null, SharingProcessState.error);
      }
      final taskFromServer = Task.fromJson(res.data);
      task.updateFromServerCopy(taskFromServer);
      await _taskRepository.createTask(task);
    }

    return (
      await _semesterRepository.getAllTasks(id),
      SharingProcessState.success
    );
  }

  Future<(List<Event>?, SharingProcessState)> _uploadEvents(
      int id, String objectID) async {
    var userID = AuthProvider.loggedInUser?.objectID;
    final events = await _semesterRepository.getAllEvents(id);

    for (final event in events) {
      final timetable = event.timetable.value?.objectID;
      final semester = event.semester.value?.objectID;
      final unit = event.unit.value?.objectID;

      event.owner =
          userID; // add the owner once the event is global to many users
      final res = await _dio?.post("/event",
          data: event.toJsonWithAssociations(
              unitObjectID: unit,
              semesterObjectID: semester,
              timetableObjectID: timetable));
      if (res == null || res.statusCode != 200) {
        return (null, SharingProcessState.error);
      }
      final eventFromServer = Event.fromJson(res.data);
      event.updateFromServerCopy(eventFromServer);
      await _eventRepository.createEvent(event);
    }

    return (
      await _semesterRepository.getAllEvents(id),
      SharingProcessState.success
    );
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
