// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mycooksai/widget/category_list.dart';
import 'package:mycooksai/widget/recomendation_list.dart';
import 'package:mycooksai/widget/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/viewmodel/auth_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final String userName = authViewModel.user?.name ?? "User";

    final List<Map<String, dynamic>> categories = [
      {'name': 'Breakfast', 'icon': Icons.breakfast_dining},
      {'name': 'Lunch', 'icon': Icons.lunch_dining},
      {'name': 'Dinner', 'icon': Icons.dinner_dining},
      {'name': 'Dessert', 'icon': Icons.cake},
      {'name': 'Snacks', 'icon': Icons.fastfood},
    ];

    final List<Map<String, String>> recommendations = [
      {
        'name': 'Hamburger',
        'image':
            'https://images.pexels.com/photos/1108117/pexels-photo-1108117.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'by': 'Can Kırkgöz',
      },
      {
        'name': 'Cheesecake',
        'image':
            'https://images.pexels.com/photos/4051674/pexels-photo-4051674.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'by': 'Betül ŞENSOY',
      },
      {
        'name': 'Ravioli',
        'image':
            'https://images.pexels.com/photos/3893777/pexels-photo-3893777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'by': 'Mücahit Gökçe',
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfile(userName: userName),
              SizedBox(height: 15),
              Text(
                "Bugün ne yemek istersin?",
                style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 20,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kategoriler",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Hepsini gör",
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  ),
                ],
              ),
              CategoryList(
                  categories: categories, selectedCategory: 'Breakfast'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Öneriler",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Hepsini gör",
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  ),
                ],
              ),
              SizedBox(height: 15),
              RecommendationList(recommendations: recommendations),
            ],
          ),
        ),
      ),
    );
  }
}
