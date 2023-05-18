class Task {
  final String? uid;
  final String? label;
  final String? venue;
  final String? description;
  final DateTime? from;
  final DateTime? to;
  final bool? repeat;
  final int? repeatTo;
  final DateTime? due;
  final DateTime? created;
  final DateTime? dateLastModified;

  const Task({
    this.uid,
    this.label,
    this.description,
    this.from,
    this.to,
    this.venue,
    this.due,
    this.repeat,
    this.repeatTo,
    this.created,
    this.dateLastModified,
  });
}
