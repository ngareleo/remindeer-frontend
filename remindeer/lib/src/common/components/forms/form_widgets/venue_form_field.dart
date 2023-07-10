import 'package:flutter/material.dart';

class EventVenueField extends StatelessWidget {
  final TextEditingController controller;

  const EventVenueField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10, top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: false,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter the events venue';
            }
            return null;
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Venue',
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
