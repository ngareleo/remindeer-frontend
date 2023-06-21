import 'package:flutter/material.dart';

class TimetableDayGroup extends StatefulWidget {
  const TimetableDayGroup({
    Key? key,
    this.day,
  }) : super(key: key);

  final String? day;

  @override
  State<StatefulWidget> createState() => _TimetableDayGroupState();
}

class _TimetableDayGroupState extends State<TimetableDayGroup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.day!,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
