import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const _storage = FlutterSecureStorage();

  static Future<void> savePassword(String password) async {
    await _storage.write(key: 'password', value: password);
  }

  static Future<String?> getPassword() async {
    return await _storage.read(key: 'password');
  }
}