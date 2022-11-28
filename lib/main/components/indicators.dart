import 'package:flutter/material.dart';

class IndicatorsComponent extends StatelessWidget {
  final int percent;
  final String imageUrl;
  final String text;
  final Color borderColor;
  final Color fillColor;
  final Color backgroundColor;

  const IndicatorsComponent(
      {Key? key,
      required this.percent,
      required this.imageUrl,
      required this.text,
      required this.borderColor,
        required this.fillColor,
        required this.backgroundColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: borderColor),
                color: backgroundColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 56 - (56 * percent / 100)),
              child: Container(
                height: 56 * percent / 100,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: fillColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff646363),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
