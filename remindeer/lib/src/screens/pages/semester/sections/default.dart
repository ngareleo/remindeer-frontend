import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/tabs.dart';

abstract class SemesterPage {
  final String label;
  int _pending = 0;

  int get pending => _pending;

  SemesterPage({required this.label});

  void setPending(int value) {
    _pending = value;
  }

  Widget buildHeader(BuildContext context, bool isActive, Function onPressed) {
    return GestureDetector(
        onTap: () => onPressed(),
        child: isActive
            ? ActiveTab(
                label: label,
                pending: _pending.toString(),
              )
            : InactiveTab(
                label: label,
                pending: _pending.toString(),
              ));
  }

  Widget buildBody(BuildContext context);
}
