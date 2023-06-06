import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/structs/window.dart';

class TimeIntervalSection extends StatefulWidget {
  const TimeIntervalSection({Key? key, required this.onWindowChanged})
      : super(key: key);
  final Function onWindowChanged;

  @override
  State<StatefulWidget> createState() => _TimeIntervalSectionState();
}

class _TimeIntervalSectionState extends State<TimeIntervalSection> {
  bool eventIsAllDay = false;
  TimeOfDay? eventTimeStart;
  TimeOfDay? eventTimeEnd;
  Window? window;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.onWindowChanged(
                        eventIsAllDay, eventTimeStart, eventTimeEnd);
                  })
            ],
          ),
          Row(
            children: [
              getTimeStart(context),
              getTimeEnd(context),
            ],
          )
        ],
      ),
    );
  }

  Padding getTimeEnd(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: eventTimeEnd != null
          ? ActionChip(
              onPressed: eventIsAllDay
                  ? null
                  : () async {
                      final time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        eventTimeEnd = time!;
                      });
                      widget.onWindowChanged(
                          eventIsAllDay, eventTimeStart, eventTimeEnd);
                    },
              avatar: const Icon(Icons.close_rounded),
              label: Text("${eventTimeEnd?.hour}${eventTimeEnd?.minute}hrs"))
          : OutlinedButton(
              onPressed: eventIsAllDay
                  ? null
                  : () async {
                      final time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        eventTimeEnd = time!;
                        widget.onWindowChanged(
                            eventIsAllDay, eventTimeStart, eventTimeEnd);
                      });
                    },
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.add_rounded,
                  size: 18,
                ),
                Text('To')
              ]),
            ),
    );
  }

  Padding getTimeStart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: eventTimeStart != null
          ? ActionChip(
              onPressed: eventIsAllDay
                  ? null
                  : () async {
                      final time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        eventTimeStart = time!;
                        widget.onWindowChanged(
                            eventIsAllDay, eventTimeStart, eventTimeEnd);
                      });
                    },
              avatar: const Icon(Icons.close_rounded),
              label:
                  Text("${eventTimeStart?.hour}${eventTimeStart?.minute}hrs"))
          : OutlinedButton(
              onPressed: eventIsAllDay
                  ? null
                  : () async {
                      final time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        eventTimeStart = time!;
                        widget.onWindowChanged(
                            eventIsAllDay, eventTimeStart, eventTimeEnd);
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
    );
  }
}
