import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userName;

  const UserProfile({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String makeUpper(String text) {
      return text.toUpperCase();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        ),
        SizedBox(height: 10),
        Text(
          "Merhaba, ${makeUpper(userName)}",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontFamily: "Roboto",
          ),
        ),
      ],
    );
  }
}
