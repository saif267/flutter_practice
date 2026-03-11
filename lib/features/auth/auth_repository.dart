import '../../app/network/token_storage.dart';
import 'auth_api.dart';

class AuthRepository {

  final AuthApi _api = AuthApi();

  Future<void> login(String email, String password) async {

    final response = await _api.login(email, password);

    final data = response.data["data"];

    final accessToken = data["token"];
    final refreshToken = data["refreshToken"];

    TokenStorage.saveTokens(accessToken, refreshToken);

  }
}