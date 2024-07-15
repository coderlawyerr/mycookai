import 'package:flutter/material.dart';
import 'package:mycooksai/data/recipes.dart';
import 'package:mycooksai/wiew/recipe_details.dart';

class AllFavourites extends StatelessWidget {
  const AllFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
          child: Column(
        children: recommendations.map((recommendation) {
          return FavouriteCard(context, recommendation);
        }).toList(),
      )),
    );
  }

  Widget FavouriteCard(
      BuildContext context, Map<String, String> recommendation) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8, // Gölgeliğin yoğunluğunu belirler
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetails(
                  name: recommendation['name']!,
                  image: recommendation['image']!,
                  by: recommendation['by']!,
                  profileImage: recommendation['profileImage']!,
                  recipe: recommendation['recipe']!,
                ),
              ),
            );
          },
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
      ),
    );
  }
}
