import 'package:flutter/material.dart';
import './active_tab.dart';
import './inactive_tab.dart';

class SlidingTabsWidget extends StatefulWidget {
  const SlidingTabsWidget({Key? key}) : super(key: key);

  @override
  _SlidingTabsWidgetState createState() => _SlidingTabsWidgetState();
}

class _SlidingTabsWidgetState extends State<SlidingTabsWidget> {
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
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [InactiveTabWidget(), ActiveTabWidget()],
      ),
    );
  }
}
