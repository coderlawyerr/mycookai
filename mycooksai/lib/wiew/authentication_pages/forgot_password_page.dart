import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/viewmodel/auth_viewmodel.dart';
import 'package:mycooksai/widget/custom_button.dart';
import 'package:mycooksai/widget/custom_textfield.dart';
import 'package:mycooksai/wiew/authentication_pages/register_page.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  get authViewMoel => null;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    TextEditingController emailController = TextEditingController();
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
                Text(
                  "ŞİFRENİ SIFIRLA",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "LuckiestGuy",
                      color: AppColors.whiteTextColor),
                ),
                const Text(
                  "Şifreni sıfırlamak için e-postanı yaz",
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
                  controller: emailController,
                ),
                SizedBox(
                  height: 125,
                ),
                Center(
                  child: Button(
                    text: "E-Posta Gönder",
                    onPressed: () async {
                      await authViewModel
                          .sendPasswordResetEmail(emailController.text);
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
