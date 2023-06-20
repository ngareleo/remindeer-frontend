import 'package:flutter/material.dart';

import 'default.dart';

class UnitsPage extends SemesterPage {
  UnitsPage() : super(label: 'Units');
  @override
  Widget buildBody(BuildContext context) {
    return UnitsPageBody(setPending: super.setPending);
  }
}

class UnitsPageBody extends StatefulWidget {
  const UnitsPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<UnitsPageBody> createState() => _UnitsPageBodyState();
}

class _UnitsPageBodyState extends State<UnitsPageBody> {
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
