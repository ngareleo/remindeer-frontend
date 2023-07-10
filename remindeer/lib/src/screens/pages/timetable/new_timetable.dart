import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/timetable/components/create_timetable.dart';

class NewTimetablePage extends StatefulWidget {
  const NewTimetablePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTimetablePageState();
}

class _NewTimetablePageState extends State<NewTimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text('New timetable',
            style: Theme.of(context).textTheme.titleMedium),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: const CreateTimetableForm()),
        ),
      ),
    );
  }
}
