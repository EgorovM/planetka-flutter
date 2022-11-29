import 'dart:convert';

import 'package:planetka/main/api/base_api.dart';

class ResourceAPI extends BaseAPI {
  Future<Map<String, dynamic>> getResources() async {
    final response = await get('stats/personal/');
    final result = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return result;
  }
}