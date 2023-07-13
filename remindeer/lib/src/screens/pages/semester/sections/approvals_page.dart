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

  final Function(int) setPending;

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
      child: Column(
        children: [
          const SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
          showNoSuggestionsMessage()
        ],
      ),
    );
  }

  Widget showNoSuggestionsMessage() {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 10,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          "No suggestions at the moment",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        ));
  }
}
