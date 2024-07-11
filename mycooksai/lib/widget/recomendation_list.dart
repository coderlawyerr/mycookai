import 'package:flutter/material.dart';
import 'package:mycooksai/wiew/recipe_details.dart';

class RecommendationList extends StatelessWidget {
  final List<Map<String, String>> recommendations;

  const RecommendationList({Key? key, required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: recommendations.map((recommendation) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      recommendation['image']!,
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    recommendation['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "By ${recommendation['by']!}",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
