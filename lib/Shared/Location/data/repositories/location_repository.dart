import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';
import 'package:restaurant_app/utils/services/location_service.dart';

import '../models/address_location.dart';

class LocationRepository {
  late final ApiService _apiService;
  late final DatabaseService _databaseService;
  late final LocationService _locationService;

  LocationRepository({
    required ApiService? apiService,
    required DatabaseService? databaseService,
  }) {
    this._apiService = apiService!;
    this._databaseService = databaseService!;
    this._locationService = locator.get<LocationService>();
  }

  Future<bool> isAddressKnown() async {
    return (await _databaseService.getSavedLocations()).isNotEmpty;
  }

  Future<Position?> getCurrentPosition() async {
    try {
      return await _locationService.determinePosition();
    } catch (e) {
      return null;
    }
  }

  Future<bool> isServiceEnable() async {
    return await _locationService.checkLocationServiceEnabled();
  }

  Future<bool> openLocationSettings() async =>
      await _locationService.openSettings();

  Future saveLocation(AddressLocation location) async => await _databaseService.saveLocation(location);

  Future setCurrentLocation(AddressLocation location) async => await _databaseService.setCurrentLocation(location);
}
