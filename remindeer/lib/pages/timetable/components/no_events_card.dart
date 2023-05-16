import 'package:flutter/material.dart';

class NoEventsCardWidget extends StatefulWidget {
  const NoEventsCardWidget({Key? key}) : super(key: key);

  @override
  _NoEventsCardWidgetState createState() => _NoEventsCardWidgetState();
}

class _NoEventsCardWidgetState extends State<NoEventsCardWidget> {
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
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        border: Border.all(
          color: const Color(0xFFEDEDED),
        ),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: const Text(
        'No events. Add something',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFF464F60),
        ),
      ),
    );
  }
}
