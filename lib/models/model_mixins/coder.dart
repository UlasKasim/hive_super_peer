import 'package:hive_super_peer/models/person.dart';

mixin Coder on Person {
  void writingCode() {
    print('writing code');
  }

  @override
  void think() {
    super.think();
    print('thinking about writing code');
  }
}
