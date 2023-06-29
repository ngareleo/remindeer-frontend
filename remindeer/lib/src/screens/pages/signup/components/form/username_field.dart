import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  const UsernameField({
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
          obscureText: false,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty || value.trim() == "") {
              return 'Last name is required';
            } else if (!RegExp("[0-9a-z]").hasMatch(value)) {
              return 'Username can only contain alphanumeric characters [0-9a-z]';
            } else if (value.length > 10) {
              return 'Username cannot be longer than 10 characters';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'janadoey',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
