import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/firebase_options.dart';
import 'package:mycooksai/wiew/dashboard.dart';
import 'package:mycooksai/wiew/register_page.dart';
import 'package:mycooksai/wiew/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
