import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/cards/member_group.dart';
import 'package:remindeer/src/common/components/links/action_links_group.dart';
import '../semester/components/semester_settings_page_header.dart';

class TimetableSettingsPage extends StatefulWidget {
  const TimetableSettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimetableSettingsPageState();
}

class _TimetableSettingsPageState extends State<TimetableSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        automaticallyImplyLeading: true,
        title: const Text(
          'Timetable settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [],
        centerTitle: false,
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
