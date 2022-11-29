import 'dart:convert';

import 'package:planetka/main/api/base_api.dart';

class ResourceAPI extends BaseAPI {
  Future<Map<String, dynamic>> getResources() async {
    final response = await get('stats/personal/');
    final result = jsonDecode(utf8.decode(response.bodyBytes));
    return result;
  }

  Future<List<Map>> getFoods() async {
    final response = await get('products/list/');
    final result = List<Map>.from(jsonDecode(utf8.decode(response.bodyBytes)));
    print(result);
    return result;
  }

  Future<void> consumeFood(String productId, {int portionSize = 1}) async {
    final response = await post(
        'products/consumption/',
        {
          "product_id": productId,
          "portion_size": portionSize.toString(),
        }
    );
  }
}