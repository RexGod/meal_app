import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

// ignore: use_key_in_widget_constructors
class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){return const Center(
      child: Text('its favorite page'),
    );}
    else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (contxt, index) {
          return MealItems(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            
          );
        },
      );
    }
  }
}
