import 'package:remindeer/src/models/event.dart';

class EventsAPI {
  List<Event> getEvents() {
    return [
      Event(
        uid: "454354",
        label: "Rice and Veggies",
      )
    ];
  }
}
