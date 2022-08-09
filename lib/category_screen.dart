import 'package:flutter/material.dart';
import './category_item.dart';
import './158 dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MealApp')),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 210,
              // TODO: what is childAspectRatio
              childAspectRatio: 1.5,
              crossAxisSpacing: 30,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((item) {
            return CategoryItem(item.color, item.title);
          }).toList()),
    );
  }
}
