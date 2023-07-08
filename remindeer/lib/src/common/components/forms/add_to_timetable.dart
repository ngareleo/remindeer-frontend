import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/description_form_field.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/label_form_field.dart';
import 'package:remindeer/src/common/components/forms/form_widgets/venue_form_field.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/common/utils/values.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';

enum EventCreationStatus { notStarted, started, completed }

class AddToTimetableForm extends StatefulWidget {
  final Timetable timetable;
  final Function onLink;
  const AddToTimetableForm({
    Key? key,
    required this.timetable,
    required this.onLink,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddToTimetableFormState();
}

class _AddToTimetableFormState extends State<AddToTimetableForm> {
  final timetables = <Timetable>[];
  final eventApi = EventRepository.instance();
  final labelController = TextEditingController();
  final descriptionController = TextEditingController();
  final venueController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  EventWindow? window;
  final _eventRepository = EventRepository.instance();
  final _timetableRepository = EventRepository.instance();

  TimeOfDay? from;
  TimeOfDay? to;
  DaysOfWeek? dayOfWeek;

  EventCreationStatus status = EventCreationStatus.notStarted;

  void addEvent() async {
    final event = Event(
        label: labelController.text,
        description: descriptionController.text,
        venue: venueController.text,
        window: EventWindow(
          from: from!.hour * 100 + from!.minute,
          to: to!.hour * 100 + to!.minute,
        ),
        repeat: RepeatFrequency.weekly,
        repeatTo: widget.timetable.validUntil,
        dayOfWeek: dayOfWeek);

    await _eventRepository.addEvent(event);
    await _timetableRepository.addEvent(event);
    setState(() => status = EventCreationStatus.completed);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (status == EventCreationStatus.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New event added!')),
      );
      Navigator.pop(context);
    }
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
                  if (formKey.currentState!.validate() &&
                      from != null &&
                      to != null &&
                      dayOfWeek != null) addEvent();
                },
                child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () => setState(() => status = EventCreationStatus.started),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EventLabelField(labelController: labelController),
                        EventVenueField(controller: venueController),
                        showTimeRangeChooser(context),
                        showDayofWeekPicker(),
                        EventDescriptionField(
                            descriptionController: descriptionController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: OutlinedButton(
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
                                    child: Text(
                                        DaysOfWeek.values[index].fullValue),
                                  )),
                        )),
                child: const Text('Pick day of the week')),
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
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          from != null
              ? ActionChip(
                  label: Text(convertToReadableTime(from!.hour, from!.minute)),
                  onPressed: () => setState(() => from = null))
              : OutlinedButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    setState(() => from = time);
                  },
                  child: const Text('From'),
                ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xFF404040),
                size: 18,
              ),
            ),
          ),
          to != null
              ? ActionChip(
                  label: Text(convertToReadableTime(to!.hour, to!.minute)),
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
