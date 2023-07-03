import 'package:flutter/material.dart';

class PhonenumberField extends StatelessWidget {
  final TextEditingController controller;
  final bool taken;
  const PhonenumberField({
    super.key,
    required this.controller,
    required this.taken,
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone number',
            hintText: '+254700000001',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (value) {
            if (value == null || value.isEmpty || value.trim() == "") {
              return 'Phone number is required';
            } else if (!RegExp(r"^/+254[0-9]{8-10}").hasMatch(value)) {
              return 'Enter a valid Kenyan phone number please';
            } else if (taken) {
              return 'Phone number is already taken';
            }
            return null;
          },
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
