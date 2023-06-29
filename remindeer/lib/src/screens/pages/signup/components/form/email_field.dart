import 'package:flutter/material.dart';

class EmailAddressField extends StatelessWidget {
  final TextEditingController controller;
  const EmailAddressField({
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
          autofillHints: const [AutofillHints.email],
          obscureText: false,
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email address',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'janedoe@gmail.com',
          ),
          validator: (value) {
            if (value == null || value.isEmpty || value.trim() == "") {
              return 'Last name is required';
            } else if (!RegExp(
                    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*")
                .hasMatch(value)) {
              return 'Enter a valid email address please';
            }
            return null;
          },
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
