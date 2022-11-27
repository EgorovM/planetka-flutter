import 'package:flutter/material.dart';


class MicrosoftBody1Text extends StatelessWidget {
  const MicrosoftBody1Text(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "roboto",
      color: Color(0xff2A2A2A),
    ));
  }
}