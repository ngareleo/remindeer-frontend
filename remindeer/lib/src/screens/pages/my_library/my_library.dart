import 'package:flutter/material.dart';

import 'components/my_library_filter_panel.dart';
import '../../../common/components/cards/resource_card.dart';

class MyLibraryWidget extends StatefulWidget {
  const MyLibraryWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyLibraryWidgetState();
}

class _MyLibraryWidgetState extends State<MyLibraryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
          actions: const [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 10),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
          title: const Text(
            'My Library',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                MyLibrarySelectionPillGroup(),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ResourceCardWidget(),
                        ResourceCardWidget(),
                        ResourceCardWidget(),
                      ],
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
