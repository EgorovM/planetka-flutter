import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planetka/authentification/api/auth_api.dart';
import 'package:planetka/authentification/pages/authentification.dart';
import 'package:planetka/microsoft_ui/forms/text_input.dart';
import 'package:planetka/microsoft_ui/texts/text_headline.dart';

import '../../main/pages/planet_page.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final loginController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final authApi = AuthAPI();

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

            const MicrosoftHeadlineText("Регистрация"),
            const SizedBox(height: 32),
            MicrosoftTextInput(title: "Почта", placeholder: "Введите почту...", controller: emailController,),
            const SizedBox(height: 24),
            MicrosoftTextInput(title: "Логин", placeholder: "Введите логин...", controller: loginController,),
            const SizedBox(height: 24),
            MicrosoftTextInput(title: "Имя", placeholder: "Введите имя...", controller: nameController,),
            const SizedBox(height: 24),
            MicrosoftTextInput(title: "Пароль", placeholder: "Введите пароль...", controller: passwordController,),
            const SizedBox(height: 24),
            MicrosoftTextInput(title: "Повторите пароль", placeholder: "Введите пароль...", controller: secondPasswordController,),
            const SizedBox(height: 52,),

            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: 36,
                    child: FloatingActionButton.extended(
                      label: const Text('Зарегистрироваться'),
                      onPressed: () async {
                        if(secondPasswordController.text != passwordController.text) {
                          Fluttertoast.showToast(
                            msg: "Пароли должны совпадать",
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        }

                        String errorText = await authApi.register(
                            emailController.text,
                            loginController.text,
                            nameController.text,
                            passwordController.text,
                            secondPasswordController.text
                        );

                        if(errorText.isNotEmpty) {
                          Fluttertoast.showToast(
                            msg: errorText,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PlanetPage()),
                        );
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
                      child: const Text('Вход'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
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
