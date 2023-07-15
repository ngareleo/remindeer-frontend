import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/forms/create_event_form.dart';
import 'package:remindeer/src/common/components/forms/create_task_form.dart';
import 'package:remindeer/src/screens/pages/semester/new_semester.dart';
import 'package:remindeer/src/screens/pages/timetable/new_timetable.dart';

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
    builder: (BuildContext context, MenuController controller, Widget? widget) {
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
