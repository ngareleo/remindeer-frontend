import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/link_to_timetable_dialog.dart';

class LinkToTimetableWidget extends StatelessWidget {
  const LinkToTimetableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 5),
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Dialog(
                  child: LinkToTimetableDialog(),
                );
              });
        },
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            Icons.link_rounded,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          Text(
            'Link to timetable',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
