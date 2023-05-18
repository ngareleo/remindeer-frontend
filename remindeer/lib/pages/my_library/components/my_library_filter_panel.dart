import 'package:flutter/material.dart';

class MyLibrarySelectionPillGroupWidget extends StatefulWidget {
  const MyLibrarySelectionPillGroupWidget({Key? key}) : super(key: key);

  @override
  _MyLibrarySelectionPillGroupWidgetState createState() =>
      _MyLibrarySelectionPillGroupWidgetState();
}

class _MyLibrarySelectionPillGroupWidgetState
    extends State<MyLibrarySelectionPillGroupWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: ChoiceChip(label: Text("All"), selected: true),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ChoiceChip(label: Text("Semester"), selected: false),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ChoiceChip(label: Text("Assignments"), selected: false),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: ChoiceChip(label: Text("Semesters"), selected: false),
            ),
          ],
        ),
      ),
    );
  }
}
