import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/values.dart';

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
                  chooseTimeIntervalsSection(context),
                  const Divider(
                    color: Colors.black12,
                  ),
                  showDateOfEventPicker(),
                  const Divider(
                    color: Colors.black12,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 5),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.link_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            Text(
                              'Link to unit',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Icons.link_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 18,
                        ),
                        Text(
                          'Link to timetable',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: TextButton(
                      onPressed: () {},
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding showDateOfEventPicker() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Wrap(
        children: [
          Column(
            children: List.generate(dates.length, (index) {
              final date = dates[index];
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ActionChip(
                  avatar: const Icon(Icons.close_rounded),
                  label: Text(
                      "${DaysOfWeek.values[index].value}, ${MonthsOfYear.values[index].value} ${date?.year}"),
                  onPressed: () {
                    setState(() {
                      dates.removeAt(index);
                    });
                  },
                ),
              );
            }),
          ),
          OutlinedButton(
            onPressed: () async {
              final temp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(21000));
              setState(() {
                dates.add(temp);
              });
            },
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.add_rounded,
                size: 18,
              ),
              Text('Pick date')
            ]),
          )
        ],
      ),
    );
  }

  Padding chooseTimeIntervalsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose the time intervals for the event',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                'All day',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Switch(
                  value: eventIsAllDay,
                  onChanged: (bool value) {
                    setState(() {
                      eventIsAllDay = value;
                    });
                  })
            ],
          ),
          Row(
            children: [
              eventTimeStart != null
                  ? ActionChip(
                      onPressed: eventIsAllDay
                          ? null
                          : () async {
                              final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              setState(() {
                                eventTimeStart = time!;
                              });
                            },
                      avatar: const Icon(Icons.close_rounded),
                      label: Text(
                          "${eventTimeStart?.hour}${eventTimeStart?.minute}hrs"))
                  : OutlinedButton(
                      onPressed: eventIsAllDay
                          ? null
                          : () async {
                              final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              setState(() {
                                eventTimeStart = time!;
                              });
                            },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            size: 18,
                          ),
                          Text(
                            'From',
                          )
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: eventTimeEnd != null
                    ? ActionChip(
                        onPressed: eventIsAllDay
                            ? null
                            : () async {
                                final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  eventTimeEnd = time!;
                                });
                              },
                        avatar: const Icon(Icons.close_rounded),
                        label: Text(
                            "${eventTimeEnd?.hour}${eventTimeEnd?.minute}hrs"))
                    : OutlinedButton(
                        onPressed: eventIsAllDay
                            ? null
                            : () async {
                                final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                setState(() {
                                  eventTimeEnd = time!;
                                });
                              },
                        child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_rounded,
                                size: 18,
                              ),
                              Text('To')
                            ]),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EventDescriptionField extends StatelessWidget {
  const EventDescriptionField({
    super.key,
    required TextEditingController descriptionController,
  }) : _descriptionController = descriptionController;

  final TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _descriptionController,
          validator: (value) {
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
          maxLines: 10,
        ),
      ),
    );
  }
}

class EventLabelField extends StatelessWidget {
  const EventLabelField({
    super.key,
    required TextEditingController labelController,
  }) : _labelController = labelController;

  final TextEditingController _labelController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _labelController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter label';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Label',
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}

class EventTypeField extends StatelessWidget {
  const EventTypeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownMenu<int>(
        width: MediaQuery.of(context).size.width - 150,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 0, label: 'Regular'),
          DropdownMenuEntry(value: 0, label: 'Lecture')
        ],
        label: const Text('Choose the event type...'),
      ),
    );
  }
}
