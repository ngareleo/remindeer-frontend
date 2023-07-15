import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import '../../../../common/components/links/action_link.dart';

class SemesterSettingsPageActionLinksGroup extends StatefulWidget {
  final int id;
  const SemesterSettingsPageActionLinksGroup({Key? key, required this.id})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SemesterSettingsPageActionLinksGroupState();
}

class _SemesterSettingsPageActionLinksGroupState
    extends State<SemesterSettingsPageActionLinksGroup> {
  Semester? semester;
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    getSemester();
    super.initState();
  }

  Future<void> getSemester() async {
    final result = await semesterRepository.getSemester(widget.id);
    setState(() => semester = result);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SemesterPageLinkWidget(
              label: 'Invite someone',
              icon: Icon(
                Icons.add,
              ),
            ),
            const SemesterPageLinkWidget(
              label: 'Share invite',
              icon: Icon(
                Icons.share,
              ),
            ),
            const SemesterPageLinkWidget(
              label: 'More information',
              icon: Icon(
                Icons.info_rounded,
              ),
            ),
            SemesterPageLinkWidget(
              label: 'Delete semester',
              icon: const Icon(
                Icons.delete,
              ),
              onTap: () => showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete semester'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                              'Are you sure you want to delete this semester?'),
                          Text('This action cannot be undone! You will lose:'),
                          Text('- All subjects'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FilledButton.tonal(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text('Approve'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
