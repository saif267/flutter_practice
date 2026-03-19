/*//AFTER UPDATING CODE
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
//BEFORE UPDATING CODE
/*
import '../../app/network/dio_client.dart';

class AuthApi {

  Future<dynamic> login(String email, String password) async {
    final response = await DioClient.dio.post(
      "/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
    return response;
  }
}
 */*/