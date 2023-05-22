import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';

class CalendarChooserWidget extends StatefulWidget {
  final Function? onDateChange;
  const CalendarChooserWidget({Key? key, this.onDateChange}) : super(key: key);

  @override
  _CalendarChooserWidgetState createState() => _CalendarChooserWidgetState();
}

class _CalendarChooserWidgetState extends State<CalendarChooserWidget> {
  Map<int, String> months = mapMonthToString();
  int month = 0;
  int day = 0;
  int weekday = 0;
  int year = 0;
  Map<int, String> days = {};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    var currentDate = DateTime.now();
    year = currentDate.year;
    month = currentDate.month;
    day = currentDate.day;
    weekday = currentDate.weekday;

    
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                        month = 11;
                      } else {
                        month--;
                      }
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
                      } else {
                        month++;
                      }
                    })
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InactiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
                ActiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveDateItem extends StatelessWidget {
  const ActiveDateItem({
    super.key,
  });

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
          const Text(
            'W',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '12',
            style: TextStyle(
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

class InactiveDateItem extends StatelessWidget {
  const InactiveDateItem({
    super.key,
  });

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
            'S',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '9',
            style: TextStyle(
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
