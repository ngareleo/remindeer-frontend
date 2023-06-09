import 'package:flutter/material.dart';
import 'package:remindeer/src/models/event.dart';
import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/models/semester.dart';
import 'package:remindeer/src/models/task.dart';
import 'package:remindeer/src/models/timetable.dart';
import 'package:remindeer/src/models/unit.dart';

enum ContentFilters {
  semesters("Semester", Semester),
  timetables("Timetable", Timetable),
  events("Events", Event),
  tasks("Tasks", Task),
  lectures("Lectures", Lecture),
  units("Units", Unit);

  const ContentFilters(this.label, this.representingClass);
  final String label;
  final Type representingClass;
}

class MyLibrarySelectionPillGroup extends StatefulWidget {
  const MyLibrarySelectionPillGroup({Key? key, required this.onFilterChange})
      : super(key: key);

  final Function onFilterChange;

  @override
  State<StatefulWidget> createState() => _MyLibrarySelectionPillGroupState();
}

class _MyLibrarySelectionPillGroupState
    extends State<MyLibrarySelectionPillGroup> {
  final filters = <ContentFilters>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final others = ContentFilters.values.toSet().difference(filters);

    // active action chips
    final filterChips = List.generate(filters.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 4),
        child: ActionChip(
          avatar: const Icon(Icons.close_rounded),
          label: Text(
            filters.elementAt(index).label,
          ),
          padding: const EdgeInsets.all(2),
          onPressed: () {
            setState(() => filters.remove(filters.elementAt(index)));
            widget.onFilterChange(filters);
          },
        ),
      );
    });

    // inactive action chips
    filterChips.addAll(List.generate(others.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 4),
        child: ActionChip(
          label: Text(others.elementAt(index).label),
          padding: const EdgeInsets.all(2),
          onPressed: () {
            setState(() => filters.add(others.elementAt(index)));
            widget.onFilterChange(filters);
          },
        ),
      );
    }));

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            children: filterChips,
          ),
        ),
      ),
    );
  }
}
