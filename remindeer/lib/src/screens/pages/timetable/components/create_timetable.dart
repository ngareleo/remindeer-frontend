import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/timetable/timetable.dart';
import 'package:remindeer/src/features/local_api/repository/timetable_repository.dart';
import 'package:remindeer/src/screens/pages/timetable/timetable_dashboard.dart';

class CreateTimetableForm extends StatefulWidget {
  const CreateTimetableForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateTimetableFormState();
}

class _CreateTimetableFormState extends State<CreateTimetableForm> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _timetableRepository = TimetableRepository.instance();
  DateTime? _endDate;
  Timetable? _timetable;

  void createNewTimetable() async {
    if (!_formKey.currentState!.validate() || _timetable != null) {
      const snackBar = SnackBar(
          content: Text('Something went wrong, please go back and try again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final timetable = await _timetableRepository.createTimetable(
      Timetable(
        label: _labelController.text,
        validUntil: _endDate!,
      ),
    );

    setState(() => _timetable = timetable);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (_timetable != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TimetableHomePage(
            timetableId: _timetable!.id!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: showTimetableLabelTextfield(context),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: showAddEndDateButton(context),
                    ),
                    showCreateButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox showTimetableLabelTextfield(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: _labelController,
        autofocus: true,
        obscureText: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Semester required a label';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Timetable label...',
          hintStyle: TextStyle(
            color: Color(0xFFA8A8A8),
            fontSize: 24,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
        ),
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  TextButton showAddEndDateButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final temp = await showDatePicker(
          context: context,
          initialDate: DateTime.now().add(const Duration(days: 28)),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        setState(() {
          _endDate = temp;
        });
      },
      child: _endDate == null
          ? const Text('Choose timetable expiry date')
          : Text(
              "Timetable valid until ${_endDate?.day}/${_endDate?.month}/${_endDate?.year}"),
    );
  }

  FilledButton showCreateButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        if (_endDate != null) {
          createNewTimetable();
        } else {
          if (_endDate == null) {
            showDueDateNotAddedMessage();
            setState(
                () => _endDate = DateTime.now().add(const Duration(days: 28)));
          }
        }
      },
      child: const Text('Create timetable'),
    );
  }

  void showDueDateNotAddedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info_rounded,
              color: Colors.white,
            ),
          ),
          Flexible(
            child: Text(
              'If a due date is not chosen, the timetable will be valid for 28 days',
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    ));
  }
}
