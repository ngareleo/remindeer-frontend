import 'package:flutter/material.dart';
import 'package:remindeer/src/features/api/lectures_api.dart';
import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_group.dart';

class TodaysLecturesSection extends StatefulWidget {
  const TodaysLecturesSection({super.key, required this.date});

  final DateTime date;

  @override
  State<TodaysLecturesSection> createState() => _TodaysLecturesSectionState();
}

class _TodaysLecturesSectionState extends State<TodaysLecturesSection> {
  final api = LecturesAPI();
  final lectures = <Lecture>[];

  @override
  void initState() {
    super.initState();
    getLectures();
  }

  void getLectures() async {
    final data = await api.getAllLectures();
    setState(() => lectures.addAll(data));
  }

  @override
  Widget build(BuildContext context) {
    return DashboardGroup(
      lectures: lectures,
    );
  }
}
