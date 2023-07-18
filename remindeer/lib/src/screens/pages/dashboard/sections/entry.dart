import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/features/local_api/models/homework/homework.dart';
import 'package:remindeer/src/features/local_api/models/lecture/lecture.dart';
import 'package:remindeer/src/features/local_api/models/resource.dart';
import 'package:remindeer/src/features/local_api/models/task/task.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/features/local_api/repository/lecture_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_group.dart';
import 'package:remindeer/src/screens/pages/dashboard/sections/homework_due_this_week_section.dart';
import 'package:remindeer/src/screens/pages/dashboard/sections/overdue_homework_section.dart';

class TodaysLecturesSection extends StatefulWidget {
  const TodaysLecturesSection({super.key, required this.date});

  final DateTime date;

  @override
  State<TodaysLecturesSection> createState() => _TodaysLecturesSectionState();
}

class _TodaysLecturesSectionState extends State<TodaysLecturesSection> {
  final homeworkRepository = HomeworkRepository.instance();
  final lecturesRepository = LectureRepository.instance();
  final taskRepository = TaskRepository.instance();
  final eventRepository = EventRepository.instance();

  final _lectures = <Lecture>[];
  final _events = <Event>[];
  final _tasks = <Task>[];
  final _homework = <Homework>[];

  final resources = <Resource>[];

  final eventsDueToday = <Resource>[];
  final todaysLectures = <Resource>[];
  final tasksDueToday = <Resource>[];

  @override
  void initState() {
    _getAllResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: HomeworkDueThisWeekSection(
            homework: _homework,
            today: widget.date,
          ),
        ),
        OverdueHomework(homework: _homework, today: widget.date),
      ],
    );
  }

  void _getAllResources() async {
    final lectures = await lecturesRepository.getAllLectures();
    final events = await eventRepository.getAllEvents();
    final tasks = await taskRepository.getAllTasks();
    final homework = await homeworkRepository.getAllHomework();

    debugPrint('homeworks $homework');

    final allResources = [
      ...lectures,
      ...events,
      ...tasks,
      ...homework,
    ];

    setState(() => resources
      ..clear()
      ..addAll(allResources));

    setState(() => _lectures
      ..clear()
      ..addAll(lectures));

    setState(() => _events
      ..clear()
      ..addAll(events));

    setState(() => _tasks
      ..clear()
      ..addAll(tasks));

    setState(() => _homework
      ..clear()
      ..addAll(homework));
  }
}
