import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/viewmodel/auth_viewmodel.dart';
import 'package:mycooksai/widget/custom_button.dart';
import 'package:mycooksai/widget/custom_textfield.dart';
import 'package:mycooksai/wiew/authentication_pages/forgot_password_page.dart';
import 'package:mycooksai/wiew/authentication_pages/register_page.dart';
import 'package:mycooksai/wiew/main_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authViewMoel = Provider.of<AuthViewModel>(context);

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
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 125,
                ),
                Center(
                  child: Button(
                    text: "Giriş Yap",
                    onPressed: () async {
                      try {
                        await authViewMoel.loginWithEmail(
                            mailController.text, passwordController.text);
                            Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()),
                                );
                        print("basarıyla gırıs yapıldı");
                      } catch (e) {
                        print("loginpage sayfasındakı hata: ${e.toString()}");
                      }
                    },
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
