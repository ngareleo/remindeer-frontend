import 'package:flutter/material.dart';

import 'components/my_library_filter_panel.dart';
import '../../common/components/cards/resource_card.dart';

class MyLibraryWidget extends StatefulWidget {
  const MyLibraryWidget({Key? key}) : super(key: key);

  @override
  _MyLibraryWidgetState createState() => _MyLibraryWidgetState();
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
          actions: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'My Library',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
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
                MyLibrarySelectionPillGroupWidget(),
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
