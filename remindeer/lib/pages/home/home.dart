import 'package:flutter/material.dart';
import 'package:remindeer/pages/my_library/my_library.dart';
import 'package:remindeer/pages/search/search.dart';
import '../dashboard/dashboard.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  var currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 8,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 24,
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_rounded), label: "Home"),
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
      ),
    );
  }
}
