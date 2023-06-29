import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? otherController;
  const ConfirmPasswordField(
      {super.key, required this.controller, required this.otherController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          obscureText: true,
          obscuringCharacter: "*",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            } else if (value != otherController!.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Confirm password',
            labelStyle: const TextStyle(
              color: Color(0xFF464F60),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            hintText: ' ',
            hintStyle: Theme.of(context).textTheme.bodySmall,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFA1A9B8),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            filled: true,
            suffixIcon: InkWell(
              onTap: () => {},
              focusNode: FocusNode(skipTraversal: true),
              child: const Icon(
                Icons.visibility_outlined,
                size: 24,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
