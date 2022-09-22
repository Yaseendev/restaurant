import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/User/data/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'services/api_service.dart';
import 'services/database_service.dart';

final locator = GetIt.instance;

Future locatorsSetup() async {
  final prefs = await SharedPreferences.getInstance();
  final secureStorage = FlutterSecureStorage();
  final database = DatabaseService(secureStorage);
  final ApiService apiService = ApiService(Dio(BaseOptions(
      connectTimeout: 25000,
      receiveTimeout: 25000,
      contentType: 'application/json',
      baseUrl: Urls.BASE_API,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      })));
  locator.registerLazySingleton<SharedPreferences>(() => prefs);
  locator.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  locator.registerLazySingleton<DatabaseService>(() => database);
  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton<ApiService>(() => apiService);
  locator.registerLazySingleton<AccoountRepository>(() => AccoountRepository(
        ApiService: apiService,
        databaseService: database,
      ));
}
