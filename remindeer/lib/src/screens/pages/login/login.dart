import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/signup_link.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/screens/home.dart';
import 'package:remindeer/src/screens/pages/signup/components/form/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authProvider = AuthProvider.instance();

  void logUserInAndValidate() async {
    if (_formKey.currentState!.validate()) {
      await _authProvider.login(
          _usernameController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 100, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showHeader(),
                  showForm(context),
                  showLoginButton(context),
                  const SignupLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding showLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FilledButton(
        onPressed: () {
          logUserInAndValidate();

          if (_authProvider.isLoggedIn()) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AppHomePage(),
              ),
              (r) => false,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.info_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Trouble logging you in, please check you password, email combination',
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.redAccent,
            ));
          }
        },
        child: const Text('Next'),
      ),
    );
  }

  Padding showHeader() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Text(
        'Sign in your account',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  SizedBox showForm(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          showUsernameField(),
          PasswordField(
            controller: _passwordController,
          )
        ],
      ),
    );
  }

  Padding showUsernameField() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autofocus: true,
          autofillHints: const [AutofillHints.email],
          controller: _usernameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Username';
            }
            return null;
          },
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: TextInputType.name,
        ),
      ),
    );
  }
}
