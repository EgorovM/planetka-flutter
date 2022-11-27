import 'package:flutter/material.dart';


class MicrosoftHeadlineText extends StatelessWidget {
  const MicrosoftHeadlineText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      fontFamily: "roboto",
      color: Color(0xff6E6E6E),
    ));
  }
}