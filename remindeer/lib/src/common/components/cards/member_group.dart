import 'package:flutter/material.dart';

class MemberGroupWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MemberGroupWidget(
      {Key? key, required this.title, required this.children})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                children.length,
                (childrenIndex) {
                  final child = children[childrenIndex];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: child,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
