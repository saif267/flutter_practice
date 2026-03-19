import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/auth/login")
  Future<HttpResponse<Map<String, dynamic>>> login(
      @Body() Map<String, dynamic> body,
      );
}