import 'package:dio/dio.dart';

import '../../app/Domains/api_provider/auth_api.dart';
import '../../app/network/dio_client.dart';
//import '../../app/models/auth/login_response.dart';
import '../../app/network/secure_token_storage.dart';
//import 'auth_api.dart';

class AuthRepository {
  late final AuthApi _api;

  AuthRepository() {
    final dio = DioClient.dio;
    _api = AuthApi(dio);
  }

  Future<bool> login(String email, String password) async {
    try {
      final httpResponse = await _api.login({
        "email": email,
        "password": password,
      });

      final response = httpResponse.data;

      print("API RESPONSE: $response");

     // final response = httpResponse.data;
      final token = response.data.token;
      final refreshToken = response.data.refreshToken;

      await SecureTokenStorage.saveTokens(
        token,
        refreshToken,
      );
      return true; // success

    } catch (e) {
      print("ERROR: $e");
      return false; // failure
    }
  }
}