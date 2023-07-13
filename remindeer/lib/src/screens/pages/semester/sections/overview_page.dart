import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/tabs.dart';
import 'package:remindeer/src/features/local_api/models/resource.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

import 'default.dart';

class OverviewPage extends SemesterPage {
  final int id;
  OverviewPage(this.id) : super(label: 'Overview');

  @override
  Widget buildBody(BuildContext context) {
    return OverviewPageBody(setPending: super.setPending, id: id);
  }

  @override
  Widget buildHeader(BuildContext context, bool isActive, Function onPressed) {
    return GestureDetector(
        onTap: () => onPressed(),
        child: isActive
            ? ActiveTab(
                label: label,
              )
            : InactiveTab(
                label: label,
              ));
  }
}

class OverviewPageBody extends StatefulWidget {
  final int id;
  const OverviewPageBody(
      {super.key, required this.setPending, required this.id});

  final Function(int) setPending;

  @override
  State<OverviewPageBody> createState() => _OverviewPageBodyState();
}

class _OverviewPageBodyState extends State<OverviewPageBody> {
  final resources = <Resource>[];
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    super.initState();
    widget.setPending(0);
    _fetch();
  }

  Future<void> _fetch() async {
    resources
      ..clear()
      ..addAll(await semesterRepository.getAllResources(widget.id));
    widget.setPending(resources.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
                children: List.generate(
                    resources.length,
                    (index) =>
                        resources.elementAt(index).toResourceItem(context)))));
  }
}
