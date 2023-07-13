import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/semester/components/create_homework_form.dart';
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
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: List.generate(homework.length,
                  (index) => homework[index].toResourceItem(context)),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 10,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: FilledButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => CreateHomeworkForm(
                          semesterId: widget.id,
                          onStatusChange: (EventCreationStatus status) {
                            if (status == EventCreationStatus.completed) {
                              _fetch();
                            }
                          },
                        )),
                child: const Text('Add some homework')),
          )
        ],
      ),
    );
  }
}
