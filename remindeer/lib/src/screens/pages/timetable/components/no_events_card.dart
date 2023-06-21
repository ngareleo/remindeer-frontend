import 'package:flutter/material.dart';

class NoEventsCard extends StatelessWidget {
  const NoEventsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        border: Border.all(
          color: const Color(0xFFEDEDED),
        ),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: Text(
        'No events. Add something',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
