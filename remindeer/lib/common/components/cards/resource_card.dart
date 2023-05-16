import 'package:flutter/material.dart';

class ResourceCardWidget extends StatefulWidget {
  const ResourceCardWidget({Key? key}) : super(key: key);

  @override
  _ResourceCardWidgetState createState() => _ResourceCardWidgetState();
}

class _ResourceCardWidgetState extends State<ResourceCardWidget> {
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
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 8,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Timetable',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Meal timetable',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Last Modified 30 Min ago',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
