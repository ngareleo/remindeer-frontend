import 'package:flutter/material.dart';

class SemesterSettingsPageHeaderWidget extends StatefulWidget {
  const SemesterSettingsPageHeaderWidget({Key? key}) : super(key: key);

  @override
  _SemesterSettingsPageHeaderWidgetState createState() =>
      _SemesterSettingsPageHeaderWidgetState();
}

class _SemesterSettingsPageHeaderWidgetState
    extends State<SemesterSettingsPageHeaderWidget> {
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/326/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Text(
              'Computer science 2022/23',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'jandode@gmail.com',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
