import 'package:flutter/material.dart';
import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_group_item.dart';

class DashboardGroup extends StatelessWidget {
  const DashboardGroup({Key? key, required this.lectures}) : super(key: key);
  final List<Lecture> lectures;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            child: Text(
              'Today\'s Lectures',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xFF797979),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
                lectures.length,
                (index) => GestureDetector(
                      child: DashboardGroupItem(lecture: lectures[index]),
                    )),
          ),
        ],
      ),
    );
  }
}
