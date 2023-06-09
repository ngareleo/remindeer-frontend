import 'package:flutter/material.dart';

class SlidingTabs extends StatelessWidget {
  final List<Widget> tabs;
  const SlidingTabs({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(tabs.length, (index) => tabs[index]),
      ),
    );
  }
}

class InactiveTab extends StatelessWidget {
  final String label;
  final String? pending;

  const InactiveTab({
    Key? key,
    required this.label,
    this.pending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 120,
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                pending == null
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9EDF5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                          child: Text(
                            pending!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveTab extends StatelessWidget {
  final String label;
  final String? pending;

  const ActiveTab({
    Key? key,
    required this.label,
    this.pending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 120,
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                pending == null
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9EDF5),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                          child: Text(
                            pending!,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
