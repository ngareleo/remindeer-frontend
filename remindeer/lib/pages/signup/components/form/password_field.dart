import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Enter  password',
            labelStyle: const TextStyle(
              fontFamily: 'Roboto',
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
              onTap: () {},
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
