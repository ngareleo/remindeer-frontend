import 'package:flutter/material.dart';

class CreateSemesterFormWidget extends StatefulWidget {
  const CreateSemesterFormWidget({Key? key}) : super(key: key);

  @override
  _CreateSemesterFormWidgetState createState() =>
      _CreateSemesterFormWidgetState();
}

class _CreateSemesterFormWidgetState extends State<CreateSemesterFormWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Semester Label...',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xFFA8A8A8),
                      fontSize: 24,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Pick start date'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Pick end date'),
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Create semester'),
            ),
          ],
        ),
      ),
    );
  }
}
