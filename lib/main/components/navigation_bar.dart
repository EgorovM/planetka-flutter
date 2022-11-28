import 'package:flutter/material.dart';
import 'package:planetka/main/components/sample_button.dart';

import '../pages/planet_page.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  const CustomNavigationBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        children: const [
          Expanded(
              flex: 1,
              child: SampleButton(
                  destination: PlanetPage(), imgPath: 'assets/icons/icon-ratings.png', name: 'rating', textColor: 'grey',)),
          Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(), imgPath: 'assets/icons/icon-statistics.png', name: 'statistics', textColor: 'grey',)),
          Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(), imgPath: 'assets/icons/icon-home-green.png', name: 'planet', textColor: 'green',)),
          Expanded(
              flex: 1,
              child: SampleButton(
                destination: PlanetPage(), imgPath: 'assets/icons/icon-games.png', name: 'games', textColor: 'grey',)),

        ],
      ),
    );
  }
}
