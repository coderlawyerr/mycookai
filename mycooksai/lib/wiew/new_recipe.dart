import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/widget/custom_button.dart';
import 'package:mycooksai/widget/custom_textfield.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key});

  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  String? _selectedMeal; // Başlangıçta null, yani hiçbir şey seçili değil
  TextEditingController _recipeNameController = TextEditingController();
  TextEditingController _recipeController = TextEditingController();

  final List<String> _meals = [
    "Kahvaltı",
    "Öğle Yemeği",
    "Akşam Yemeği",
    "Atıştırmalık",
    "Tatlı",
    "Brunch",
    "Gece Yemeği",
    "Ara Öğün",
    "İkindi Çayı"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        title: Text("Yeni Tarif Oluştur"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.9,
              child: DottedBorder(
                color: Colors.black54,
                strokeWidth: 2,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(
                      20), // İkon etrafında dolgu oluşturmak için
                  alignment: Alignment.center, // İkonu ortalamak için
                  child: Icon(
                    Icons.photo,
                    size: screenWidth * 0.4, // İkon boyutunu ayarla
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                label: "Yemeğin adını yazınız",
                controller: _recipeNameController,
              ),
            ),
            SizedBox(height: 20), // İkon ile DropdownButton arasında boşluk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green, // Arka plan rengi
                  border: Border.all(color: Colors.black45), // Border rengi
                  borderRadius: BorderRadius.circular(8), // Kenar yuvarlama
                ),
                width: screenWidth,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.white,
                    isExpanded: true, // Dropdown'un genişliğini tam yap
                    hint: const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        "Öğün seç",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    value: _selectedMeal,
                    items: _meals.map((String meal) {
                      return DropdownMenuItem<String>(
                        value: meal,
                        child: Text(
                          meal,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedMeal = newValue;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return _meals.map((String meal) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(9.0),
                          child: Text(
                            meal,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                label: "Yemeğin tarifini yazınız",
                controller: _recipeController,
                maxLine: 10,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Button(
              textColor: Colors.white,
              text: "OLUŞTUR",
              onPressed: () {
                print(
                    "yemek adı: ${_recipeNameController.text}yemek tarifi:${_recipeController.text} öğün türü:${_selectedMeal}");
              },
              buttonColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
