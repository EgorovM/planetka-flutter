import 'package:flutter/material.dart';
import 'package:planetka/main/components/leaderboard_card.dart';

import '../components/navigation_bar.dart';

class RatingsPage extends StatelessWidget {
  const RatingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        flexibleSpace: Container(
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Center(
              child: Text(
                'Leaderboard',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(itemCount: 16, itemBuilder: (BuildContext context,
          int index) {
        return LeaderBoardCard(number: index+1, name: 'Michil', areaPoints: 123, gasPoints: 11235, waterPoints: 5555, firstWords: 'EM');
      }),

      bottomNavigationBar: const CustomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}
