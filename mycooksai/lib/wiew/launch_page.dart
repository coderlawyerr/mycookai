import 'package:flutter/material.dart';
import 'package:mycooksai/viewmodel/auth_viewmodel.dart';
import 'package:mycooksai/wiew/authentication_pages/dashboard.dart';
import 'package:mycooksai/wiew/home_page.dart';
import 'package:mycooksai/wiew/main_page.dart';
import 'package:provider/provider.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async{
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    await Future.delayed(Duration(seconds: 2));

    final isUserLoggedIn = authViewModel.user != null;
        print('User is logged in: $isUserLoggedIn'); // Konsola yazdırma


    if(isUserLoggedIn){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
