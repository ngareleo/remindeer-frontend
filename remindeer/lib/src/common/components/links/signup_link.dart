import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/signup/personal_details.dart';

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
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PersonalDetailsPage())),
        child: Text(
          'I don\'t have an account',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
