// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MealSuggestionChatPage extends StatelessWidget {
  final Map<String, dynamic> category;
  const MealSuggestionChatPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['name']),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: SpeedDial(
        activeBackgroundColor: Colors.transparent,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            label: "Dolaptaki malzemeye göre öner",
            labelStyle: TextStyle(fontSize: 20.0),
            onTap: () {
              print("Ekleye basıldı");
            },
          ),
          SpeedDialChild(
            label: "Menü öner",
            labelStyle: TextStyle(fontSize: 20.0),
            onTap: () {
              print("Ekleye basıldı");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ChatBubble(
                context,
                false,
                "Merhaba! ${category['name']} öğününde ne yemek istersin?",
                "09:24"),
            ChatBubble(
                context,
                true,
                "Mutfağımdaki ürünlere göre bir şeyler hazırlmanı istiyorum.",
                "09:25"),
          ],
        ),
      ),
    );
  }

  Widget ChatBubble(
      BuildContext context, bool isFromMe, String text, String time) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isFromMe)
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 5.0),
              ],
            ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 10),
            width: screenWidth * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft:
                    isFromMe ? Radius.circular(20.0) : Radius.circular(0.0),
                bottomRight:
                    isFromMe ? Radius.circular(0.0) : Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
