import 'package:flutter/material.dart';
import './category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(
    this.color,
    this.title,
    this.id,
  );

  void transfer(BuildContext contxt) {
    Navigator.of(contxt).pushNamed('/category-meal-screen', arguments: {'id': id , 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => transfer(context),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
