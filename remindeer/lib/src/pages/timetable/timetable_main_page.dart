import 'package:flutter/material.dart';

import 'components/timetable_event_group.dart';
import 'components/timetable_page_header.dart';

class TimetableHomePageWidget extends StatefulWidget {
  const TimetableHomePageWidget({Key? key}) : super(key: key);

  @override
  _TimetableHomePageWidgetState createState() =>
      _TimetableHomePageWidgetState();
}

class _TimetableHomePageWidgetState extends State<TimetableHomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'Timetable',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1,
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const TimetablePageHeaderWidget(),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: TimetableDayGroupWidget(
                                  day: 'Wednesday',
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: TimetableDayGroupWidget(
                                  day: 'Wednesday',
                                ),
                              ),
                            ],
                          ),
                        ),
                        FilledButton(
                          onPressed: () {},
                          child: const Column(
                            children: [
                              Text('Add event'),
                              Icon(
                                Icons.add,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
