import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/member_group.dart';
import 'package:remindeer/src/common/components/links/action_links_group.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/screens/pages/semester/components/semester_action_links_group.dart';
import 'package:remindeer/src/screens/pages/semester/components/semester_settings_page_header.dart';

class SemesterSettingsPage extends StatefulWidget {
  final int id;
  const SemesterSettingsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SemesterSettingsPageState();
}

class _SemesterSettingsPageState extends State<SemesterSettingsPage> {
  Semester? semester;
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    _getSemesterInfo();
    super.initState();
  }

  void _getSemesterInfo() {
    semesterRepository.getSemester(widget.id).then((value) {
      setState(() => semester = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        automaticallyImplyLeading: true,
        title: Text(
          'Semester Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SemesterSettingsPageHeader(
                    emailAddress: '',
                    title: semester!.label,
                  ),
                ),
                SemesterSettingsPageActionLinksGroup(
                  id: widget.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
