import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/widget/button.dart';
import 'package:mycooksai/widget/textfield.dart';
import 'package:mycooksai/wiew/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  "KAYIT OL",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "LuckiestGuy",
                      color: AppColors.whiteTextColor),
                ),
                const Text(
                  "Bilgilerinle Çabucak Kayıt ol",
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
                  label: "Adınız",
                  controller: nameController,
                ),
                CustomTextField(
                  label: "E-Postanız",
                  controller: emailController,
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
                      text: 'Zaten bir hesabın var mı? ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Giriş Yap',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
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
                    text: "Kayıt Ol",
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
