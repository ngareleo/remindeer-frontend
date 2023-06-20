import 'package:flutter/material.dart';

import 'default.dart';

class AssignmentsPage extends SemesterPage {
  AssignmentsPage() : super(label: 'Assignments');
  @override
  Widget buildBody(BuildContext context) {
    return AssignmentsPageBody(setPending: super.setPending);
  }
}

class AssignmentsPageBody extends StatefulWidget {
  const AssignmentsPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<AssignmentsPageBody> createState() => _AssignmentsPageBodyState();
}

class _AssignmentsPageBodyState extends State<AssignmentsPageBody> {
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
