import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller,
  });

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool viewPassword = false;

  @override
  void initState() {
    super.initState();
    viewPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          obscureText: viewPassword,
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter  password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
