import 'package:flutter/material.dart';
import 'package:planetka/main/api/resource_api.dart';

class FoodComponent extends StatefulWidget {
  FoodComponent(this.foodJson, this.consumeCallback);

  Map foodJson = {};
  Function consumeCallback;

  @override
  State<FoodComponent> createState() => _FoodComponentState();
}

class _FoodComponentState extends State<FoodComponent> {
  final resourceApi = ResourceAPI();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Image.network(
          widget.foodJson["icon"] ?? '',
          width: 56,
          height: 56,
        ),
        onTap: () => consume(),
      ),
    );
  }

  void consume() {
    resourceApi.consumeFood(widget.foodJson["id"]);
    widget.consumeCallback.call(widget.foodJson);
  }
}