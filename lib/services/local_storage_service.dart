import 'package:hive/hive.dart';
import 'package:task2/model/user.dart';

class LocalStorageService {
  static const String boxName = 'userBox';

  Future<void> saveUsers(List<User> users) async {
    final box = await Hive.openBox<User>(boxName);
    await box.clear(); 
    await box.addAll(users);
  }

  Future<List<User>> getUsers() async {
    final box = await Hive.openBox<User>(boxName);
    return box.values.toList();
  }
}
