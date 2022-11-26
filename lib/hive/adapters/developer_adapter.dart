import 'package:hive/hive.dart';

import '../../models/developer.dart';
import '../hive_adapters.dart';

class DeveloperAdapter extends TypeAdapter<Developer> {
  @override
  Developer read(BinaryReader reader) {
    return Developer.fromJson(reader.read());
  }

  @override
  int get typeId => HiveAdapters.developerAdapter.index;

  @override
  void write(BinaryWriter writer, Developer obj) {
    writer.write(obj.toJson());
  }
}
