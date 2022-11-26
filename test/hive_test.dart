import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_super_peer/hive/adapters/developer_adapter.dart';
import 'package:hive_super_peer/hive/hive_service.dart';
import 'package:hive_super_peer/models/developer.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  String hivePath = './test/hive_test';

  var developerService = HiveService<Developer>();

  setUpAll(() async {
    Hive.init(hivePath);
    await developerService.initializeModel(DeveloperAdapter());
  });

  tearDownAll(() async {
    await Hive.close();
    await Directory(hivePath).delete(recursive: true);
  });

  group('Developer Hive Test', () {
    Developer developer =
        Developer(name: 'Ulaş Kasım', height: 183, weight: 97);
    test('Set and Get Data', () async {
      await developerService.setData(
          key: developer.hashCode.toString(), data: developer);

      Developer? extractedDeveloper =
          developerService.getData(developer.hashCode.toString());
      expect(extractedDeveloper != null, true);
      expect(extractedDeveloper, developer);
    });
    test('Get Data List', () async {
      Developer developer =
          Developer(name: 'Linus Torvalds', height: 177, weight: 75);
      await developerService.setData(
          key: developer.hashCode.toString(), data: developer);

      List<Developer> developerList = developerService.getAll();
      expect(developerList.isNotEmpty, true);
      expect(developerList.length, 2);
    });
    test('Clear List', () async {
      await developerService.clearBox();
      List<Developer> developerList = developerService.getAll();
      expect(developerList.isEmpty, true);
    });
  });
}
