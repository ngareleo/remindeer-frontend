abstract class Resource {
  final String uid;
  final DateTime created;
  final DateTime lastModified;

  const Resource(
      {required this.uid, required this.created, required this.lastModified});
}
