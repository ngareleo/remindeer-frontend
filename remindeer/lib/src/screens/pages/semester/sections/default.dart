import 'package:flutter/material.dart';
import 'package:remindeer/src/common/components/sliding_tabs/active_tab.dart';
import 'package:remindeer/src/common/components/sliding_tabs/inactive_tab.dart';

abstract class SemesterPage {
  final String label;
  bool _active = false;
  int _pending = 0;

  int get pending => _pending;
  bool get active => _active;

  SemesterPage({required this.label});

  void setPending(int value) {
    _pending = value;
  }

  void setActive(bool value) {
    _active = value;
  }

  void setInactive() {
    _active = false;
  }

  Widget buildHeader(BuildContext context, List<SemesterPage> pages) {
    for (final page in pages) {
      if (page != this) {
        page.setInactive();
      }
    }
    return active
        ? ActiveTab(
            label: label,
            pending: _pending.toString(),
            onPressed: () => _active = true,
          )
        : InactiveTab(
            label: label,
            pending: _pending.toString(),
            onPressed: () => _active = true,
          );
  }

  Widget buildBody(BuildContext context);
}
