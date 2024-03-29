import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/tabs.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/screens/pages/semester/sections/timetables_page.dart';
import 'components/semester_page_header.dart';
import 'sections/overview_page.dart';
import 'sections/approvals_page.dart';
import 'sections/homework_page.dart';
import 'sections/units_page.dart';

class SemesterDashboardPage extends StatefulWidget {
  final int semesterId;

  const SemesterDashboardPage({Key? key, required this.semesterId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SemesterDashboardPageState();
}

class _SemesterDashboardPageState extends State<SemesterDashboardPage> {
  final _headerTitle = "Semester";
  final _semesterRepository = SemesterRepository.instance();

  var current = 0;
  Semester? semester;

  @override
  void initState() {
    super.initState();
    current = 0;
    getSemester();
  }

  Future<void> getSemester() async {
    final result = await _semesterRepository.getSemester(widget.semesterId);
    setState(() => semester = result);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OverviewPage(widget.semesterId),
      TimetablesPage(widget.semesterId),
      ApprovalPage(),
      HomeworkPage(widget.semesterId),
      UnitsPage(widget.semesterId)
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        automaticallyImplyLeading: true,
        title: Text(
          _headerTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
              SemesterPageHeader(
                email: 'janedoe@gmail.com',
                label: semester?.label ?? '',
                id: widget.semesterId,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: SlidingTabs(
                    tabs: List.generate(
                        pages.length,
                        (index) => pages[index].buildHeader(
                            context,
                            current == index,
                            () => {setState(() => current = index)})),
                  ),
                ),
              ),
              Expanded(child: pages[current].buildBody(context)),
            ],
          ),
        ),
      ),
    );
  }
}
