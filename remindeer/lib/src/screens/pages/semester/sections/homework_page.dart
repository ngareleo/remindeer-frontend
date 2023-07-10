import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/homework/homework.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

import 'default.dart';

class HomeworkPage extends SemesterPage {
  final int id;
  HomeworkPage(this.id) : super(label: 'Homework');
  @override
  Widget buildBody(BuildContext context) {
    return HomeworkPageBody(setPending: super.setPending, id: id);
  }
}

class HomeworkPageBody extends StatefulWidget {
  final int id;
  final Function(int) setPending;

  const HomeworkPageBody(
      {super.key, required this.setPending, required this.id});

  @override
  State<HomeworkPageBody> createState() => _HomeworkPageBodyState();
}

class _HomeworkPageBodyState extends State<HomeworkPageBody> {
  final homework = <Homework>[];
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    final results = await semesterRepository.getAllHomeworks(widget.id);
    setState(() => homework
      ..clear()
      ..addAll(results));
    widget.setPending(homework.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
