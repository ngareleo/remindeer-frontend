import 'package:flutter/material.dart';

class SlidingTabs extends StatelessWidget {
  final List<Widget> tabs;
  const SlidingTabs({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(tabs.length, (index) => tabs[index]),
      ),
    );
  }
}
