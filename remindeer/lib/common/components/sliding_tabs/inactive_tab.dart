import 'package:flutter/material.dart';

class InactiveTabWidget extends StatefulWidget {
  const InactiveTabWidget({Key? key}) : super(key: key);

  @override
  _InactiveTabWidgetState createState() => _InactiveTabWidgetState();
}

class _InactiveTabWidgetState extends State<InactiveTabWidget> {
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
      width: 100,
      height: 100,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                child: Text(
                  'All',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xFF464F60),
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 7,
          ),
        ],
      ),
    );
  }
}
