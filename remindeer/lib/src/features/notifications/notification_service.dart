import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static NotificationService? _instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._() {
    _instance = this;
  }

  factory NotificationService.instance() {
    if (_instance == null) {
      throw Exception("NotificationService not built");
    }
    return _instance!;
  }

  factory NotificationService.build() {
    if (_instance != null) {
      throw Exception("NotificationService already built");
    }
    return NotificationService._();
  }

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future selectNotification(String payload) async {}

  Future<void> scheduleLocalNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1234,
      "Lecture coming",
      "A lecture is upcoming",
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 2)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "remindeer",
          "remindeer",
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
