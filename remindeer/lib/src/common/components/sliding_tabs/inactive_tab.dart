import 'package:flutter/material.dart';

class InactiveTab extends StatelessWidget {
  const InactiveTab(
      {Key? key,
      required this.label,
      required this.pending,
      required this.onPressed})
      : super(key: key);
  final String label;
  final String pending;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EDF5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                    child: Text(
                      pending,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}
