import 'package:flutter/material.dart';
import 'action_link.dart';

class SemesterPageLinksGroup extends StatefulWidget {
  final int id;
  const SemesterPageLinksGroup({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SemesterPageLinksGroupState();
}

class _SemesterPageLinksGroupState extends State<SemesterPageLinksGroup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: SizedBox(
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
