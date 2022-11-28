import 'package:flutter/material.dart';

class SampleButton extends StatelessWidget {
  final Widget? destination;
  final String imgPath;
  final String name;
  final String textColor;

  const SampleButton(
      {Key? key,
      required this.destination,
      required this.imgPath,
      required this.name,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = textColor == 'grey' ? const Color(0xff646363) : const Color(0xff8FA946);

    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination!),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              imgPath,
              width: 25,
              height: 25,
            ),
            SizedBox(
              height: 15,
              child: Center(
                child: Text(name,
                  style: TextStyle(
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
