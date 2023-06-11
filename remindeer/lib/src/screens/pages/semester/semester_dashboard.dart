import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/sliding_tabs.dart';
import 'package:remindeer/src/models/semester.dart';
import 'components/semester_page_header.dart';

class SemesterDashboardPage extends StatefulWidget {
  const SemesterDashboardPage({Key? key, required this.semester})
      : super(key: key);

  final Semester semester;

  @override
  State<StatefulWidget> createState() => _SemesterDashboardPageState();
}

class _SemesterDashboardPageState extends State<SemesterDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Semester',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary
                      ],
                      stops: const [0, 1],
                      begin: const AlignmentDirectional(-1, 0),
                      end: const AlignmentDirectional(1, 0),
                    ),
                  ),
                  child: SemesterPageHeader(
                    email: '',
                    label: widget.semester.name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: const SlidingTabsWidget(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
