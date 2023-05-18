import 'package:flutter/material.dart';

class ActiveTabWidget extends StatefulWidget {
  const ActiveTabWidget({Key? key}) : super(key: key);

  @override
  _ActiveTabWidgetState createState() => _ActiveTabWidgetState();
}

class _ActiveTabWidgetState extends State<ActiveTabWidget> {
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
      constraints: const BoxConstraints(
        maxWidth: 150,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                child: Text(
                  'Assignments',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDF5),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                  child: Text(
                    '10',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 3,
          ),
        ],
      ),
    );
  }
}
