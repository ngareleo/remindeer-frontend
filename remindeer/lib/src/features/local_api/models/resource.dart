import 'package:flutter/material.dart';

abstract class Resource<T> extends ChangeNotifier {
  Widget toResourceItem(BuildContext context);
  dynamic toJson();
}
