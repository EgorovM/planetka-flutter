import 'dart:convert';

import 'package:planetka/main/api/base_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI extends BaseAPI {
  Future<String> auth(String username, String password) async {
    final response = await post(
      "auth/login/",
      {
        "username": username,
        "password": password,
      }
    );

    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (response.statusCode >= 300) {
      return parseError(result);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", result["access_token"]);
    prefs.setString("refresh_token", result["refresh_token"]);

    return '';
  }

  Future<String> register(String email, String username, String name, String password1, String password2) async {
    final response = await post(
        "auth/register/",
        {
          "email": email,
          "username": username,
          "name": name,
          "password1": password1,
          "password2": password2,
        }
    );

    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (response.statusCode >= 300) {
      return parseError(result);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", result["access_token"]);
    prefs.setString("refresh_token", result["refresh_token"]);

    return '';
  }
}