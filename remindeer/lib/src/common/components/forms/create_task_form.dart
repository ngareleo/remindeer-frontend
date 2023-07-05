import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/date_pick_section.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/description_form_field.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/label_form_field.dart';
import 'package:remindeer/src/common/components/links/link_to_semester.dart';
import 'package:remindeer/src/common/components/links/link_to_timetable.dart';
import 'package:remindeer/src/common/components/links/link_to_unit.dart';
import 'package:remindeer/src/models/semester.dart';
import 'package:remindeer/src/models/timetable.dart';
import 'package:remindeer/src/models/unit.dart';

enum TaskType { regular, assignment }

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  bool eventIsAllDay = false;
  var eventType = TaskType.regular;
  final List<DateTime?> dates = [];
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Unit? _unit;
  Semester? _semester;
  Timetable? _timetable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new task'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(onPressed: () {}, child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showtaskType(context),
                  EventLabelField(labelController: _labelController),
                  EventDescriptionField(
                      descriptionController: _descriptionController),
                  const Divider(
                    color: Colors.black12,
                  ),
                  DatePickSection(onDatesChanged: () => {}),
                  const Divider(
                    color: Colors.black12,
                  ),
                  LinkToUnitWidget(
                    onLink: (Unit? unit) => setState(() {
                      _unit = unit;
                    }),
                  ),
                  LinkToTimetable(
                    onLink: (Timetable? timetable) => setState(() {
                      _timetable = timetable;
                    }),
                  ),
                  LinkToSemesterWidget(
                      onLink: (Semester? semester) =>
                          setState(() => _semester = semester)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding showtaskType(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownMenu<int>(
        width: MediaQuery.of(context).size.width,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 0, label: 'Regular'),
          DropdownMenuEntry(value: 1, label: 'Assignment')
        ],
        initialSelection: 0,
        label: const Text('Choose the task type...'),
      ),
    );
  }
}
