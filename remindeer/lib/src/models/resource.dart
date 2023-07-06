import 'package:flutter/material.dart';

abstract class Resource extends ChangeNotifier {
  final String uid;
  final DateTime? created;
  DateTime? lastModified;

  Resource({required this.uid, this.created, this.lastModified});

  Widget toResourceItem(BuildContext context);
}
