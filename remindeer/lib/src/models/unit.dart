class Unit {
  final String? uid;
  final String? name;
  final String? unitCode;
  final String? description;
  final String? lecturer;
  final DateTime? created;
  final DateTime? lastModified;

  const Unit(
      {required this.uid,
      this.name,
      this.unitCode,
      this.description,
      this.lecturer,
      this.created,
      this.lastModified});

  factory Unit.fromJson(
      {required String uid, required Map<String, dynamic> json}) {
    final name = json["name"].toString();
    final unitCode = json["unit_code"].toString();
    final description = json["descrption"].toString();
    final lecturer = json["lecturer"].toString();
    final created = json["created"].toString();
    final lastModified = json["last_modified"].toString();
    return Unit(
        uid: uid,
        name: name,
        description: description,
        unitCode: unitCode,
        lecturer: lecturer,
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      uid: {
        "name": name,
        "unit_code": unitCode,
        "description": description,
        "lecturer": lecturer,
        "created": created.toString(),
        "last_modified": lastModified.toString()
      }
    };
  }

  @override
  String toString() {
    return "[Unit] $uid $name";
  }
}
