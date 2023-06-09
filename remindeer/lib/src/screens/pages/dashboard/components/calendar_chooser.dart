import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/common/utils/structs/date.dart';

class CalendarChooserWidget extends StatefulWidget {
  final Function onDateChange;
  const CalendarChooserWidget({Key? key, required this.onDateChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarChooserWidgetState();
}

class _CalendarChooserWidgetState extends State<CalendarChooserWidget> {
  final months = mapMonthToString();
  var month = 0;
  var day = 0;
  var weekday = 0;
  var year = 0;
  var activeWeek = 0;
  final days = <Map<int, Date>>[];

  @override
  void initState() {
    super.initState();
    var currentDate = DateTime.now();
    year = currentDate.year;
    month = currentDate.month;
    day = currentDate.day;
    weekday = currentDate.weekday;
    days.addAll(fillWeeks(seed: currentDate));
    activeWeek = days.indexWhere((element) => element.keys.contains(day));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(7, 17, 7, 17),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.white,
                  ),
                  onTap: () => {
                    setState(() {
                      if (month == 0) {
                        year--;
                        month = 11;
                      } else {
                        month--;
                      }
                      days.clear();
                      days.addAll(
                          fillWeeks(seed: DateTime(year, month + 1, 0)));
                    })
                  },
                ),
                Text(
                  '${months[month]} $year',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                  ),
                  onTap: () => {
                    setState(() {
                      if (month == 11) {
                        month = 0;
                        year++;
                      } else {
                        month++;
                      }
                      days.clear();
                      days.addAll(
                          fillWeeks(seed: DateTime(year, month + 1, 0)));
                    })
                  },
                )
              ],
            ),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                int sensitivity = 8;
                if (details.delta.dx > sensitivity) {
                  setState(() {
                    if (activeWeek == 3) {
                      activeWeek = 0;
                    } else {
                      activeWeek++;
                    }
                  });
                } else if (details.delta.dx < -sensitivity) {
                  setState(() {
                    if (activeWeek == 0) {
                      activeWeek = 3;
                    } else {
                      activeWeek--;
                    }
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  var item = days[activeWeek].entries.elementAt(index);
                  if (item.key == day) {
                    return GestureDetector(
                      child: ActiveDateItem(
                          label: item.value.weekday,
                          date: item.value.day.toString()),
                      onTap: () {
                        setState(() {});
                      },
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        day = item.key;
                      });
                      widget.onDateChange(item.value.date);
                    },
                    child: InactiveDateItem(
                        date: item.key.toString(), label: item.value.weekday),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveDateItem extends StatefulWidget {
  const ActiveDateItem({super.key, required this.label, required this.date});
  final String label;
  final String date;
  @override
  State<StatefulWidget> createState() => _ActiveDateItem();
}

class _ActiveDateItem extends State<ActiveDateItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.date,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InactiveDateItem extends StatefulWidget {
  const InactiveDateItem({super.key, required this.date, required this.label});
  final String label;
  final String date;

  @override
  State<StatefulWidget> createState() => _InactiveDateItem();
}

class _InactiveDateItem extends State<InactiveDateItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.date,
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
