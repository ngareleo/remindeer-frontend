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
  final LecturesAPI api = LecturesAPI();
  List<Lecture> lectures = [];

  @override
  void initState() {
    super.initState();
    lectures = api.getLecturesByDate(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return DashboardGroup(
      lectures: lectures,
    );
  }
}
