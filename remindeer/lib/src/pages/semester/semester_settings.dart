import 'package:flutter/material.dart';
import 'components/semester_settings_page_header.dart';
import '../../common/components/cards/member_group.dart';
import '../../common/components/links/action_links_group.dart';

class SemesterSettingsPageWidget extends StatefulWidget {
  const SemesterSettingsPageWidget({Key? key}) : super(key: key);

  @override
  _SemesterSettingsPageWidgetState createState() =>
      _SemesterSettingsPageWidgetState();
}

class _SemesterSettingsPageWidgetState
    extends State<SemesterSettingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F9F9),
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
              fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
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
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: SemesterSettingsPageHeaderWidget(),
                  ),
                  const SemesterPageLinksGroupWidget(),
                  MemberGroupWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
