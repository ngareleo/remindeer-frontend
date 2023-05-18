import 'package:flutter/material.dart';

import '../../common/components/links/login_link.dart';
import 'components/form/phonenumber_field.dart';

class PhoneVerificationPageWidget extends StatefulWidget {
  const PhoneVerificationPageWidget({Key? key}) : super(key: key);

  @override
  _PhoneVerificationPageWidgetState createState() =>
      _PhoneVerificationPageWidgetState();
}

class _PhoneVerificationPageWidgetState
    extends State<PhoneVerificationPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          actions: const [],
          centerTitle: false,
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: Text(
                      'Phone Verification',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Roboto',
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: PhonenumberField(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/security');
                      },
                      child: const Text('Next'),
                    ),
                  ),
                  const LoginLink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
