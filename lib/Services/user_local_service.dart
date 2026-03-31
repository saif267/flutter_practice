import 'package:shared_preferences/shared_preferences.dart';

class UserLocalService {
  static Future<void> saveUser({
    required String name,
    required String username,
    required String phone,
    required String city,
    required String gender,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('username', username);
    await prefs.setString('phone', phone);
    await prefs.setString('city', city);
    await prefs.setString('gender', gender);
  }

  static Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'name': prefs.getString('name') ?? '',
      'username': prefs.getString('username') ?? '',
      'phone': prefs.getString('phone') ?? '',
      'city': prefs.getString('city') ?? '',
      'gender': prefs.getString('gender') ?? 'Male',
    };
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}