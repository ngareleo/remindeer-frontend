import 'package:flutter/material.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/my_library/my_library.dart';
import 'pages/search/search.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
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
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: <Widget>[
        const Dashboard(),
        const SearchWidget(),
        const MyLibraryWidget()
      ][currentPageIndex],
    );
  }
}
