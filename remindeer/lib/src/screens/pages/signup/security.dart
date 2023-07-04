import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/login_link.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/screens/pages/signup/phone_verfication.dart';
import 'package:remindeer/src/screens/pages/signup/welcome_page.dart';

import 'components/form/confirm_password_field.dart';
import 'components/form/password_field.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authProvider = AuthProvider.instance();
  var _authStatus = AuthStatus.unknown;

  Future<void> createUserAccount() async {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as PhoneVerificationPageArguments;
    final user = await _authProvider.createNewUserAccount(
        email: arguments.personalDetails.email,
        name: arguments.personalDetails.name,
        username: arguments.personalDetails.username,
        phonenumber: arguments.phonenumber,
        password: _passwordController.text);

    debugPrint('user: $user');

    setState(() => _authStatus =
        user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated);
  }

  void moveToNextPage() {
    if (_authStatus == AuthStatus.authenticated) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomePage()));
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
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
                const LoginLink()
              ],
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
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await createUserAccount();
            if (_authStatus == AuthStatus.authenticated) {
              moveToNextPage();
            }
          }
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
            PasswordField(
              controller: _passwordController,
            ),
            ConfirmPasswordField(
              controller: _confirmPasswordController,
              otherController: _passwordController,
            ),
          ],
        ),
      ),
    );
  }

  Padding showHeader() {
    return const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
      child: Text(
        'Security',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
