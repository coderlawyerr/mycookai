import 'package:flutter/material.dart';

import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/wiew/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: Dashboard(),
    );
  }
}
