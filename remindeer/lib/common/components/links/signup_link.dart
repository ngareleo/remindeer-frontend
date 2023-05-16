import 'package:flutter/material.dart';

class SignupLink extends StatelessWidget {
  const SignupLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: const AlignmentDirectional(0, 0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (Navigator.of(context).canPop()) {
            Navigator.pushNamed(context, '/signup');
          }
        },
        child: Text(
          'I don\'t have an account',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
