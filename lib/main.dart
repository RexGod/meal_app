import 'package:flutter/material.dart';
import 'category_screen.dart';
import './category_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => CategoryScreen(),
        '/category-meal-screen': (context) => CategoryMealScreen()
      },
    );
  }
}
