import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:remindeer/src/features/local_api/models/event/event.dart';

import '../models/timetable/timetable.dart';

class TimetableRepository {
  static TimetableRepository? _instance;
  final Isar _isar;

  TimetableRepository(this._isar) {
    if (_instance != null) {
      throw Exception("TimetableRepository is already initialized");
    }
    _instance = this;
  }

  factory TimetableRepository.instance() {
    if (_instance == null) {
      throw Exception("TimetableRepository is not initialized");
    }
    return _instance!;
  }

  Future<Timetable?> getTimetable(int id) async {
    return await _isar.timetables.get(id);
  }

  Future<Timetable> createTimetable(Timetable timetable) async {
    // TODO: add error handling
    // TODO: In the case an insert fails, the return value is null

    await _isar.writeTxn(() async {
      return await _isar.timetables.put(timetable);
    });
    return (await _isar.timetables
        .where()
        .sortByLastModifiedDesc()
        .findFirst())!;
  }

  Future<List<Timetable>> getAllTimetables() async {
    return await _isar.timetables.where().sortByLastModifiedDesc().findAll();
  }

  Future<void> addEventToTimetable(int timetableId, Event event) async {
    final timetable = await getTimetable(timetableId);
    timetable?.events.add(event);
    await _isar.writeTxn(() async {
      await timetable?.events.save();
    });
  }

  Future<List<Event>> getAllEvents(int id) async {
    final timetable = await _isar.timetables.get(id);
    timetable?.events.load();
    return timetable?.events.toList() ?? [];
  }

  void watch(Function callback) {
    final stream = _isar.timetables.watchLazy(fireImmediately: true);
    stream.listen((event) async {
      debugPrint("There we go");
      await callback();
    });
  }
}
