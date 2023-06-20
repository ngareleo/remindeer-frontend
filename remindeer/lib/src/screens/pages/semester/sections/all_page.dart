import 'package:flutter/material.dart';

import 'default.dart';

class AllPage extends SemesterPage {
  AllPage() : super(label: 'All');

  @override
  Widget buildBody(BuildContext context) {
    return AppPageBody(setPending: super.setPending);
  }
}

class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  @override
  void initState() {
    super.initState();
    widget.setPending(10);
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
