import 'package:flutter/material.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/features/local_api/models/timetable.dart';
import 'package:remindeer/src/models/event.dart';
import 'package:remindeer/src/models/user.dart';
import 'package:remindeer/src/screens/pages/timetable/components/no_events_card.dart';

import 'components/timetable_page_header.dart';

class TimetableHomePage extends StatefulWidget {
  final Timetable timetable;
  const TimetableHomePage({Key? key, required this.timetable})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimetableHomePageState();
}

class _TimetableHomePageState extends State<TimetableHomePage> {
  final _pageTitle = "Timetable";
  final _events = <Event>[];

  final User? user = AuthProvider.loggedInUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(
          _pageTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: const [],
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
              TimetablePageHeader(
                email: user?.email ?? "undefined yet",
                title: widget.timetable.label,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: _events.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: NoEventsCard(),
                              )
                            : const Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                      ),
                      FilledButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.add,
                                size: 16,
                              ),
                            ),
                            Text('Add event'),
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
    );
  }
}
