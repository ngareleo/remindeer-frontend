import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/create_event_form.dart';

class EventTypeField extends StatelessWidget {
  final Function onChanged;
  const EventTypeField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownMenu<int>(
        width: MediaQuery.of(context).size.width - 150,
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 0, label: 'Regular'),
          DropdownMenuEntry(value: 1, label: 'Lecture')
        ],
        initialSelection: 0,
        label: const Text('Choose the event type...'),
        onSelected: (value) => onChanged(EventType.values[value!]),
      ),
    );
  }
}
