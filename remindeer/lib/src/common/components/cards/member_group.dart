import 'package:flutter/material.dart';

import 'member_card.dart';

class MemberGroupWidget extends StatefulWidget {
  const MemberGroupWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MemberGroupWidgetState();
}

class _MemberGroupWidgetState extends State<MemberGroupWidget> {
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text(
                'Moderators',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: MemberCard()),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: MemberCard(),
            ),
          ],
        ),
      ),
    );
  }
}
