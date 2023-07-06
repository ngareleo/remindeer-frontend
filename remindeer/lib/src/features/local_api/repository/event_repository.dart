import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/event.dart';
import 'package:remindeer/src/models/event.dart' as app_event_model;

class EventRepository {
  static EventRepository? _instance;
  final Isar _isar;

  EventRepository(this._isar) {
    _instance = this;
  }

  factory EventRepository.instance() => _instance!;

  Future<List<Event>> getAllEvents() async {
    final all = await _isar.events.where().findAll();
    return all;
  }

  Future<void> addEvent(app_event_model.Event event) async {
    final event_ = Event.fromLocalEventModel(event);
    await _isar.writeTxn((isar) async {
      await isar.events.put(event_);
    } as Future Function());
  }
}
