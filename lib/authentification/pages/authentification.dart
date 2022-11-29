import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planetka/authentification/api/auth_api.dart';
import 'package:planetka/main/pages/planet_page.dart';
import 'package:planetka/microsoft_ui/forms/text_input.dart';
import 'package:planetka/microsoft_ui/texts/text_headline.dart';
import 'package:planetka/registration/pages/register.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final authApi = AuthAPI();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              MicrosoftTextInput(
                  title: "Логин",
                  placeholder: "Введите логин...",
                  controller: loginController,
              ),
              const SizedBox(height: 24),
              MicrosoftTextInput(
                  title: "Пароль",
                  placeholder: "Введите пароль...",
                  controller: passwordController,
              ),
              const SizedBox(height: 24),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 500,
                      height: 36,
                      child: FloatingActionButton.extended(
                        label: const Text('Вход'),
                        onPressed: () async {
                          String errorText = await authApi.auth(loginController.text, passwordController.text);

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
                        child: const Text('Зарегистрироваться'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
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
