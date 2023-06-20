import 'package:flutter/material.dart';
import 'package:remindeer/src/common/utils/helpers/fetch_all_resource.dart';
import 'package:remindeer/src/models/resource.dart';

import 'default.dart';

class AllPage extends SemesterPage {
  AllPage() : super(label: 'All');

  @override
  Widget buildBody(BuildContext context) {
    return AppPageBody(setPending: super.setPending);
  }
}

class AppPageBody extends StatefulWidget {
  const AppPageBody({super.key, required this.setPending});

  final Function setPending;

  @override
  State<AppPageBody> createState() => _AppPageBodyState();
}

class _AppPageBodyState extends State<AppPageBody> {
  final resources = <Resource>[];

  @override
  void initState() {
    super.initState();
    widget.setPending(0);
    _fetch();
  }

  Future<void> _fetch() async {
    final res = await fetchAllResources();
    resources.addAll(res);
    widget.setPending(resources.length);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: FutureBuilder<List<Resource>>(
              future: fetchAllResources(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Resource>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: resources.length,
                    itemBuilder: (context, index) {
                      return resources[index].toResourceItem(context);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
