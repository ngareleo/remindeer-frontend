import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/login_link.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/screens/pages/signup/phone_verfication.dart';

import 'components/form/email_field.dart';
import 'components/form/firstname_field.dart';
import 'components/form/username_field.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  late AnimationController? _progressController;
  final AuthProvider _authProvider = AuthProvider.instance();
  bool usernameTaken = false;
  bool emailTaken = false;

  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addListener(() => setState(() {}))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _progressController?.dispose();
    super.dispose();
  }

  void validateDetailsInServer() async {
    final valid = await _authProvider.validateUserDetails(
        username: _usernameController.text, email: _emailController.text);
    debugPrint('valid: $valid');
    if (valid != null) {
      setState(() {
        usernameTaken = valid.$1;
        emailTaken = valid.$2;
      });
    }
  }

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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: LinearProgressIndicator(
                      value: _progressController?.value,
                    ),
                  ),
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
          if (_formKey.currentState!.validate() &&
              !usernameTaken &&
              !emailTaken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhoneVerificationPage(
                          email: _emailController.text,
                          username: _usernameController.text,
                          name: _nameController.text,
                        )));
          }
        },
        child: const Text('Next'),
      ),
    );
  }

  Form showForm(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        validateDetailsInServer();
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FirstnameField(
              controller: _nameController,
            ),
            UsernameField(
              controller: _usernameController,
              taken: usernameTaken,
            ),
            EmailAddressField(
              controller: _emailController,
              taken: emailTaken,
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
