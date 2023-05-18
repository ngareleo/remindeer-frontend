import 'package:flutter/material.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({
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
          Navigator.pushNamed(context, '/signin');
        },
        child: Text(
          'I already have an account',
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
