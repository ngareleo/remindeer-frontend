import 'package:remindeer/src/models/unit.dart';

class UnitsAPI {
  List<Unit> getUnits() {
    return [
      Unit(
          uid: "23423",
          name: "Simulation and Modelling",
          unitCode: "sco302",
          description: "",
          lecturer: "Mr Muriuki",
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Unit(
          uid: "3343",
          name: "Automata Theory",
          unitCode: "sco306",
          description: "",
          lecturer: "Mrs Viola Davis",
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Unit(
          uid: "9345345",
          name: "Calculus II",
          unitCode: "sma200",
          description: "",
          lecturer: "Dr. Kiambi",
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Unit(
          uid: "97765",
          name: "Entreprenurship",
          unitCode: "sco310",
          description: "",
          lecturer: "Dr Munyao",
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20))),
      Unit(
          uid: "2342300",
          name: "Graphics",
          unitCode: "sc0312",
          description: "",
          lecturer: "Mr Wanjau",
          created: DateTime.now(),
          lastModified: DateTime.now().subtract(const Duration(days: 20)))
    ];
  }
}
