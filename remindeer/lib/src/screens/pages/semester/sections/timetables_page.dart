import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

import 'default.dart';

class TimetablesPage extends SemesterPage {
  final int id;
  TimetablesPage(this.id) : super(label: 'Timetables');
  @override
  Widget buildBody(BuildContext context) {
    return TimetablesPageBody(setPending: super.setPending, id: id);
  }
}

class TimetablesPageBody extends StatefulWidget {
  final int id;
  final Function(int) setPending;

  const TimetablesPageBody(
      {super.key, required this.setPending, required this.id});

  @override
  State<TimetablesPageBody> createState() => _TimetablesPageBodyState();
}

class _TimetablesPageBodyState extends State<TimetablesPageBody> {
  final timetables = <Timetable>[];
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    super.initState();
    widget.setPending(0);
    _fetch();
    widget.setPending(timetables.length);
  }

  Future<void> _fetch() async {
    final results = await semesterRepository.getAllTimetables(widget.id);
    setState(() => timetables
      ..clear()
      ..addAll(results));
    widget.setPending(timetables.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(timetables.length,
              (index) => timetables.elementAt(index).toResourceItem(context)),
        ),
      ),
    );
  }
}
