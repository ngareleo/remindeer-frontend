import 'package:flutter/material.dart';

abstract class Resource extends ChangeNotifier {
  Widget toResourceItem(BuildContext context);
}
