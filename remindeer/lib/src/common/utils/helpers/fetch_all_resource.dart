import 'package:remindeer/src/features/api/task_api.dart';
import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/features/api/units_api.dart';
import 'package:remindeer/src/models/resource.dart';

Future<List<Resource>> fetchAllResources() async {
  final timetblApi = TimetableAPI();
  final unitsApit = UnitsAPI();
  final tasksApi = TaskAPI();

  final resources = <Resource>[];

  resources
    ..addAll(await timetblApi.getAllTimetables())
    ..addAll(await unitsApit.getAllUnits())
    ..addAll(tasksApi.getTasks());

  return resources;
}
