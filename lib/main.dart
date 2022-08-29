import 'package:flutter/material.dart';
import './pages/tabs_screen.dart';
import './pages/meal_details_screen.dart';
import './pages/category_screen.dart';
import './pages/category_meal_screen.dart';
import './pages/filter_screen.dart';
import 'data/166 dummy_data.dart';
import 'model/meal.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> _availbleMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availbleMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: const Color.fromRGBO(255, 130, 77, 1),
          canvasColor: const Color.fromRGBO(229, 236, 244, 0.9),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealScreen.routName: (context) =>
            CategoryMealScreen(_availbleMeals),
        MealDetailsScreen.routName: (context) => MealDetailsScreen(),
        FiltersScreen.routName: (context) => FiltersScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
        );
      },
    );
  }
}
