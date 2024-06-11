import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/user.dart';

class UserPreferences {
  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
  }

  static Future<void> saveUser(UserData user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = json.encode({
      'id': user.id,
      'socialId': user.socialId,
      'name': user.name,
      'email': user.email,
      'image': user.image,
      'phone': user.phone,
      'emailVerifiedAt': user.emailVerifiedAt?.toIso8601String(), // Ubah DateTime menjadi string ISO8601
      'createdAt': user.createdAt.toIso8601String(), // Ubah DateTime menjadi string ISO8601
      'updatedAt': user.updatedAt.toIso8601String(), // Ubah DateTime menjadi string ISO8601
      'role': user.role,
    });
    await prefs.setString('user', userJson);
  }


  static Future<UserData?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      return UserData.fromJson(json.decode(userJson) as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}
