import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/sliding_tabs.dart';
import 'package:remindeer/src/features/local_api/models/semester.dart';
import 'components/semester_page_header.dart';
import 'sections/all_page.dart';
import 'sections/approvals_page.dart';
import 'sections/assignments_page.dart';
import 'sections/units_page.dart';

class SemesterDashboardPage extends StatefulWidget {
  const SemesterDashboardPage({Key? key, required this.semester})
      : super(key: key);

  final Semester semester;

  @override
  State<StatefulWidget> createState() => _SemesterDashboardPageState();
}

class _SemesterDashboardPageState extends State<SemesterDashboardPage> {
  static const _headerTitle = "Semester";

  var current = 0;
  final pages = [AllPage(), ApprovalPage(), AssignmentsPage(), UnitsPage()];

  @override
  void initState() {
    super.initState();
    current = 0;
  }

  @override
  Widget build(BuildContext context) {
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
                email: '',
                label: widget.semester.label,
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
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: pages[current].buildBody(context)),
            ],
          ),
        ),
      ),
    );
  }
}
