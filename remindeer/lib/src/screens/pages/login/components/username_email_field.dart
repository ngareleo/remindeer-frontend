import 'package:flutter/material.dart';

class UsernameEmailField extends StatelessWidget {
  const UsernameEmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          autofillHints: const [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Username or email',
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Roboto',
                  color: const Color(0xFF464F60),
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
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }
}
