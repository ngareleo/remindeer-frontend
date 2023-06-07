import 'package:flutter/material.dart';
import '../../../screens/pages/semester/semester_dashboard.dart';

class ResourceCardWidget extends StatefulWidget {
  const ResourceCardWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResourceCardWidgetState();
}

class _ResourceCardWidgetState extends State<ResourceCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    const SemesterDashboardPageWidget()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontFamily: 'Roboto',
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Meal timetable',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        const Text(
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
        ),
      ),
    );
  }
}
