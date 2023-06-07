import 'package:flutter/material.dart';

class ResourceCardExpanded extends StatefulWidget {
  const ResourceCardExpanded({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResourceCardExpandedState();
}

class _ResourceCardExpandedState extends State<ResourceCardExpanded> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'Roboto',
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
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
                        ),
                        const Text(
                          'Due 13th march 2023',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 11,
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
    );
  }
}
