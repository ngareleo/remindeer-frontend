import 'package:flutter/material.dart';
import 'package:remindeer/src/features/api/semesters_api.dart';
import 'package:remindeer/src/models/semester.dart';

class LinkToSemesterWidget extends StatefulWidget {
  const LinkToSemesterWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _LinkToSemester();
}

class _LinkToSemester extends State<LinkToSemesterWidget> {
  final api = SemestersAPI();
  final semesters = <Semester>[];
  Semester? selectedSemester;

  @override
  void initState() {
    super.initState();
    _getSemesters();
  }

  Future<void> _getSemesters() async {
    semesters.clear();
    semesters.addAll(await api.getAllSemesters());
  }

  @override
  Widget build(BuildContext context) {
    return selectedSemester != null
        ? ActionChip(
            onPressed: () {
              setState(() => selectedSemester = null);
              widget.controller.text = "";
            },
            label: Text((selectedSemester?.name)!),
            avatar: const Icon(Icons.close_rounded))
        : Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: const Text('Link to semester'),
                        children: List.generate(
                            semesters.length,
                            (index) => SimpleDialogOption(
                                  onPressed: () {
                                    setState(() {
                                      selectedSemester = semesters[index];
                                      widget.controller.text =
                                          semesters[index].name;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(semesters[index].name),
                                )),
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
                  'Link to semester',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
          );
  }
}
