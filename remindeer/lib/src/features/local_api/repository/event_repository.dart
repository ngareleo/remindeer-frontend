import 'package:isar/isar.dart';

import '../models/event.dart';

class EventRepository {
  static final EventRepository _instance = EventRepository._internal();
  final Isar _isar;

  EventRepository(this._isar);

  factory EventRepository.instance() => _instance;
  factory EventRepository._internal() => _instance;

  Future<void> addEvent(Event event) async {
    await _isar.writeTxn(() async {
      return await _isar.events.put(event);
    });
  }
}
