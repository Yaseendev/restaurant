import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:restaurant_app/User/data/models/name.dart';
import 'package:restaurant_app/utils/services/api_service.dart';
import 'package:restaurant_app/utils/services/database_service.dart';
import '../models/user.dart';

class AccoountRepository {
  late final ApiService _ApiService;
  late final DatabaseService _databaseService;

  AccoountRepository({
    required ApiService? apiService,
    required DatabaseService? databaseService,
  }) {
    this._ApiService = apiService!;
    this._databaseService = databaseService!;
  }

  Future<User?> loginWithFacebook() async {
    //TODO: move to api class
    final result = await FacebookAuth.i.login(
      permissions: [
        'email',
        'public_profile',
        'user_gender',
      ],
    );
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i
          .getUserData(fields: "name,email,picture.width(200),gender");
      print(requestData);
      return User.fromJson(requestData);
    }
    return null;
  }

  Future<User?> registerUser({
    required Name name,
    required String password,
    required String phoneNum,
    required String email,
    required String gender,
  }) async {
    final User user = User(
      name: name,
      phoneNumber: phoneNum,
      email: email,
      gender: gender,
    );
    final result = await _ApiService.registerUser(
      user: user,
      password: password,
    ).then((value) async {
      user.id = value!['id'];
      await _databaseService.setUser(user);
      await _databaseService.setToken(value['authorisation']['token']);
    });
    return user;
  }

  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _ApiService.loginUser(
      email: email,
      password: password,
    );
    final user = User.fromJson(result?['user']);
    await _databaseService
      ..setUser(user)
      ..setToken(result?['authorisation']['token']);

    return user;
  }

  Future<User?> fetchUser() async {
    final user = await _databaseService.getUser();

    return user;
  }

  Future<bool?> tokenCheck() async {
    final String? token = await _databaseService.getToken();
    if (token == null) return null;
    return await _ApiService.tokenVerify(token);
  }

  Future logoutUser() async {
    final String? token = await _databaseService.getToken();
    _ApiService.logoutUser(token ?? '');
    _databaseService
      ..deleteToken()
      ..deleteUser();
  }
}
