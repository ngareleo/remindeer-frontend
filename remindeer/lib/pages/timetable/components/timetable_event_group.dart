import 'package:remindeer/pages/timetable/components/timetable_event_card.dart';
import 'package:flutter/material.dart';

class TimetableDayGroupWidget extends StatefulWidget {
  const TimetableDayGroupWidget({
    Key? key,
    this.day,
  }) : super(key: key);

  final String? day;

  @override
  _TimetableDayGroupWidgetState createState() =>
      _TimetableDayGroupWidgetState();
}

class _TimetableDayGroupWidgetState extends State<TimetableDayGroupWidget> {
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Text(
              widget.day!,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TimetableEventCardWidget(),
          TimetableEventCardWidget()
        ],
      ),
    );
  }
}
