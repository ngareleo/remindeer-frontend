import 'package:flutter/material.dart';

class FirstnameField extends StatelessWidget {
  final TextEditingController controller;

  const FirstnameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          autofillHints: const [AutofillHints.name],
          obscureText: false,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last name is required';
            } else if (value.trim() == "") {
              return 'Last name is required';
            } else if (!RegExp("[a-z]").hasMatch(value)) {
              return 'Last name cannot contain non-alphabetic characters';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'First name',
            hintText: 'Jane',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
