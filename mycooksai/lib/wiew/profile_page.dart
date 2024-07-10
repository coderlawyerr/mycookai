import 'package:flutter/material.dart';
import 'package:mycooksai/viewmodel/auth_viewmodel.dart';
import 'package:mycooksai/wiew/authentication_pages/dashboard.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout'){
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: "logout",
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text("Çıkış Yap"),
                  ],
                ),
              ),
            ];
          })
        ],
      ),
    );
  }
  void _logout(BuildContext context)async{
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    await authViewModel.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

}
