import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/member_group.dart';
import 'package:remindeer/src/common/components/links/action_links_group.dart';
import 'package:remindeer/src/screens/pages/semester/components/semester_settings_page_header.dart';

class SemesterSettingsPage extends StatefulWidget {
  const SemesterSettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SemesterSettingsPageState();
}

class _SemesterSettingsPageState extends State<SemesterSettingsPage> {
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
          child: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: SemesterSettingsPageHeader(),
                ),
                SemesterPageLinksGroup(),
                MemberGroupWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
