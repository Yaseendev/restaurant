import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Branch/data/Models/branch.dart';
import 'package:restaurant_app/Shared/Location/data/models/address_location.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';

class HomeRepository {
  late final ApiService _apiService;
  late final DatabaseService _databaseService;

  HomeRepository() {
    this._apiService = locator.get<ApiService>();
    this._databaseService = locator.get<DatabaseService>();
  }
  
}