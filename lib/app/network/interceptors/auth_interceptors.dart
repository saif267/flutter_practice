import 'package:dio/dio.dart';
import '../token_storage.dart';
import '../dio_client.dart';

class AuthInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    final token = TokenStorage.accessToken;
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401) {
      await _refreshToken();
      final response = await _retry(err.requestOptions);
      return handler.resolve(response);
    }
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    final _ = TokenStorage.refreshToken;
    final response = await DioClient.dio.post(
      "/auth/refresh-token",
      data: {
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNtanYxZW8wZjAwMDZqcjA0bTdpdzF2dTUiLCJlbWFpbCI6Imppa29qOTIyMTVAZ2F2cm9tLmNvbSIsImlhdCI6MTc2NzI0Nzk4MCwiZXhwIjoxNzY5ODM5OTgwfQ.L35DPcfZhcQ7tfHYcHvm7gw6tl5BcOTPL8zsjGbqaCg"
      },
    );
    final newAccess =  response.data["accessToken"];
    TokenStorage.accessToken = newAccess;
  }
  Future<Response> _retry(RequestOptions requestOptions) async {
    return DioClient.dio.fetch(requestOptions);
  }
}