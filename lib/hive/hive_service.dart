import 'package:hive/hive.dart';

class HiveService<T> {
  Box<T> getBox() => Hive.box(T.toString());

  Future<void> setData({required String key, required T data}) async {
    await getBox().put(key, data);
  }

  T? getData(String key) {
    return getBox().get(key);
  }

  Future<void> deleteData(String key) async {
    await getBox().delete(key);
  }

  List<T> getAll() {
    return getBox().values.toList();
  }

  Future<void> initializeModel(TypeAdapter<T> adapter) async {
    Hive.registerAdapter(adapter);
    await openBox();
  }

  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(T.toString());
  }

  Future<void> clearBox() async {
    await getBox().clear();
  }
}
