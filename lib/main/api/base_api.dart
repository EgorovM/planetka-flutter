import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class BaseAPI {
  static const HOST = "http://78.140.243.10:8080/api/";
  static Map<String, String> headers = {};
  final client = http.Client();

  BaseAPI(){
    initHeaders();
  }

  String parseError(Map response) {
    String errorText = "";

    response.forEach((key, value) {
      for(int i = 0; i < value.length; i++) {
        errorText += key + ": " + value[i];
      }
    });

    return errorText;
  }

  Future<void> initHeaders({int deep = 0}) async {
    if(deep > 2) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('auth_token') ?? '';
    final refreshTokenValue = prefs.getString('refresh_token') ?? '';

    if(authToken.isNotEmpty) {
      if(!await isTokenValid()) {
        refreshToken();
        initHeaders(deep: deep + 1);
      }

      headers["Authorization"] = "Bearer " + authToken;
    }
  }

  Future<bool> isTokenValid() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('auth_token') ?? '';

    final response = await post('auth/token/verify/', {"token": accessToken});
    return response.statusCode < 300;
  }

  Future<void> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshTokenValue = prefs.getString('refresh_token') ?? '';

    final response = await post('auth/token/refresh/', {"refresh": refreshTokenValue});
    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    if(response.statusCode > 300) return;

    prefs.setString("auth_token", result["access"]);
  }

  Future<http.Response> get(String uri, {bool useHeaders = true}) async {
    final url = Uri.parse(BaseAPI.HOST + uri);
    final response = await client.get(url, headers: useHeaders ? headers : {});
    return response;
  }

  Future<http.Response> post(String uri, Map<String, dynamic> body, {bool useHeaders = true}) async {
    final url = Uri.parse(BaseAPI.HOST + uri);
    final response = await client.post(url, body: body, headers: useHeaders ? headers : {});
    return response;
  }
}
