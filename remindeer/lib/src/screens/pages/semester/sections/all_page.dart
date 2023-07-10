import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/fetch_all_resource.dart';
import 'package:remindeer/src/features/local_api/models/resource.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/lecture_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';

import 'default.dart';

class AllPage extends SemesterPage {
  AllPage() : super(label: 'All');

  @override
  Widget buildBody(BuildContext context) {
    return AppPageBody(setPending: super.setPending);
  }
}

class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key, required this.setPending});

  final Function(int) setPending;

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  final resources = <Resource>[];
  final eventRepository = EventRepository.instance();
  final timetableRepository = TimetableRepository.instance();
  final taskRepository = TaskRepository.instance();
  final unitRepository = UnitRepository.instance();
  final lectureRepository = LectureRepository.instance();

  @override
  void initState() {
    super.initState();
    widget.setPending(0);
    _fetch();
  }

  Future<void> _fetch() async {
    resources
      ..clear()
      ..addAll(await fetchAllResources(
          eventRepository: eventRepository,
          timetableRepository: timetableRepository,
          taskRepository: taskRepository,
          unitRepository: unitRepository,
          lectureRepository: lectureRepository));

    widget.setPending(resources.length);
  }

  Future<List<Resource>> getAllLinkedResources() async {
    return <Resource>[
      ...await eventRepository.getAllEvents(),
      ...await timetableRepository.getAllTimetables(),
      ...await taskRepository.getAllTasks(),
      ...await unitRepository.getAllUnits(),
      ...await lectureRepository.getAllLectures()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
                children: List.generate(
                    resources.length,
                    (index) =>
                        resources.elementAt(index).toResourceItem(context)))));
  }
}
