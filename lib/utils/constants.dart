import 'package:hive_flutter/hive_flutter.dart';

import '../User/data/models/user.dart';

class Urls {
  static const String DOMAIN = 'https://food.almotawer.net';
  static const String BASE_API = DOMAIN + '/api';
  static const String AUTH_PATH = '/auth';
  static const String REGISTER_USER = AUTH_PATH + '/register';
  static const String LOGIN_USER = AUTH_PATH + '/login';
  static const String TOKEN_USER = '/user/token';
  static const String LOGOUT_USER = '/user/logout';
}

class Boxes {

  static Future<Box<User>> getUserBox() async {
    if (Hive.isBoxOpen('userBox'))
      return Hive.box('userBox');
    else
      return await Hive.openBox('userBox');
  }

}

enum PickupOption {delivery, takeaway}
enum PaymentMethod {cash, creditCard}