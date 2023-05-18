import 'package:flutter/material.dart';

import 'dashboard_group_item.dart';

class DashboardGroupWidget extends StatefulWidget {
  const DashboardGroupWidget({Key? key}) : super(key: key);

  @override
  _DashboardGroupWidgetState createState() => _DashboardGroupWidgetState();
}

class _DashboardGroupWidgetState extends State<DashboardGroupWidget> {
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
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
            children: [DashboardGroupItemWidget(), DashboardGroupItemWidget()],
          ),
        ],
      ),
    );
  }
}
