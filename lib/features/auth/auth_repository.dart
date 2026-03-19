import '../../app/Domains/api_provider/auth_api.dart';
import '../../app/network/dio_client.dart';
import '../../app/models/auth/login_response.dart';
import '../../app/network/secure_token_storage.dart';
//import 'auth_api.dart';

class AuthRepository {
  late final AuthApi _api;

  AuthRepository() {
    final dio = DioClient.dio;
    _api = AuthApi(dio);
  }

  Future<void> login(String email, String password) async {
    final httpResponse = await _api.login({
      "email": email,
      "password": password,
    });

    final response = httpResponse.data;

    final loginResponse =
    LoginResponse.fromJson(response["data"]);

    await SecureTokenStorage.saveTokens(
      loginResponse.accessToken,
      loginResponse.refreshToken,
    );
  }
}