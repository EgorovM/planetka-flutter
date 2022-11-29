import 'dart:convert';

import 'package:planetka/main/api/base_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI extends BaseAPI {
  Future<void> setUser() async {
    final prefs = await SharedPreferences.getInstance();
    final auth_token = prefs.getString("auth_token") ?? '';

    if(auth_token.isEmpty) {
      return;
    }

    final response = await get("auth/user/");
    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    print(result);

    prefs.setInt("user_id", result["id"]);
    prefs.setString("username", result["username"]);
    prefs.setString("email", result["email"]);
    prefs.setString("name", result["name"]);
    prefs.setString("avatar", result["avatar"] ?? '');
  }

  Future<String> auth(String username, String password) async {
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(username);

    Map<String, String> body = {};
    body["password"] = password;
    body[emailValid ? "email" : "username"] = username;

    final response = await post("auth/login/", body, useHeaders: false);
    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (response.statusCode >= 300) {
      return parseError(result);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", result["access_token"]);
    prefs.setString("refresh_token", result["refresh_token"]);

    await setUser();

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
        },
        useHeaders: false
    );

    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    if (response.statusCode >= 300) {
      return parseError(result);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("auth_token", result["access_token"]);
    prefs.setString("refresh_token", result["refresh_token"]);

    await setUser();

    return '';
  }
}