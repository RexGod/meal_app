import 'package:flutter/material.dart';
import './category_item.dart';
import './158 dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MealApp')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,
                childAspectRatio: 1.3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30),
            children: DUMMY_CATEGORIES.map((item) {
              return CategoryItem(item.color, item.title);
            }).toList()),
      ),
    );
  }
}
