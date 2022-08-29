import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';

// ignore: use_key_in_widget_constructors
class CategoryMealScreen extends StatefulWidget {
  static const routName = '/category-meal-screen';
  final List<Meal> availbleMeal;
  CategoryMealScreen(this.availbleMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String cattitle;
  late List<Meal> displayedMeals;
  var _loading = false;

  @override
  void didChangeDependencies() {
    if (!_loading) {
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final catId = routeArgument['id'];
      cattitle = routeArgument['title'].toString();
      displayedMeals = widget.availbleMeal.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loading = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (contxt, index) {
          return MealItems(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
      ),
    );
  }
}
