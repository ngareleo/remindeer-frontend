import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';

enum EventCreationStatus { notStarted, started, completed }

class CreateUnitForm extends StatefulWidget {
  final int semesterId;
  final Function(Unit) onUnitCreated;
  const CreateUnitForm({
    Key? key,
    required this.semesterId,
    required this.onUnitCreated,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateUnitFormState();
}

class _CreateUnitFormState extends State<CreateUnitForm> {
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _lecturerController = TextEditingController();
  final _unitCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _semesterRepository = SemesterRepository.instance();
  final _unitRepository = UnitRepository.instance();

  var status = EventCreationStatus.notStarted;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (status == EventCreationStatus.completed) {
      _showSuccess();
      Navigator.of(context).pop();
    }
  }

  void _showCreationError() {
    const SnackBar snackBar = SnackBar(content: Text('Error adding unit'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSuccess() {
    const SnackBar snackBar = SnackBar(content: Text('New unit added'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addUnitToSemester() async {
    final unit = await _unitRepository.createUnit(Unit(
        name: _labelController.text,
        unitCode: _unitCodeController.text,
        description: _descriptionController.text,
        lecturer: _lecturerController.text));

    if (unit == null) {
      _showCreationError();
      return;
    }
    await _semesterRepository.addUnitToSemester(widget.semesterId, unit);
    widget.onUnitCreated(unit);
    setState(() => status = EventCreationStatus.completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add unit'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addUnitToSemester();
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
      onChanged: () => setState(() => status = EventCreationStatus.started),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showLabelFormField(),
          showUnitCodeField(),
          showLecturerField(),
          showDescriptionFormField(),
        ],
      ),
    );
  }

  Widget showLabelFormField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: false,
          controller: _labelController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter label';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Label*',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }

  Widget showUnitCodeField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: false,
          controller: _unitCodeController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter unit code';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Unit code*',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }

  Widget showDescriptionFormField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: false,
          controller: _descriptionController,
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Description',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
          maxLines: 2,
        ),
      ),
    );
  }

  Widget showLecturerField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: false,
          controller: _lecturerController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter lecturer name';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Lecturer*',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
