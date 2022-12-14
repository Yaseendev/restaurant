import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/utils/locator.dart';
import 'package:restaurant_app/utils/services/api_service.dart';

import '../models/address.dart';
import '../models/location_result.dart';

class MapRepository {
late final ApiService _networkApiService;
 MapRepository() {
    this._networkApiService = locator.get<ApiService>();
  }
  Future<List<LocationResult>> getLoactionSearchResult(String text) async {
    //if (text.isEmpty) return null;
    List<dynamic> result = await _networkApiService.searchLocation(text);
    return result.map((e) => LocationResult.fromJson(e)).toList();
  }

  Future<Address?> getReversedGeoCode(LatLng position) async {
    //if (text.isEmpty) return null;
    final result = await _networkApiService.reverseGeoLocation(position);
    return result != null ? Address.fromJson(result['address']) : null;
  }
}