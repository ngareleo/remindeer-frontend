import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/date_pick_section.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/description_form_field.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/label_form_field.dart';
import 'package:remindeer/src/common/components/links/link_to_unit.dart';
import 'package:remindeer/src/features/local_api/models/homework/homework.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

enum EventCreationStatus { notStarted, started, completed }

class CreateHomeworkForm extends StatefulWidget {
  final int semesterId;
  final Function(EventCreationStatus) onStatusChange;
  const CreateHomeworkForm({
    Key? key,
    required this.semesterId,
    required this.onStatusChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateHomeworkFormState();
}

class _CreateHomeworkFormState extends State<CreateHomeworkForm> {
  DateTime? date;
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Unit? _unit;

  final _homeworkRepository = HomeworkRepository.instance();
  final _semesterRepository = SemesterRepository.instance();

  var status = EventCreationStatus.notStarted;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    widget.onStatusChange(status);
    if (status == EventCreationStatus.completed) {
      _showSuccess();
      Navigator.of(context).pop();
    }
  }

  void _showCreationError() {
    const SnackBar snackBar =
        SnackBar(content: Text('Error creating homework'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSuccess() {
    const SnackBar snackBar = SnackBar(content: Text('Added homework'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addHomeworkToSemester() async {
    final homework = await _homeworkRepository.createHomework(
        Homework(
            label: _labelController.text,
            due: date!,
            description: _descriptionController.text),
        _unit!.id!);

    if (homework == null) {
      _showCreationError();
      return;
    }

    final result = await _semesterRepository.addHomeworkToSemester(
        widget.semesterId, homework.id!);

    if (result == null) {
      _showCreationError();
    } else {
      setState(() => status = EventCreationStatus.completed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add homework'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _unit != null) {
                    _addHomeworkToSemester();
                  }
                },
                child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: SingleChildScrollView(
            child: showForm(context),
          ),
        ),
      ),
    );
  }

  Form showForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventLabelField(labelController: _labelController),
          EventDescriptionField(descriptionController: _descriptionController),
          const Divider(
            color: Colors.black12,
          ),
          DatePickSection(onDatesChanged: (List<DateTime?> dates) {
            setState(() => date = dates.last);
          }),
          const Divider(
            color: Colors.black12,
          ),
          LinkToUnitWidget(
            semesterId: widget.semesterId,
            onLink: (Unit? unit) => setState(() => _unit = unit),
          ),
        ],
      ),
    );
  }
}
