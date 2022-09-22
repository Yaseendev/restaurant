import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import '../constants.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  DatabaseService(this.secureStorage) {
    Hive
    ..registerAdapter(UserAdapter())
    ..registerAdapter(NameAdapter());
  }

  Future<void> setToken(String token) async => await secureStorage.write(
        key: 'token',
        value: token,
      );

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    return await secureStorage.delete(key: 'token');
  }

  Future<void> setUser(User user) async {
    final userBox = await Boxes.getUserBox();
    await userBox.put('currentUser', user);
  }

  Future<User?> getUser() async {
    final userBox = await Boxes.getUserBox();
    return userBox.get('currentUser');
  }

  Future deleteUser() async {
    final userBox = await Boxes.getUserBox();
    return await userBox.delete('currentUser');
  }
}
