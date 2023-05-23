import 'package:remindeer/src/models/unit.dart';
import 'package:remindeer/src/store/sample_units.dart';

class UnitsAPI {
  List<Unit> getUnits() {
    return units;
  }

  List<Unit> getWhere(String params) {
    return [];
  }
}
