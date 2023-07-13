import 'package:flutter/material.dart';

class DashboardGroup extends StatelessWidget {
  final String label;
  final Widget child;
  const DashboardGroup({
    Key? key,
    required this.child,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF797979),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
