import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/date_pick_section.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/time_interval_section.dart';

import '../links/link_to_semester.dart';
import '../links/link_to_timetable.dart';
import '../links/link_to_unit.dart';
import 'form_widgets/description_form_field.dart';
import 'form_widgets/label_form_field.dart';
import 'form_widgets/type_form_field.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  bool eventIsAllDay = false;
  TimeOfDay? eventTimeStart;
  TimeOfDay? eventTimeEnd;
  final List<DateTime?> dates = [];
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _venueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new event'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Creating new event')),
                    );
                  }
                },
                child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EventTypeField(),
                  EventLabelField(labelController: _labelController),
                  EventDescriptionField(
                      descriptionController: _descriptionController),
                  const Divider(
                    color: Colors.black12,
                  ),
                  TimeIntervalSection(),
                  const Divider(
                    color: Colors.black12,
                  ),
                  DatePickSection(),
                  const Divider(
                    color: Colors.black12,
                  ),
                  LinkToUnitWidget(),
                  LinkToTimetableWidget(),
                  LinkToSemesterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
