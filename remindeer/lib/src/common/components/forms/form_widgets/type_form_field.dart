import 'package:flutter/material.dart';

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
          DropdownMenuEntry(value: 1, label: 'Lecture')
        ],
        initialSelection: 0,
        label: const Text('Choose the event type...'),
      ),
    );
  }
}
