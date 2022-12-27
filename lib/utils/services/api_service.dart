import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app/Shared/Location/data/models/geo_latLng.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/User/data/models/user.dart';
import '../constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>?> registerUser({
    required User user,
    required String password,
  }) async {
    Response response = await _dio.post(
      Urls.REGISTER_USER,
      data: user.toJson(password),
      options: Options(
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
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

  Future<bool> tokenVerify(String token) async {
    Response? response;
    try {
      response = await _dio.post(
        Urls.TOKEN_USER,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 401) return false;
    }
    return response?.data;
  }

  Future<Map<String, dynamic>?> updateUser(
    String token, {
    Name? name,
    String? phone,
    String? gender,
  }) async {
    Response response = await _dio.post(
      Urls.UPDATE_USER,
      data: {
        if (name != null) 'first_name': name.first,
        if (name != null) 'last_name': name.last,
        if (gender != null) 'gender': gender,
        if (phone != null) 'phone': phone,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }

  Future logoutUser(String token) async {
    Response response = await _dio.post(
      Urls.LOGOUT_USER,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
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
    Response response = await _dio.get(
      //TODO: needs to be corrected in backend
      Urls.BRANCH_PATH + '/$branchId/categories',
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> fetchCart(String token) async {
    Response response = await _dio.get(
      Urls.GET_CART,
      options: Options(
        contentType: 'application/json',
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> addToCart(
      String token, int prodId, int quantity) async {
    Response response = await _dio.post(
      Urls.ADD_TO_CART,
      options: Options(
        //contentType: 'application/json',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
      data: {
        'prod_id': prodId,
        'qty': quantity,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> updateCart(
      String token, int prodId, int quantity) async {
    Response response = await _dio.post(
      Urls.UPDATE_CART,
      options: Options(
        contentType: 'application/json',
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        'prod_id': prodId,
        'qty': quantity,
      },
    );
    return response.data;
  }

  Future<List<dynamic>?> getProducts(int branchId) async {
    Response response = await _dio.get(
      Urls.BRANCH_PATH + '/$branchId/products',
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }
}
