import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  const Button(
      {super.key,
      this.buttonColor,
      required this.text,
      required this.onPressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 65,
      width: screenWidth * 0.8, // Genişlik parametresi eklendi
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor ?? AppColors.buttonColor, // Butonun arka plan rengi
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Kenar radius
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16.0,
              color: textColor ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
