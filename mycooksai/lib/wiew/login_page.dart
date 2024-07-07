import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/widget/button.dart';
import 'package:mycooksai/widget/textfield.dart';
import 'package:mycooksai/wiew/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/icon.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "GİRİŞ YAP",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "LuckiestGuy",
                      color: AppColors.whiteTextColor),
                ),
                const Text(
                  "Giriş Yap Ve Harikalar Yarat",
                  style: TextStyle(
                    color: AppColors.whiteTextColor,
                    fontSize: 20,
                    fontFamily: "Roboto",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: "E-Postanız",
                  controller: mailController,
                ),
                CustomTextField(
                  label: "Şifreniz",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Bir hesabın yok mu? ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Kayıt Ol',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 125,
                ),
                Center(
                  child: Button(
                    text: "Giriş Yap",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
