import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:remindeer/src/common/utils/helpers/datetime.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/models/user.dart';
import 'package:remindeer/src/screens/pages/timetable/components/no_events_card.dart';

import 'components/add_to_timetable.dart';
import 'components/timetable_event_group.dart';
import 'components/timetable_page_header.dart';

// BASIC ASSUMPTION IS THAT ISAR-READS ARE FAST ENOUGH THAT WE DON'T NEED TO FUTURE BUILD

class TimetableHomePage extends StatefulWidget {
  final int timetableId;
  const TimetableHomePage({Key? key, required this.timetableId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimetableHomePageState();
}

class _TimetableHomePageState extends State<TimetableHomePage> {
  final _pageTitle = "Timetable";
  final List<Event> events = [];
  final User? user = AuthProvider.loggedInUser;
  final timetableRepository = TimetableRepository.instance();
  final eventRepository = EventRepository.instance();
  Timetable? timetable;

  @override
  void initState() {
    super.initState();
    _getResources();
  }

  void _getResources() async {
    var t = await timetableRepository.getTimetable(widget.timetableId);
    setState(() => timetable = t);
    var e = timetable?.events.toList();
    setState(() => events
      ..clear()
      ..addAll(e as Iterable<Event>));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget createTimetableLayout() {
    final group = groupBy(events, (Event e) => e.dayOfWeek);
    return SingleChildScrollView(
        child: Column(
            children: List.generate(
                group.keys.length,
                (index) => Column(
                      children: [
                        TimetableDayGroup(
                          day: group.keys.elementAt(index)!.fullValue,
                          cardInfo: group.values
                              .elementAt(index)
                              .map((e) => CardInfo(
                                    from: convertFromPersistenceFormat(
                                        e.window.from!),
                                    to: convertFromPersistenceFormat(
                                        e.window.to!),
                                    label: e.label,
                                    tag: "Event",
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ))));
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
            children: timetable == null
                ? const [CircularProgressIndicator()]
                : [
                    TimetablePageHeader(
                      email: user?.email ?? "undefined yet",
                      title: timetable?.label ?? "", // what a shame
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            events.isEmpty
                                ? showEventsEmptyCard(context)
                                : createTimetableLayout(),
                            showAddEventButton(),
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

  SizedBox showEventsEmptyCard(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: NoEventsCard(),
        ));
  }

  FilledButton showAddEventButton() {
    return FilledButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => Dialog.fullscreen(
                child: AddToTimetableForm(
                  timetableId: widget.timetableId,
                  onLink: () {
                    _getResources();
                  },
                ),
              )),
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
    );
  }
}
