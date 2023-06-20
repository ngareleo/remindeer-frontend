import 'package:flutter/material.dart';

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
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Text(
                    'by ${widget.email}',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.edit_rounded,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
