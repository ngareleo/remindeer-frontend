import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/timetable/timetable_settings_page.dart';

class TimetablePageHeader extends StatefulWidget {
  const TimetablePageHeader(
      {Key? key, required this.title, required this.email})
      : super(key: key);

  final String? title;
  final String? email;

  @override
  State<StatefulWidget> createState() => _TimetablePageHeaderState();
}

class _TimetablePageHeaderState extends State<TimetablePageHeader> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary
            ],
            stops: const [0, 1],
            begin: const AlignmentDirectional(-1, 0),
            end: const AlignmentDirectional(1, 0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: Text(widget.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                            )),
                  ),
                  Text(
                    'by ${widget.email}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimetableSettingsPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
