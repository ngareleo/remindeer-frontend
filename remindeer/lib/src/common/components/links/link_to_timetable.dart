import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/values.dart';
import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/models/timetable.dart';

class LinkToTimetable extends StatefulWidget {
  final Function(Timetable? timetable) onLink;
  const LinkToTimetable({
    super.key,
    required this.onLink,
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
            onPressed: () => setState(() => widget.onLink(selectedTimetable!)),
            label: Text(selectedTimetable?.label ?? ""),
            avatar: const Icon(Icons.close_rounded))
        : Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                          title: const Text("Link to timetable"),
                          children: List.generate(
                              timetables.length,
                              (index) => SimpleDialogOption(
                                    onPressed: () => setState(
                                        () => widget.onLink(selectedTimetable)),
                                    child: Text(timetables[index].label),
                                  )),
                        ));
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
