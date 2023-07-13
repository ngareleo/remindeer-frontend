import 'package:remindeer/src/features/local_api/models/resource.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/lecture_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';

Future<List<Resource>> fetchAllResources(
    {required EventRepository eventRepository,
    required TimetableRepository timetableRepository,
    required TaskRepository taskRepository,
    required UnitRepository unitRepository,
    required LectureRepository lectureRepository}) async {
  final resources = <Resource>[];
  resources
    ..addAll(await eventRepository.getAllEvents())
    ..addAll(await timetableRepository.getAllTimetables())
    ..addAll(await taskRepository.getAllTasks())
    ..addAll(await unitRepository.getAllUnits())
    ..addAll(await lectureRepository.getAllLectures());
  return resources;
}
