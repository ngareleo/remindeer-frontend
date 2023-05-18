import 'package:flutter/material.dart';

import 'components/calendar_chooser.dart';
import 'components/dashboard_group.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: SizedBox(
              width: 70,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CalendarChooserWidget(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const DashboardGroupWidget(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          const DashboardGroupWidget(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Divider(
                                thickness: 1,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          const DashboardGroupWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
