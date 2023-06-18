import 'package:flutter/material.dart';

abstract class Resource extends ChangeNotifier {
  final String uid;
  final DateTime created;
  final DateTime lastModified;

  Resource(
      {required this.uid, required this.created, required this.lastModified});

  Widget toResourceItem(BuildContext context);
}
