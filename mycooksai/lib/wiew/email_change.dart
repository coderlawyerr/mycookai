import 'package:flutter/material.dart';

class MailChange extends StatelessWidget {
  const MailChange({super.key});

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
              'Mevcut E-posta Adresi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Mevcut e-posta adresinizi girin',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yeni E-posta Adresi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Yeni e-posta adresinizi girin',
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
