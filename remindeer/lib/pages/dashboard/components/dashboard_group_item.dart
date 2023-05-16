import 'package:flutter/material.dart';

import 'dashboard_resource_item_card.dart';

class DashboardGroupItemWidget extends StatefulWidget {
  const DashboardGroupItemWidget({Key? key}) : super(key: key);

  @override
  _DashboardGroupItemWidgetState createState() =>
      _DashboardGroupItemWidgetState();
}

class _DashboardGroupItemWidgetState extends State<DashboardGroupItemWidget> {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'In about ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '30 min',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: DashboardResourceItemCardWidget(),
          )
        ],
      ),
    );
  }
}
