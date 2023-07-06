import 'package:flutter/material.dart';

import 'components/create_semester_form.dart';

class NewSemesterPage extends StatefulWidget {
  const NewSemesterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewSemesterPageState();
}

class _NewSemesterPageState extends State<NewSemesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: Text('Semester', style: Theme.of(context).textTheme.titleMedium),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: const CreateSemesterForm()),
        ),
      ),
    );
  }
}
