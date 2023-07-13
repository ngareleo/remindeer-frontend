import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/features/local_api/repository/unit_repository.dart';

class LinkToUnitWidget extends StatefulWidget {
  final void Function(Unit? unit) onLink;
  final int? semesterId;
  const LinkToUnitWidget({super.key, required this.onLink, this.semesterId});

  @override
  State<StatefulWidget> createState() => _LinkToUnitWidget();
}

class _LinkToUnitWidget extends State<LinkToUnitWidget> {
  final units = <Unit>[];
  String? selectedUnit;

  final unitsRepository = UnitRepository.instance();
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    super.initState();
    _getUnits();
  }

  Future<void> _getUnits() async {
    if (widget.semesterId != null) {
      final results = await semesterRepository.getAllUnits(widget.semesterId!);
      setState(() => units
        ..clear()
        ..addAll(results));
      return;
    }
    final results = await unitsRepository.getAllUnits();
    setState(() => units
      ..clear()
      ..addAll(results));
  }

  @override
  Widget build(BuildContext context) {
    return selectedUnit != null
        ? ActionChip(
            onPressed: () => setState(() {
                  selectedUnit = null;
                  widget.onLink(null);
                }),
            label: Text(selectedUnit ?? ""),
            avatar: const Icon(Icons.close_rounded))
        : showUnitChooser(context);
  }

  Padding showUnitChooser(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 5),
      child: TextButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: const Text('Link to unit'),
                children: List.generate(
                    units.length,
                    (index) => SimpleDialogOption(
                          onPressed: () {
                            setState(() => selectedUnit = units[index].name);
                            widget.onLink(units[index]);
                            Navigator.pop(context);
                          },
                          child: Text(units[index].name),
                        )),
              );
            }),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.link_rounded,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Link to unit',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ]),
      ),
    );
  }
}
