import 'package:flutter/material.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/my_library/my_library.dart';
import 'pages/search/search.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: "Search"),
          NavigationDestination(
              icon: Icon(Icons.bookmark_rounded), label: "My Library")
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) =>
            setState(() => currentPageIndex = index),
      ),
      body: <Widget>[
        const Dashboard(),
        const SearchPage(),
        const MyLibrary()
      ][currentPageIndex],
    );
  }
}
