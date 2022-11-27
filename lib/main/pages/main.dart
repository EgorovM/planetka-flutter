import 'package:flutter/material.dart';
import 'package:planetka/common/components/header.dart';
import 'package:planetka/main/components/indicators.dart';
import 'package:planetka/main/components/planetka.dart';
import 'package:planetka/microsoft_ui/forms/text_input.dart';
import 'package:planetka/microsoft_ui/texts/text_headline.dart';
import 'package:planetka/registration/pages/register.dart';


class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Sample Project"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IndicatorsComponent(),
              PlanetkaComponent(),
            ],
          ),
        )
    );
  }
}
