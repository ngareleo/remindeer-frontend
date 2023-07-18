import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

class SharingProvider {
  static SharingProvider? _instance;
  late Dio? _dio;

  SharingProvider._() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://localhost:3000/api/share",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Accept": "application/json",
      },
    ));
    _instance = this;
  }

  factory SharingProvider.build() {
    if (_instance != null) {
      throw Exception("SharingProvider already built");
    }
    return SharingProvider._();
  }

  factory SharingProvider.instance() {
    if (_instance == null) {
      throw Exception("SharingProvider not built");
    }
    return _instance!;
  }

  Future<void> shareSemester(
      int id, SemesterRepository semesterRepository) async {
    var semester = await semesterRepository.getSemester(id);
    var data = await Future.wait([
      semesterRepository.getAllTimetables(id),
      semesterRepository.getAllEvents(id),
      semesterRepository.getAllHomeworks(id),
      semesterRepository.getAllTasks(id),
      semesterRepository.getAllUnits(id),
    ]);

    final payload = {
      "timetables": data[0].map((e) => e.toJson()).toList(),
      "events": data[1].map((e) => e.toJson()).toList(),
      "homeworks": data[2].map((e) => e.toJson()).toList(),
      "tasks": data[3].map((e) => e.toJson()).toList(),
      "units": data[4].map((e) => e.toJson()).toList(),
      "semester": semester?.toJson(),
    };

    final response = await _dio?.post("/semester", data: payload);
    debugPrint(response?.data.toString());
  }
}
