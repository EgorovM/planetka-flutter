import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetka/authentification/api/auth_api.dart';
import 'package:planetka/main/pages/planet_page.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'authentification/pages/authentification.dart';



class PlanetkaApp extends StatelessWidget {
  PlanetkaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}