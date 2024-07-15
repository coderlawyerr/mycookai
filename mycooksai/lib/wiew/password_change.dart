import 'package:flutter/material.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('E-posta Adresini Değiştir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mevcut Şifren',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Mevcut Şifren girin',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yeni Şifren',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Yeni şifreni girin',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // E-posta değiştirme işlemi burada yapılacak
                },
                child: Text('Güncelle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
