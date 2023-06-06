import 'package:flutter/material.dart';

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
