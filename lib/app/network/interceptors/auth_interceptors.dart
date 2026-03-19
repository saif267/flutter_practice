import 'package:dio/dio.dart';
import '../dio_client.dart';
import '../secure_token_storage.dart';

class AuthInterceptors extends Interceptor {

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await SecureTokenStorage.getAccessToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }
  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      await _refreshToken();
      final response = await _retry(err.requestOptions);
      return handler.resolve(response);
    }
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    final refreshToken = await SecureTokenStorage.getRefreshToken();

    final response = await DioClient.dio.post(
      "/auth/refresh-token",
      data: {
        "refreshToken": refreshToken
      },
    );

    final newAccess = response.data["accessToken"];

    await SecureTokenStorage.saveTokens(
      newAccess,
      refreshToken!,
    );
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final token = await SecureTokenStorage.getAccessToken();
    requestOptions.headers["Authorization"] = "Bearer $token";
    return DioClient.dio.fetch(requestOptions);
  }
}