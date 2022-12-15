import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import '../constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>?> registerUser({
    required User user,
    required String password,
  }) async {
    Response response =
        await _dio.post(Urls.REGISTER_USER, data: user.toJson(password));
    return response.data;
  }

  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    Response response = await _dio.post(
      Urls.LOGIN_USER,
      data: {
        'email': email,
        'password': password,
      },
    );
    return response.data;
  }

  Future<dynamic> tokenVerify(String token) async {
    Response response = await _dio.post(
      Urls.TOKEN_USER,
      data: {
        'token': token,
      },
    );
    return response.data;
  }

  Future logoutUser(String token) async {
    Response response = await _dio.post(
      Urls.LOGOUT_USER,
      data: {
        'token': token,
      },
    );
    return response.data;
  }

  Future<dynamic> searchLocation(String text) async {
    Response response = await Dio().get(
      Urls.LOCATION_AUTOCOMPLETE,
      options: Options(
        contentType: 'application/json',
      ),
      queryParameters: {
        'q': text,
        'countrycodes': 'eg',
        'key': locationKey,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> reverseGeoLocation(GeoLatLng location) async {
    Response response = await Dio().get(
      Urls.LOCATION_REVERSE,
      queryParameters: {
        'lat': location.latitude,
        'lon': location.longitude,
        'countrycodes': 'eg',
        'key': locationKey,
        'format': 'json',
      },
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> getBranchData(GeoLatLng location) async {
    Response response = await _dio.get(
      Urls.FIND_BRANCH,
      queryParameters: {
        'lat': location.latitude,
        'long': location.longitude,
      },
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }

  Future<List<dynamic>?> getBranchAddresses() async {
    Response response = await _dio.get(
      Urls.ALL_BRANCHES,
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }

  Future<List<dynamic>?> fetchCategories(int branchId) async {
    Response response = await _dio.get(//TODO: needs to be corrected in backend
      Urls.BRANCH_PATH + '/$branchId/categories', 
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }
}
