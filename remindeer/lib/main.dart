import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/features/local_api/models/event.dart';
import 'package:remindeer/src/features/local_api/models/semester.dart';
import 'package:remindeer/src/features/local_api/models/task.dart';
import 'package:remindeer/src/features/local_api/models/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/screens/home.dart';
import 'package:path_provider/path_provider.dart';

// This widget is the root of your application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
      [TaskSchema, EventSchema, TimetableSchema, SemesterSchema],
      directory: dir.path);
  EventRepository(isar);
  TaskRepository(isar);
  TimetableRepository(isar);
  SemesterRepository(isar);
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider.instance(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthProvider authProvider, child) {
      return MaterialApp(
        title: 'Remindeer',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: authProvider.isLoggedIn()
            ? const AppHomePage()
            : const AppHomePage(),
      );
    });
  }
}
