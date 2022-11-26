import 'package:flutter_test/flutter_test.dart';
import 'package:hive_super_peer/models/developer.dart';

void main() {
  group('Mixin test', () {
    Developer developer =
        Developer(name: 'Ulaş Kasım', height: 183, weight: 97);
    developer.think();
    developer.writingCode();
  });
}
