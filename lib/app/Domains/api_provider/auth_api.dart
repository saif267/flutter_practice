import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/auth/login_response.dart';
part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/auth/login")
  Future<HttpResponse<LoginResponse>> login(
      @Body() Map<String, dynamic> body,
      );
}