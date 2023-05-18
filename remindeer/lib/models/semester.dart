class Semester {
  final String? uid;
  final String? name;
  final String? descrption;
  final DateTime? from;
  final DateTime? to;
  final DateTime? created;
  final DateTime? lastModified;

  const Semester(
      {required this.uid,
      this.name,
      this.descrption,
      this.from,
      this.to,
      this.created,
      this.lastModified});
}
