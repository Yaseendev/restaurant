import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import '../User/data/models/user.dart';

const String appName = 'Hekaya';
const String shopType = 'Syrian Restaurant';

class Urls {
  static const String DOMAIN = 'https://food.almotawer.net';
  static const String BASE_API = DOMAIN + '/api';
  static const String AUTH_PATH = '/auth';
  static const String BRANCH_PATH = '/branches';
  static const String REGISTER_USER = AUTH_PATH + '/register';
  static const String LOGIN_USER = AUTH_PATH + '/login';
  static const String TOKEN_USER = '/user/token';
  static const String LOGOUT_USER = '/user/logout';
  static const String FIND_BRANCH = '$BRANCH_PATH' '/find';
  static const String ALL_BRANCHES = '$BRANCH_PATH' '/all';
  static const String CATEGORIES =
      '$BRANCH_PATH' ''; //TODO: needs to be corrected in backend

  //LocationIQ End-points
  static const String LOCATION_DOMAIN = 'https://eu1.locationiq.com';
  static const String LOCATION_BASE_API = LOCATION_DOMAIN + '/v1';
  static const String LOCATION_AUTOCOMPLETE =
      '$LOCATION_BASE_API/autocomplete.php';
  static const String LOCATION_REVERSE = '$LOCATION_BASE_API/reverse.php';
}

class Images {
  static const String ROOTURI = 'assets/images/';
  static const String CATEGORY_PLACEHOLDER =
      '$ROOTURI' 'placeholder_category.jpg';
}

const String locationKey = 'pk.0b821f869258d4129c196400ab4927f0';

class Boxes {
  static Future<Box<User>> getUserBox() async {
    if (Hive.isBoxOpen('userBox'))
      return Hive.box('userBox');
    else
      return await Hive.openBox('userBox');
  }

  static Future<Box<AddressLocation>> getLocationBox() async {
    if (Hive.isBoxOpen('locationBox'))
      return Hive.box('locationBox');
    else
      return await Hive.openBox('locationBox');
  }
}

enum PickupOption { delivery, takeaway }

enum PaymentMethod { cash, creditCard }
