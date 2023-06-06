import 'package:flutter/material.dart';

class LinkToSemesterWidget extends StatelessWidget {
  const LinkToSemesterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: TextButton(
        onPressed: () {},
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            Icons.link_rounded,
            color: Theme.of(context).primaryColor,
            size: 18,
          ),
          Text(
            'Link to semester',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
