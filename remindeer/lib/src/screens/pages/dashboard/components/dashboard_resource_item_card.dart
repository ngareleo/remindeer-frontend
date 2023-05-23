import 'package:flutter/material.dart';

class DashboardResourceItemCardWidget extends StatefulWidget {
  const DashboardResourceItemCardWidget({Key? key}) : super(key: key);

  @override
  _DashboardResourceItemCardWidgetState createState() =>
      _DashboardResourceItemCardWidgetState();
}

class _DashboardResourceItemCardWidgetState
    extends State<DashboardResourceItemCardWidget> {
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Simulation and Modelling',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'SCO312',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFF6B6B6B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      'Dr. Kianda Kinyua',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
