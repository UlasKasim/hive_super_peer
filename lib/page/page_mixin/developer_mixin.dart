import 'package:flutter/material.dart';
import 'package:hive_super_peer/hive/hive_service.dart';
import 'package:hive_super_peer/models/developer.dart';

import '../../dialog/developer_add_dialog.dart';

mixin DeveloperMixin<T extends StatefulWidget> on State<T> {
  List<Developer> developerList = [];

  @override
  void initState() {
    super.initState();
    fetchDeveloperList();
  }

  void fetchDeveloperList() {
    developerList = HiveService<Developer>().getAll();
    developerList.sort((a, b) => a.name.compareTo(b.name));
  }

  void onAddPressed() async {
    await showDeveloperDialog(context);
    fetchDeveloperList();
    setState(() {});
  }

  void onClearAllPressed() async {
    await HiveService<Developer>().clearBox();
    fetchDeveloperList();
    setState(() {});
  }
}
