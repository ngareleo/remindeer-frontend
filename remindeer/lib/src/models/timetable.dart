class Timetable {
  final String? uid;
  final String? label;
  final String? description;
  final DateTime? validUntil;
  final DateTime? created;
  final DateTime? lastModified;

  const Timetable(
      {required this.uid,
      this.label,
      this.description,
      this.validUntil,
      this.created,
      this.lastModified});
}
