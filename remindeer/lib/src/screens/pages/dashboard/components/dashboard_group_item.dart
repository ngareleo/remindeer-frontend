import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/dashboard_resource_item_card.dart';

class DashboardGroupItem extends StatelessWidget {
  final String labelLeadingText;
  final String labelTrailingText;
  final String label;
  final String leftText;
  final String rightText;

  const DashboardGroupItem(
      {Key? key,
      required this.labelLeadingText,
      required this.labelTrailingText,
      required this.label,
      required this.leftText,
      required this.rightText})
      : super(key: key);

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
                Text(
                  labelLeadingText,
                ),
                Text(
                  labelTrailingText,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: DashboardResourceItemCard(
              label: label,
              leftText: leftText,
              rightText: rightText,
            ),
          ),
        ],
      ),
    );
  }
}
