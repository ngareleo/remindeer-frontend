import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';

import '../links/link_to_semester.dart';
import '../links/link_to_timetable.dart';
import '../links/link_to_unit.dart';
import 'form_widgets/date_pick_section.dart';
import 'form_widgets/description_form_field.dart';
import 'form_widgets/label_form_field.dart';
import 'form_widgets/time_interval_section.dart';
import 'form_widgets/type_form_field.dart';

class CreateEventForm extends StatefulWidget {
  final int? semesterId;
  const CreateEventForm({Key? key, this.semesterId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateEventFormState();
}

enum EventType { regular, lecture }

class _CreateEventFormState extends State<CreateEventForm> {
  var eventType = EventType.regular;
  final List<DateTime?> dates = [];
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  // final _venueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _eventRepository = EventRepository.instance();
  Unit? _unit;
  Semester? _semester;
  Timetable? _timetable;
  EventWindow? _window;

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
                    final event = Event(
                      label: _labelController.text,
                      description: _descriptionController.text,
                      window: _window!,
                    );
                    _eventRepository.createEvent(event);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('New event added!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: showForm(),
      ),
    );
  }

  Form showForm() {
    return Form(
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
                onWindowChanged: (bool allDay, TimeOfDay? from, TimeOfDay? to) {
                  if (allDay) {
                    _window = EventWindow(isAllDay: true);
                  } else {
                    if (from != null && to != null) {
                      _window = EventWindow(
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
                  dates
                    ..clear()
                    ..addAll(dates);
                }),
              ),
              const Divider(
                color: Colors.black12,
              ),
              LinkToUnitWidget(
                semesterId: widget.semesterId,
                onLink: (Unit? unit) => setState(() => _unit = unit),
              ),
              LinkToTimetable(
                onLink: (Timetable? timetable) =>
                    setState(() => _timetable = timetable),
              ),
              LinkToSemesterWidget(
                  onLink: (Semester? semester) =>
                      setState(() => _semester = semester)),
            ],
          ),
        ),
      ),
    );
  }
}
