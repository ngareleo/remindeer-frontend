import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/resource_helpers.dart';
import 'package:remindeer/src/features/local_api/models/homework/homework.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_group.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_group_item.dart';

class HomeworkDueThisWeekSection extends StatefulWidget {
  final List<Homework> homework;
  final DateTime today;
  const HomeworkDueThisWeekSection(
      {super.key, required this.homework, required this.today});

  @override
  State<HomeworkDueThisWeekSection> createState() =>
      _HomeworkDueThisWeekSectionState();
}

class _HomeworkDueThisWeekSectionState
    extends State<HomeworkDueThisWeekSection> {
  final _homework = <Homework>[];
  final _unitHomeworkMap = <Homework, Unit>{};

  final _homeworkRepository = HomeworkRepository.instance();
  DateTime? today;

  @override
  void initState() {
    today = widget.today;
    super.initState();
    _getEvents();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _getEvents();
  }

  void _getEvents() async {
    final homework = await _homeworkRepository.getAllHomework();
    setState(() => _homework
      ..clear()
      ..addAll(getHomeworkDueThisWeek(homework, today!)));

    await _fillUnitHomeworkMap();
  }

  Future<void> _fillUnitHomeworkMap() async {
    for (final homework in _homework) {
      final unit = await _homeworkRepository.getLinkedUnit(homework.id!);
      setState(() => _unitHomeworkMap[homework] = unit!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_homework.isEmpty) return Container();

    final map = _unitHomeworkMap.entries.toList();
    final children = Column(
        children: List.generate(
            _homework.length,
            (index) => DashboardGroupItem(
                labelLeadingText: "In",
                labelTrailingText:
                    "${widget.today.difference(map[index].key.due).inDays} days",
                label: map[index].value.name,
                leftText: map[index].value.unitCode,
                rightText: map[index].value.lecturer)));

    return DashboardGroup(
      label: "Homework due this week",
      child: children,
    );
  }
}
