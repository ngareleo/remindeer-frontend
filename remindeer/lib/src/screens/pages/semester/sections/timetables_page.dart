import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/common/components/sliding_tabs/tabs.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';

import 'default.dart';

class TimetablesPage extends SemesterPage {
  final int id;
  int _pending = 0;

  void _setPending(int value) {
    _pending = value;
  }

  TimetablesPage(this.id) : super(label: 'Timetables');
  @override
  Widget buildBody(BuildContext context) {
    return TimetablesPageBody(setPending: _setPending, id: id);
  }

  @override
  Widget buildHeader(
    BuildContext context,
    bool isActive,
    Function onPressed,
  ) {
    return GestureDetector(
        onTap: () => onPressed(),
        child: isActive
            ? ActiveTab(
                label: label,
                pending: _pending.toString(),
              )
            : InactiveTab(
                label: label,
                pending: _pending.toString(),
              ));
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
  final allTimetables = <Timetable>{};
  final timetables = <Timetable>{};
  final semesterRepository = SemesterRepository.instance();
  final timetableRepository = TimetableRepository.instance();

  @override
  void initState() {
    super.initState();
    widget.setPending(0);
    _fetch();
  }

  Future<void> _fetch() async {
    final results = await semesterRepository.getAllTimetables(widget.id);
    final allResults = await timetableRepository.getAllTimetables();
    setState(() => timetables
      ..clear()
      ..addAll(results));

    setState(() => allTimetables
      ..clear()
      ..addAll(allResults));
    debugPrint('timetables: ${timetables.length}');
    widget.setPending(timetables.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: List.generate(
                  timetables.length,
                  (index) =>
                      timetables.elementAt(index).toResourceItem(context)),
            ),
          ),
          showAddTimetableButton()
        ],
      ),
    );
  }

  Widget showAddTimetableButton() {
    final unlinkedTimatables = allTimetables
        .map((e) => e.id)
        .toSet()
        .difference(timetables.map((e) => e.id).toSet());
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: FilledButton(
        onPressed: () => showLinkDialog(unlinkedTimatables),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.add,
                size: 16,
              ),
            ),
            Text('Add timetable'),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showLinkDialog(Set<Id?> unlinkedTimatables) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: const Text('Link timetables'),
              children: unlinkedTimatables.isEmpty
                  ? [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'No timetables to link',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    ]
                  : List.generate(
                      unlinkedTimatables.length,
                      (index) => SimpleDialogOption(
                          onPressed: () => {
                                Navigator.pop(context),
                                semesterRepository
                                    .addTimetableToSemester(
                                  widget.id,
                                  allTimetables
                                      .where((element) =>
                                          element.id ==
                                          allTimetables.elementAt(index).id)
                                      .first,
                                )
                                    .then((value) async {
                                  await _fetch();
                                })
                              },
                          child: Text(allTimetables
                              .where((element) =>
                                  element.id ==
                                  allTimetables.elementAt(index).id)
                              .first
                              .label))),
            ));
  }
}
