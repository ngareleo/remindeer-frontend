import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarChooserWidget extends StatefulWidget {
  const CalendarChooserWidget({Key? key}) : super(key: key);

  @override
  _CalendarChooserWidgetState createState() => _CalendarChooserWidgetState();
}

class _CalendarChooserWidgetState extends State<CalendarChooserWidget> {
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
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(7, 17, 7, 17),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/left-chevron-icon.svg',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'April 2023',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/right-chevron-icon.svg',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InactiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
                ActiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
                InactiveDateItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveDateItem extends StatelessWidget {
  const ActiveDateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'W',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            '12',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InactiveDateItem extends StatelessWidget {
  const InactiveDateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'S',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '9',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
