import 'package:flutter/material.dart';

class LinkToTimetableForm extends StatefulWidget {
  const LinkToTimetableForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinkToTimetableFormState();
}

class _LinkToTimetableFormState extends State<LinkToTimetableForm> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: DropdownButtonFormField<String>(
                    items: [],
                    onChanged: (val) => setState(() => {}),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [Icon(Icons.plus_one_rounded), Text('From')],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xFF404040),
                    size: 24,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                        children: [Icon(Icons.plus_one_rounded), Text('To')]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: OutlinedButton(
                onPressed: () {},
                child: const Row(children: [
                  Icon(Icons.plus_one_rounded),
                  Text('Pick day of week')
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
