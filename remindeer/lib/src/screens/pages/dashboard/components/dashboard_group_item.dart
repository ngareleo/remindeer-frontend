import 'package:flutter/material.dart';
import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_resource_item_card.dart';

class DashboardGroupItem extends StatelessWidget {
  const DashboardGroupItem({Key? key, required this.lecture}) : super(key: key);

  final Lecture lecture;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'In about ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '30 min',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: DashboardResourceItemCard(lecture: lecture),
          ),
        ],
      ),
    );
  }
}
