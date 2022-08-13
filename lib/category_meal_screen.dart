import 'package:flutter/material.dart';
import '166 dummy_data.dart';

// ignore: use_key_in_widget_constructors
class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catId = routeArgument['id'];
    final cattitle = routeArgument['title'];

    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (contxt, index) {
          return Text(categoryMeal[index].title);
        },
      ),
    );
  }
}
