import 'package:flutter/material.dart';
import 'package:mycooksai/wiew/all_favourites.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Favoriler"),
      ),
      body: Center(
        child: AllFavourites(),
      ),
    );
  }
}
