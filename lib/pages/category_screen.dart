import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/166 dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 210,
              childAspectRatio: 1.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30),
          children: DUMMY_CATEGORIES.map((item) {
            return CategoryItem(item.color, item.title, item.id);
          }).toList()),
    );
  }
}
