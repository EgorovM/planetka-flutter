import 'package:flutter/material.dart';
import 'package:planetka/main/components/sample_button.dart';
import 'package:planetka/main/pages/ratings_page.dart';

import '../pages/planet_page.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: SampleButton(
                destination: const RatingsPage(),
                imgPath: selectedIndex == 0 ? 'assets/icons/icon-ratings-green.png' : 'assets/icons/icon-ratings.png',
                name: 'rating',
                textColor: selectedIndex == 0 ? 'green' : 'grey',)),
          const Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(),
                imgPath: 'assets/icons/icon-statistics.png',
                name: 'statistics',
                textColor: 'grey',)),
          Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(),
                imgPath: selectedIndex == 2 ? 'assets/icons/icon-home-green.png' : 'assets/icons/icon-home.png',
                name: 'planet',
                textColor: selectedIndex == 2 ? 'green' : 'grey',)),
          const Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(),
                imgPath: 'assets/icons/icon-games.png',
                name: 'games',
                textColor: 'grey',)),

        ],
      ),
    );
  }
}
