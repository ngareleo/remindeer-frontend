import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/screens/pages/timetable/components/timetable_event_card.dart';

class CardInfo {
  final TimeOfDay from;
  final TimeOfDay to;
  final String label;
  final String tag;
  CardInfo(
      {required this.from,
      required this.to,
      required this.label,
      required this.tag});
}

class TimetableDayGroup extends StatefulWidget {
  final String day;
  final List<CardInfo> cardInfo;

  const TimetableDayGroup({Key? key, required this.cardInfo, required this.day})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimetableDayGroupState();
}

class _TimetableDayGroupState extends State<TimetableDayGroup> {
  @override
  Widget build(BuildContext context) {
    final timetableInfo = widget.cardInfo;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.day,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
              children: List.generate(timetableInfo.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TimetableEventCard(
                from: convertToReadableTime(
                    timetableInfo.elementAt(index).from.hour,
                    timetableInfo.elementAt(index).from.minute),
                to: convertToReadableTime(
                    timetableInfo.elementAt(index).to.hour,
                    timetableInfo.elementAt(index).to.minute),
                label: timetableInfo.elementAt(index).label,
                tag: timetableInfo.elementAt(index).tag,
              ),
            );
          }))
        ],
      ),
    );
  }
}
