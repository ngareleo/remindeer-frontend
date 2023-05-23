import 'package:flutter/material.dart';

import 'components/create_semester_form.dart';

class NewSemesterPageWidget extends StatefulWidget {
  const NewSemesterPageWidget({Key? key}) : super(key: key);

  @override
  _NewSemesterPageWidgetState createState() => _NewSemesterPageWidgetState();
}

class _NewSemesterPageWidgetState extends State<NewSemesterPageWidget> {
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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Semester',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: const CreateSemesterFormWidget()),
          ),
        ),
      ),
    );
  }
}
