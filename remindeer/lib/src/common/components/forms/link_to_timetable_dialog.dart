import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/link_to_timetable.dart';
import 'package:remindeer/src/common/utils/values.dart';
import 'package:remindeer/src/features/api/timetables_api.dart';
import 'package:remindeer/src/models/timetable.dart';

class LinkToTimetableDialog extends StatefulWidget {
  final Function onLink;
  const LinkToTimetableDialog({
    Key? key,
    required this.onLink,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinkToTimetableDialogState();
}

class _LinkToTimetableDialogState extends State<LinkToTimetableDialog> {
  final timetables = <Timetable>[];
  final menuItems = <DropdownMenuEntry<int>>[];
  final api = TimetableAPI();

  Timetable? selectedTimetable;
  TimeOfDay? from;
  TimeOfDay? to;
  DaysOfWeek? dayOfWeek;

  @override
  void initState() {
    super.initState();
    _getTimetables();
  }

  Future<void> _getTimetables() async {
    timetables
      ..clear()
      ..addAll(await api.getAllTimetables());
    menuItems
      ..clear()
      ..addAll(List.generate(
          timetables.length,
          (index) => DropdownMenuEntry(
                value: index,
                label: timetables[index].label,
              )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: const BoxDecoration(
        color: Color(0xFFEBEBEB),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showDialogHeader(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                showTimetableChooser(context),
                showTimeRangeChooser(context),
                showDayofWeekPicker(),
              ],
            ),
          ),
          showDialogFooter(context),
        ],
      ),
    );
  }

  Padding showTimetableChooser(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: DropdownMenu<int>(
        width: MediaQuery.of(context).size.width - 150,
        dropdownMenuEntries: menuItems,
        initialSelection: 0,
        label: const Text('Choose the timetable...'),
        onSelected: (int? index) => setState(() {
          selectedTimetable = timetables[index!];
        }),
      ),
    );
  }

  Widget showDayofWeekPicker() {
    return dayOfWeek != null
        ? ActionChip(
            onPressed: () => setState(() => dayOfWeek = null),
            label: Text(dayOfWeek?.fullValue ?? ""),
            avatar: const Icon(Icons.close_rounded))
        : Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: FilledButton.tonal(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        title: const Text('Pick day of the week'),
                        children: List.generate(
                            DaysOfWeek.values.length,
                            (index) => SimpleDialogOption(
                                  onPressed: () {
                                    setState(() =>
                                        dayOfWeek = DaysOfWeek.values[index]);
                                    Navigator.pop(context);
                                  },
                                  child:
                                      Text(DaysOfWeek.values[index].fullValue),
                                )),
                      )),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_rounded),
                  Text('Pick day of the week')
                ],
              ),
            ),
          );
  }

  Padding showDialogHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Link to Timetable',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding showTimeRangeChooser(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          from != null
              ? ActionChip(
                  label: Text(from.toString()),
                  onPressed: () => setState(() => to = null))
              : OutlinedButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    setState(() => from = time);
                  },
                  child: const Text('From'),
                ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF404040),
              size: 24,
            ),
          ),
          to != null
              ? ActionChip(
                  label: Text("${(to?.hour)! * 100 + (to?.minute)!}hrs"),
                  onPressed: () => setState(() => to = null),
                )
              : OutlinedButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    setState(() => to = time);
                  },
                  child: const Text('To'),
                ),
        ],
      ),
    );
  }

  Container showDialogFooter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Link'),
            ),
          ],
        ),
      ),
    );
  }
}
