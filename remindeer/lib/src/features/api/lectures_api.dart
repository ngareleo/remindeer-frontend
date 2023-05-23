import 'package:remindeer/src/models/lecture.dart';
import 'package:remindeer/src/store/sample_lectures.dart';

class LecturesAPI {
  List<Lecture> getLectures() {
    return lectures;
  }

  List<Lecture> getLecturesByDate(DateTime date) {
    return getLectures().where((element) {
      return element.eventDate?.weekday == date.weekday;
    }).toList();
  }
}
