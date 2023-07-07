import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/features/local_api/repository/lecture_repository.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';
import 'package:remindeer/src/models/resource.dart';
import 'components/my_library_filter_panel.dart';

class MyLibraryWidget extends StatefulWidget {
  const MyLibraryWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyLibraryWidgetState();
}

class _MyLibraryWidgetState extends State<MyLibraryWidget> {
  final unitsApi = UnitRepository.instance();
  final semestersApi = SemesterRepository.instance();
  final timetablesApi = TimetableRepository.instance();
  final tasksApi = TaskRepository.instance();
  final lecturesAPI = LectureRepository.instance();
  final homeworkApi = HomeworkRepository.instance();

  final activeFilters = ContentFilters.values.toSet();
  final resources = <Resource>[];

  @override
  void initState() {
    super.initState();
    _filterResources();
  }

  void _onFilterChange(Set<ContentFilters> filters) {
    setState(() => activeFilters
      ..clear()
      ..addAll(filters));
    _filterResources();
  }

  Future<void> _getAllResources() async {
    final units = await unitsApi.getAllUnits();
    final semesters = await semestersApi.getAllSemesters();
    final timetables = await timetablesApi.getAllTimetables();
    final lectures = await lecturesAPI.getAllLectures();
    final homework = await homeworkApi.getAllHomework();

    setState(() {
      resources
        ..addAll(semesters as Iterable<Resource>)
        ..addAll(timetables as Iterable<Resource>)
        ..addAll(units as Iterable<Resource>)
        ..addAll(lectures as Iterable<Resource>)
        ..addAll(homework as Iterable<Resource>);
    });
  }

  Future<void> _filterResources() async {
    final filteredResources = <Resource>{};

    if (activeFilters.isEmpty) {
      _getAllResources();
      return;
    }

    for (final filter in activeFilters) {
      switch (filter) {
        case ContentFilters.units:
          // filteredResources.addAll(await unitsApi.getAllUnits());
          break;
        case ContentFilters.semesters:
          filteredResources.addAll(
              (await semestersApi.getAllSemesters()) as Iterable<Resource>);
          break;
        case ContentFilters.timetables:
          filteredResources.addAll(
              (await timetablesApi.getAllTimetables()) as Iterable<Resource>);
          break;
        case ContentFilters.lectures:
          filteredResources
              .addAll(await lecturesAPI.getAllLectures() as Iterable<Resource>);
          break;
        case ContentFilters.events:
          // filteredResources.addAll(await e);
          break;
        case ContentFilters.tasks:
          // filteredResources.addAll(await ());
          break;
      }
    }

    setState(() => resources
      ..clear()
      ..addAll(filteredResources));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 24,
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
        title: const Text(
          'My Library',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              MyLibrarySelectionPillGroup(
                onFilterChange: _onFilterChange,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                        resources.length,
                        (index) =>
                            resources.elementAt(index).toResourceItem(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
