import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';
import 'package:remindeer/src/models/unit.dart';

import '../links/link_to_semester.dart';
import '../links/link_to_timetable.dart';
import '../links/link_to_unit.dart';
import 'form_widgets/date_pick_section.dart';
import 'form_widgets/description_form_field.dart';
import 'form_widgets/label_form_field.dart';
import 'form_widgets/time_interval_section.dart';
import 'form_widgets/type_form_field.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateEventFormState();
}

enum EventType { regular, lecture }

class _CreateEventFormState extends State<CreateEventForm> {
  var eventType = EventType.regular;
  final List<DateTime?> dates = [];
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _semesterController = TextEditingController();
  final _timetableController = TextEditingController();
  final _unitController = TextEditingController();
  // final _venueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Window? window;

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
                  EventTypeField(
                    onChanged: (val) {
                      setState(() => eventType = val);
                    },
                  ),
                  EventLabelField(labelController: _labelController),
                  EventDescriptionField(
                      descriptionController: _descriptionController),
                  const Divider(
                    color: Colors.black12,
                  ),
                  TimeIntervalSection(
                    onWindowChanged:
                        (bool allDay, TimeOfDay? from, TimeOfDay? to) {
                      if (allDay) {
                        window = Window(isAllDay: true);
                      } else {
                        if (from != null && to != null) {
                          window = Window(
                              isAllDay: false,
                              from: from.hour * 100 + from.minute,
                              to: to.hour * 100 + to.minute);
                        }
                      }
                    },
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  DatePickSection(
                    onDatesChanged: (dates) => setState(() {
                      dates.clear();
                      dates.addAll(dates);
                    }),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  LinkToUnitWidget(controller: _unitController),
                  LinkToTimetable(
                    controller: _timetableController,
                  ),
                  LinkToSemesterWidget(
                    controller: _semesterController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
