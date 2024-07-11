// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mycooksai/data/recipes.dart';

class AllRecomendations extends StatelessWidget {
  const AllRecomendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Öneriler"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: recommendations.map((recommendation) {
          return RecomendationCard(context, recommendation);
        }).toList(),
      )),
    );
  }

  Widget RecomendationCard(
      BuildContext context, Map<String, String> recommendation) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8, // Gölgeliğin yoğunluğunu belirler
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                recommendation['image']!,
                fit: BoxFit.cover,
                height: 250,
                width: screenWidth *
                    0.45, // Görselin genişliğini belirleyebilirsiniz
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommendation['name']!,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                SizedBox(height: 20),
                Text(
                  recommendation['by']!,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
