import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/login_link.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/screens/pages/signup/personal_details.dart';
import 'package:remindeer/src/screens/pages/signup/security.dart';

import 'components/form/phonenumber_field.dart';

class PhoneVerificationPageArguments {
  final String phonenumber;
  final PersonalDetailsPageArguments personalDetails;

  const PhoneVerificationPageArguments(
      {required this.phonenumber, required this.personalDetails});
}

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _phonenumberController = TextEditingController();
  final AuthProvider _authProvider = AuthProvider.instance();
  bool phonenumberTaken = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> validateDetailsInServer() async {
    final valid =
        await _authProvider.validatePhonenumber(_phonenumberController.text);
    if (valid != null) {
      setState(() => phonenumberTaken = valid);
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
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 100, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showHeader(context),
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
        onPressed: () {
          if (_formKey.currentState!.validate() && !phonenumberTaken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SecurityPage(),
                    settings: RouteSettings(
                        arguments: PhoneVerificationPageArguments(
                      phonenumber: _phonenumberController.text,
                      personalDetails: ModalRoute.of(context)!
                          .settings
                          .arguments as PersonalDetailsPageArguments,
                    ))));
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
            PhonenumberField(
              controller: _phonenumberController,
              taken: phonenumberTaken,
            )
          ],
        ),
      ),
    );
  }

  Padding showHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
      child: Text(
        'Phone Verification',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'Roboto',
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
