import 'package:flutter/material.dart';
import 'package:remindeer/src/features/authentication/auth.dart';
import 'package:remindeer/src/screens/pages/dashboard/components/floating_button_menu.dart';
import 'package:remindeer/src/screens/pages/dashboard/sections/entry.dart';
import 'package:remindeer/src/screens/pages/login/login.dart';
import 'components/calendar_chooser.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final _authProvider = AuthProvider.instance();

  var viewDate = DateTime.now();
  void onChangeDate(DateTime focus) {
    setState(() => viewDate = focus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 70,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  IconButton(
                    onPressed: () {
                      showLogoutDialog();
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 8,
        child: showMenuAnchor(context),
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
                showCalendarChooserSection(context),
                showMainDashArea(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded showMainDashArea(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TodaysLecturesSection(date: viewDate),
            ],
          ),
        ),
      ),
    );
  }

  Padding showCalendarChooserSection(BuildContext context) {
    return Padding(
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CalendarChooserWidget(
              onDateChange: onChangeDate,
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?'),
                Text('Sad to see you go'),
              ],
            ),
          ),
          actions: <Widget>[
            FilledButton.tonal(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                _authProvider.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out. Kwaheri!'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
