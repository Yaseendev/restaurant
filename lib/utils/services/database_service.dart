import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Category/data/models/product_category.dart';
import 'package:restaurant_app/Map/data/models/address.dart';
import 'package:restaurant_app/Product/data/models/product.dart';
import 'package:restaurant_app/Product/data/models/product_option.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  DatabaseService({
    required this.secureStorage,
    required this.sharedPreferences,
  }) {
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(NameAdapter())
      ..registerAdapter(GeoLatLngAdapter())
      ..registerAdapter(AddressAdapter())
      ..registerAdapter(ProductCategoryAdapter())
      ..registerAdapter(ProductOptionAdapter())
      ..registerAdapter(ProductAdapter());
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

  Future<void> saveLocation(Address location) async {
    final locationBox = await Boxes.getLocationBox();
    if (!locationBox.values.contains(location)) await locationBox.add(location);
  }

  Future<List<Address>> getSavedLocations() async {
    final locationBox = await Boxes.getLocationBox();
    return locationBox.values.toList();
  }

  Future<bool> setCurrentLocation(Address location) async =>
      await sharedPreferences.setString(
          'currentLocation', jsonEncode(location));

  Address? getCurrentLocation() {
    final String? jsonString = sharedPreferences.getString('currentLocation');
    if (jsonString == null) return null;
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return Address.fromJson(jsonData);
  }
}
