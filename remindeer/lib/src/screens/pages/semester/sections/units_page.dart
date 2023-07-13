import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/unit/unit.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';

import '../components/create_unit_form.dart';
import 'default.dart';

class UnitsPage extends SemesterPage {
  final int id;

  UnitsPage(this.id) : super(label: 'Units');

  @override
  Widget buildBody(BuildContext context) {
    return UnitsPageBody(setPending: super.setPending, id: id);
  }
}

class UnitsPageBody extends StatefulWidget {
  final Function(int) setPending;
  final int id;

  const UnitsPageBody({super.key, required this.setPending, required this.id});

  @override
  State<UnitsPageBody> createState() => _UnitsPageBodyState();
}

class _UnitsPageBodyState extends State<UnitsPageBody> {
  final units = <Unit>[];
  final semesterRepository = SemesterRepository.instance();

  @override
  void initState() {
    widget.setPending(0);
    _fetch();
    super.initState();
  }

  Future<void> _fetch() async {
    final results = await semesterRepository.getAllUnits(widget.id);
    setState(() => units
      ..clear()
      ..addAll(results));
    widget.setPending(units.length);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(
                units.length, (index) => units[index].toResourceItem(context)),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 10,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: FilledButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => CreateUnitForm(
                          semesterId: widget.id,
                          onUnitCreated: (Unit unit) {
                            _fetch();
                          },
                        )),
                child: const Text('Add unit')),
          )
        ],
      ),
    );
  }
}
