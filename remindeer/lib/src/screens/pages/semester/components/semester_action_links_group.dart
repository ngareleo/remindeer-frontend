import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/links/action_link.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/remote_api/sharing.dart';
import 'package:remindeer/src/screens/pages/my_library/my_library.dart';

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
  final sharingProvider = SharingProvider.instance();

  @override
  void initState() {
    getSemester();
    super.initState();
  }

  Future<void> getSemester() async {
    final result = await semesterRepository.getSemester(widget.id);
    setState(() => semester = result);
  }

  Future<void> deleteSemester() async {
    await semesterRepository.deleteSemester(widget.id);
  }

  void shareResource() async {
    if (semester == null) return;
    await sharingProvider.shareSemester(semester!, semesterRepository);
  }

  void showMoreInformation() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SemesterPageLinkWidget(
              label: 'Invite someone',
              icon: Icon(
                Icons.add_rounded,
              ),
            ),
            SemesterPageLinkWidget(
              label: 'Share invite',
              icon: const Icon(
                Icons.share_rounded,
              ),
              onTap: () => shareResource(),
            ),
            SemesterPageLinkWidget(
              label: 'More information',
              icon: const Icon(
                Icons.info_rounded,
              ),
              onTap: () => showMoreInformation(),
            ),
            SemesterPageLinkWidget(
                label: 'Delete semester',
                icon: const Icon(
                  Icons.delete_rounded,
                ),
                onTap: () => showDeleteDialog()),
          ],
        ),
      ),
    );
  }

  void showDeleteDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete semester'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this semester?'),
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
                deleteSemester();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLibrary()),
                    (route) => false);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Semester deleted'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
