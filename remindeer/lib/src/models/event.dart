class Event {
  final String? uid;
  final String? venue;
  final String? label;
  final String? description;
  final DateTime? from;
  final DateTime? to;
  final bool? repeat;
  final int? repeatTo;
  final DateTime? eventDate;
  final DateTime? created;
  final DateTime? lastModified;

  const Event(
      {required this.uid,
      this.description,
      this.venue,
      this.label,
      this.from,
      this.to,
      this.eventDate,
      this.repeat,
      this.repeatTo,
      this.created,
      this.lastModified});
}
