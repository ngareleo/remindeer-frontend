import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/link_to_timetable_dialog.dart';
import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/models/timetable.dart';

class LinkToTimetable extends StatefulWidget {
  final TextEditingController controller;
  const LinkToTimetable({
    super.key,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _LinkToTimetableState();
}

class _LinkToTimetableState extends State<LinkToTimetable> {
  final api = TimetableAPI();
  final timetables = <Timetable>[];
  Timetable? selectedTimetable;

  @override
  void initState() {
    _getTimetables();
    super.initState();
  }

  Future<void> _getTimetables() async {
    final timetables = await api.getAllTimetables();
    setState(() {
      timetables
        ..clear()
        ..addAll(timetables);
    });
  }

  @override
  Widget build(BuildContext context) {
    return selectedTimetable != null
        ? ActionChip(
            onPressed: () {
              setState(() {
                selectedTimetable = null;
                widget.controller.text = "";
              });
            },
            label: Text(selectedTimetable?.label ?? ""),
            avatar: const Icon(Icons.close_rounded))
        : Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Dialog(
                        child: LinkToTimetableDialog(),
                      );
                    });
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.link_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                Text(
                  'Link to timetable',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
          );
  }
}
