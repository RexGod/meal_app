import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String catid;
  final String cattitle;

  CategoryMealScreen(this.catid , this.cattitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: Center(
        child: Text('this is another page'),
      ),
    );
  }
}
