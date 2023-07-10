import 'package:flutter/material.dart';
import 'package:remindeer/src/features/local_api/models/semester/semester.dart';
import 'package:remindeer/src/features/local_api/repository/semester_repository.dart';
import 'package:remindeer/src/screens/pages/semester/semester_dashboard.dart';

class CreateSemesterForm extends StatefulWidget {
  const CreateSemesterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateSemesterFormState();
}

class _CreateSemesterFormState extends State<CreateSemesterForm> {
  final _formKey = GlobalKey<FormState>();
  final _semesterNameController = TextEditingController();
  final _semesterRepository = SemesterRepository.instance();
  DateTime? _semesterEndDate;
  Semester? _semester;

  void createNewSemester() async {
    if (!_formKey.currentState!.validate()) {
      const snackBar = SnackBar(
          content: Text('Something went wrong, please go back and try again.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final semester = await _semesterRepository.createSemester(
      Semester.fromNewSemesterForm(
        label: _semesterNameController.text,
        to: _semesterEndDate!,
      ),
    );

    setState(() => _semester = semester);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (_semester != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SemesterDashboardPage(
              semesterId: _semester!.id!, // what a shame
            ),
          ),
          (route) => false);
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
        if (_semesterEndDate != null) {
          createNewSemester();
        } else {
          showMissingEndDateMessage();
          setState(() =>
              _semesterEndDate = DateTime.now().add(const Duration(days: 28)));
        }
      },
      child: const Text('Create semester'),
    );
  }

  void showMissingEndDateMessage() {
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
              'If a semester end date is not chosen, the semester will be valid for 28 days',
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
