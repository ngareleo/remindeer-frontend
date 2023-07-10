import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../models/event/event.dart';

class EventRepository {
  static EventRepository? _instance;
  final Isar _isar;

  EventRepository(this._isar) {
    if (_instance != null) {
      throw Exception("EventRepository is already initialized");
    }
    _instance = this;
  }

  factory EventRepository.instance() {
    if (_instance == null) {
      throw Exception("EventRepository is not initialized");
    }
    return _instance!;
  }

  Future<Event> createEvent(Event event) async {
    await _isar.writeTxn(() async {
      return await _isar.events.put(event);
    });
    return (await _isar.events.where().sortByLastModifiedDesc().findFirst())!;
  }

  Future<List<Event>> getAllEvents() async {
    return await _isar.events.where().findAll();
  }

  Stream<void> watch() {
    return _isar.events.watchLazy(fireImmediately: true);
  }
}
