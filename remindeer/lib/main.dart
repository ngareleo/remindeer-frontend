import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';
import 'package:remindeer/src/features/notifications/notification_service.dart';
import 'package:remindeer/src/features/remote_api/sharing.dart';
import 'package:remindeer/src/features/local_api/models/homework/homework.dart';
import 'package:remindeer/src/features/local_api/models/lecture/lecture.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/models/task/task.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/event_repository.dart';
import 'package:remindeer/src/features/local_api/repository/homework_repository.dart';
import 'package:remindeer/src/features/local_api/repository/lecture_repository.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/task_repository.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';
import 'package:remindeer/src/screens/pages/login/login.dart';
import 'package:remindeer/src/screens/home.dart';

// This widget is the root of your application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    TaskSchema,
    TimetableSchema,
    SemesterSchema,
    UnitSchema,
    LectureSchema,
    HomeworkSchema,
    EventSchema
  ], directory: dir.path);
  EventRepository(isar);
  TaskRepository(isar);
  TimetableRepository(isar);
  SemesterRepository(isar);
  UnitRepository(isar);
  HomeworkRepository(isar);
  LectureRepository(isar);
  final authProviderInstance = AuthProvider.instance();

  SharingProvider.build();

  await NotificationService.build().init();

  runApp(ChangeNotifierProvider(
      create: (context) => authProviderInstance, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final NotificationService notificationService =
      NotificationService.instance();

  @override
  void initState() {
    super.initState();
    notificationService.scheduleLocalNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthProvider authProvider, child) {
      return MaterialApp(
        title: 'Remindeer',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home:
            authProvider.isLoggedIn() ? const AppHomePage() : const LoginPage(),
      );
    });
  }
}
