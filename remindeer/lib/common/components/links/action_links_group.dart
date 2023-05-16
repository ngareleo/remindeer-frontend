import 'package:flutter/material.dart';
import 'action_link.dart';

class SemesterPageLinksGroupWidget extends StatefulWidget {
  const SemesterPageLinksGroupWidget({Key? key}) : super(key: key);

  @override
  _SemesterPageLinksGroupWidgetState createState() =>
      _SemesterPageLinksGroupWidgetState();
}

class _SemesterPageLinksGroupWidgetState
    extends State<SemesterPageLinksGroupWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SemesterPageLinkWidget(
              label: 'Invite someone',
              icon: Icon(
                Icons.add,
              ),
            ),
            SemesterPageLinkWidget(
              label: 'Share invite',
              icon: Icon(
                Icons.share,
              ),
            ),
            SemesterPageLinkWidget(
              label: 'More information',
              icon: Icon(
                Icons.info_rounded,
              ),
            ),
            SemesterPageLinkWidget(
              label: 'Delete semester',
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
