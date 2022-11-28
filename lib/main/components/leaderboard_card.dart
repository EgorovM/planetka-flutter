import 'package:flutter/material.dart';

class LeaderBoardCard extends StatelessWidget {
  final int number;
  final String name;
  final int gasPoints;
  final int waterPoints;
  final int areaPoints;
  final String firstWords;

  const LeaderBoardCard(
      {Key? key,
      required this.number,
      required this.name,
      required this.areaPoints,
      required this.gasPoints,
      required this.waterPoints,
      required this.firstWords})
      : super(key: key);

  final TextStyle textStyle = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    Color color;

    if (number == 1) {
      color = Color(0xffBAD7F2);
    } else if (number == 2) {
      color = Color(0xffF2BAC9);
    } else if (number == 3) {
      color = Color(0xffF2E2BA);
    } else {
      color = Color(0xffF3F4F7);
    }

    return Card(
      color: color,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: 40,
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xffD9D9D9),
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 60,
            height: 50,
          ),
          Image.asset(
            'assets/icons/icon-achievements.png',
            width: 12,
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 12),
            child: Text(
              gasPoints.toString(),
              style: textStyle,
            ),
          ),
          const SizedBox.shrink(),
          Image.asset(
            'assets/icons/icon-water.png',
            width: 12,
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 12),
            child: Text(
              waterPoints.toString(),
              style: textStyle,
            ),
          ),
          const SizedBox.shrink(),
          Image.asset(
            'assets/icons/icon-area.png',
            width: 12,
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 12),
            child: Text(
              areaPoints.toString(),
              style: textStyle,
            ),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}
