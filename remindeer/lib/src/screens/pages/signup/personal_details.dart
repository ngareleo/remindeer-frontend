import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/login_link.dart';

import 'components/form/email_field.dart';
import 'components/form/firstname_field.dart';
import 'components/form/lastname_field.dart';
import 'components/form/username_field.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 100, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showHeader(),
                  showForm(context),
                  showSubmitButton(context),
                  const LoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding showSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
          Navigator.pushNamed(context, "/phone");
        },
        child: const Text('Next'),
      ),
    );
  }

  Form showForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FirstnameField(
              controller: _firstnameController,
            ),
            LastnameField(
              controller: _lastnameController,
            ),
            UsernameField(
              controller: _usernameController,
            ),
            EmailAddressField(
              controller: _emailController,
            )
          ],
        ),
      ),
    );
  }

  Padding showHeader() {
    return const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
      child: Text(
        'Create account',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
