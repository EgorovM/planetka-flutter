import 'package:flutter/material.dart';
import 'package:planetka/microsoft_ui/texts/text_body1.dart';


class MicrosoftTextInput extends StatefulWidget {
  MicrosoftTextInput({
    Key? key,
    required this.title,
    this.placeholder = 'Ввод...',
    this.errorText = 'Введите корректное сообщение',
    this.controller,
  }) : super(key: key);

  final String title;
  final String placeholder;
  final String errorText;
  TextEditingController? controller;

  @override
  State<StatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends State<MicrosoftTextInput> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MicrosoftBody1Text(widget.title),
        const SizedBox(height: 4),
        SizedBox(
          height: 38,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: widget.placeholder,
              fillColor: const Color(0xffEFF6FC),
            ),
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}