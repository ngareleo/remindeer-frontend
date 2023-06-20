import 'package:flutter/material.dart';

import 'default.dart';

class ApprovalPage extends SemesterPage {
  ApprovalPage() : super(label: 'Approvals');
  @override
  Widget buildBody(BuildContext context) {
    return ApprovalsPageBody(setPending: super.setPending);
  }
}

class ApprovalsPageBody extends StatefulWidget {
  const ApprovalsPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<ApprovalsPageBody> createState() => _ApprovalsPageBodyState();
}

class _ApprovalsPageBodyState extends State<ApprovalsPageBody> {
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
