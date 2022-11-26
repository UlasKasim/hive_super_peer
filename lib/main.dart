import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_super_peer/hive/adapters/developer_adapter.dart';
import 'package:hive_super_peer/page/developer_list_page.dart';

import 'hive/hive_service.dart';
import 'models/developer.dart';

void main() async {
  await Hive.initFlutter();
  await HiveService<Developer>().initializeModel(DeveloperAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Super Peer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeveloperListPage(),
    );
  }
}
