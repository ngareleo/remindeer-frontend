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
}
