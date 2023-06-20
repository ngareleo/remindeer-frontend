import 'package:flutter/material.dart';

import 'default.dart';

class TimetablesPage extends SemesterPage {
  TimetablesPage() : super(label: 'Timetables');
  @override
  Widget buildBody(BuildContext context) {
    return TimetablesPageBody(setPending: super.setPending);
  }
}

class TimetablesPageBody extends StatefulWidget {
  const TimetablesPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<TimetablesPageBody> createState() => _TimetablesPageBodyState();
}

class _TimetablesPageBodyState extends State<TimetablesPageBody> {
  @override
  void initState() {
    super.initState();
    widget.setPending(20);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
