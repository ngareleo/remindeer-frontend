import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/values.dart';

class DatePickSection extends StatefulWidget {
  final Function(List<DateTime?>) onDatesChanged;
  const DatePickSection({Key? key, required this.onDatesChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickSectionState();
}

class _DatePickSectionState extends State<DatePickSection> {
  final dates = <DateTime?>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Wrap(
        children: [
          Column(
            children: List.generate(dates.length, (index) {
              final date = dates[index];
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ActionChip(
                  avatar: const Icon(Icons.close_rounded),
                  label: Text(
                      "${DaysOfWeek.values[index].value}, ${MonthsOfYear.values[index].value} ${date?.year}"),
                  onPressed: () {
                    setState(() => dates.removeAt(index));
                    widget.onDatesChanged(dates);
                  },
                ),
              );
            }),
          ),
          OutlinedButton(
            onPressed: () async {
              final temp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(21000));
              setState(() => dates.add(temp));
              widget.onDatesChanged(dates);
            },
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.add_rounded,
                size: 18,
              ),
              Text('Pick date')
            ]),
          )
        ],
      ),
    );
  }
}
