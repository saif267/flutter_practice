import 'package:dio/dio.dart';
import '../dio_client.dart';
import '../secure_token_storage.dart';

class AuthInterceptors extends Interceptor {

  ///  ADD TOKEN IN REQUEST
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

  ///  HANDLE ERRORS
  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {

    final path = err.requestOptions.path;

    //  Skip login & refresh APIs
    if (path.contains("/auth/login") ||
        path.contains("/auth/refresh-token")) {
      return handler.next(err);
    }

    //  Only refresh on 401
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await SecureTokenStorage.getRefreshToken();

    //  No refresh token → logout scenario
    if (refreshToken == null) {
      return handler.next(err);
    }

    try {
      //  Refresh token
      final response = await DioClient.dio.post(
        "/auth/refresh-token",
        data: {
          "refreshToken": refreshToken,
        },
      );

      final newAccessToken = response.data["data"]["token"];
      final newRefreshToken = response.data["data"]["refreshToken"];

      await SecureTokenStorage.saveTokens(
        newAccessToken,
        newRefreshToken,
      );

      //  RETRY ORIGINAL REQUEST
      final options = err.requestOptions;

      options.headers["Authorization"] = "Bearer $newAccessToken";

      final retryResponse = await DioClient.dio.fetch(options);

      return handler.resolve(retryResponse);

    } catch (e) {
      return handler.next(err);
    }
  }
}