import 'package:remindeer/src/features/local_api/models/homework/homework.dart';

List<Homework> getHomeworkDueThisWeek(List<Homework> homework, DateTime today) {
  final mondayThatWeek = today.subtract(Duration(days: today.weekday - 1));
  final sundayThatWeek = today.add(Duration(days: 7 - today.weekday));

  return homework
      .where((element) =>
          element.due.isAfter(mondayThatWeek) &&
          element.due.isBefore(sundayThatWeek))
      .toList();
}
