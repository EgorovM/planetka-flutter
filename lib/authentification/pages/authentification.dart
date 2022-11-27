import 'package:flutter/material.dart';
import 'package:planetka/microsoft_ui/forms/text_input.dart';
import 'package:planetka/microsoft_ui/texts/text_headline.dart';
import 'package:planetka/registration/pages/register.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 116,),

              const MicrosoftHeadlineText("Вход"),
              const SizedBox(height: 32),
              const MicrosoftTextInput(title: "Логин", placeholder: "Введите логин..."),
              const SizedBox(height: 24),
              const MicrosoftTextInput(title: "Пароль", placeholder: "Введите пароль..."),
              const SizedBox(height: 24),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 500,
                      height: 36,
                      child: FloatingActionButton.extended(
                        label: const Text('Вход'),
                        onPressed: () {
                          // Navigate to second route when tapped.
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 500,
                      height: 36,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Text('Зарегистрироваться'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
