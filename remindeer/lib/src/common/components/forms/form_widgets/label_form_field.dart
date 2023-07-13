import 'package:flutter/material.dart';

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
}
