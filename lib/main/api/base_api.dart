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

  Future<void> initHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('auth_token') ?? '';

    if(authToken.isNotEmpty) {
      headers["Authentication"] = "JWT " + authToken;
    }
  }

  Future<http.Response> get(String uri) async {
    var url = Uri.parse(BaseAPI.HOST + uri);
    var response = await client.post(url, headers: headers);
    return response;
  }

  Future<http.Response> post(String uri, Map<String, String> body) async {
    final url = Uri.parse(BaseAPI.HOST + uri);
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }
}
