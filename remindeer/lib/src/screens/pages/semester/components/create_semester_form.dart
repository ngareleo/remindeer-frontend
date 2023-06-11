import 'package:flutter/material.dart';
import 'package:remindeer/src/models/semester.dart';
import 'package:remindeer/src/screens/pages/semester/semester_dashboard.dart';

class CreateSemesterForm extends StatefulWidget {
  const CreateSemesterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateSemesterFormState();
}

class _CreateSemesterFormState extends State<CreateSemesterForm> {
  final _formKey = GlobalKey<FormState>();
  final _semesterNameController = TextEditingController();
  DateTime? _semesterEndDate;

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
                child: showSemesterLabelTextfield(context),
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
                    showCreateSemesterButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox showSemesterLabelTextfield(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: _semesterNameController,
        autofocus: true,
        obscureText: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Semester required a label';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: 'Semester Label...',
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
          _semesterEndDate = temp;
        });
      },
      child: _semesterEndDate == null
          ? const Text('Choose semester end date')
          : Text(
              "Semester valid until ${_semesterEndDate?.day}/${_semesterEndDate?.month}/${_semesterEndDate?.year}"),
    );
  }

  FilledButton showCreateSemesterButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        if (_formKey.currentState!.validate() && _semesterEndDate != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Creating new semester')),
          );
          final newSemester = Semester(
            name: _semesterNameController.text,
            from: DateTime.now(),
            to: _semesterEndDate!,
            created: DateTime.now(),
            lastModified: DateTime.now(),
            uid: '00-s-15',
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SemesterDashboardPage(semester: newSemester)));
        } else {
          if (_semesterEndDate == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Flexible(
                      child: Text(
                        'If a semester end date is not chosen, the semester will be valid for 28 days',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ));
            setState(() => _semesterEndDate =
                DateTime.now().add(const Duration(days: 28)));
          }
        }
      },
      child: const Text('Create semester'),
    );
  }
}
