import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/create_event_form.dart';
import 'package:remindeer/src/common/components/forms/create_task_form.dart';
import 'package:remindeer/src/screens/pages/dashboard/sections/todays_lectures.dart';
import 'package:remindeer/src/screens/pages/semester/new_semester.dart';
import 'package:remindeer/src/screens/pages/timetable/new_timetable.dart';
import 'components/calendar_chooser.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  var viewDate = DateTime.now();
  void onChangeDate(DateTime focus) {
    setState(() => viewDate = focus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: SizedBox(
              width: 70,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 8,
        child: showMenuAnchor(context),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CalendarChooserWidget(
                          onDateChange: onChangeDate,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TodaysLecturesSection(date: viewDate),
                        ],
                      ),
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

  MenuAnchor showMenuAnchor(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(0, 10),
      menuChildren: [
        MenuItemButton(
            child: const Text('Create timetable'),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewTimetablePage(),
                  ),
                )),
        MenuItemButton(
            child: const Text('Create semester'),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewSemesterPage(),
                  ),
                )),
        MenuItemButton(
          child: const Text('Create event'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Dialog.fullscreen(
                    child: CreateEventForm(),
                  );
                });
          },
        ),
        MenuItemButton(
          child: const Text('Create task'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Dialog.fullscreen(
                    child: CreateTaskForm(),
                  );
                });
          },
        )
      ],
      builder:
          (BuildContext context, MenuController controller, Widget? widget) {
        return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ));
      },
    );
  }
}
