import 'package:flutter/material.dart';
import 'package:remindeer/src/features/api/units_api.dart';
import 'package:remindeer/src/models/unit.dart';

class LinkToUnitWidget extends StatefulWidget {
  const LinkToUnitWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _LinkToUnitWidget();
}

class _LinkToUnitWidget extends State<LinkToUnitWidget> {
  final api = UnitsAPI();
  final units = <Unit>[];
  String? selectedUnit;

  @override
  void initState() {
    super.initState();
    _getUnits();
  }

  Future<void> _getUnits() async {
    units.clear();
    units.addAll(await api.getAllUnits());
  }

  @override
  Widget build(BuildContext context) {
    return selectedUnit != null
        ? ActionChip(
            onPressed: () {
              setState(() {
                selectedUnit = null;
                widget.controller.text = "";
              });
            },
            label: Text(selectedUnit ?? ""),
            avatar: const Icon(Icons.close_rounded))
        : Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 5),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: const Text('Link to unit'),
                        children: List.generate(
                            units.length,
                            (index) => SimpleDialogOption(
                                  onPressed: () {
                                    setState(
                                        () => selectedUnit = units[index].name);
                                    widget.controller.text = units[index].uid;
                                    Navigator.pop(context);
                                  },
                                  child: Text(units[index].name),
                                )),
                      );
                    });
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.link_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                Text(
                  'Link to unit',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
          );
  }
}
