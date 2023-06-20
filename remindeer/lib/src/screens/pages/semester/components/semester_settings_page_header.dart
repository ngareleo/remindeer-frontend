import 'package:flutter/material.dart';

class SemesterSettingsPageHeader extends StatefulWidget {
  const SemesterSettingsPageHeader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SemesterSettingsPageHeaderState();
}

class _SemesterSettingsPageHeaderState
    extends State<SemesterSettingsPageHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/326/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
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
