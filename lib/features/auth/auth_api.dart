import 'package:dio/dio.dart';
import '../../app/network/dio_client.dart';

class AuthApi {

  Future<Response> login(String email, String password) {

    return DioClient.dio.post(
      "/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );

  }
}