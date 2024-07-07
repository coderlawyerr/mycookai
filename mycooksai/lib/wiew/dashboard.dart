import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/widget/button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
          const  SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                   const   TextSpan(
                        text: "YARATIN\nPİŞİRİN\nFETHEDİN",
                        style: TextStyle(
                          fontFamily: "LuckiestGuy",
                          color: Colors.white,
                          fontSize: 65,
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(-10, 25),
                          child: Image.asset(
                            "assets/star1.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            const Text(
              "Yapay Zeka İle Mutfağın Ustası Ol",
              style: TextStyle(
                color: AppColors.whiteTextColor,
                fontSize: 20,
                fontFamily: "Roboto",
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Button(
                text: "Haydi Başlayalım",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
