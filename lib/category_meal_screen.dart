import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String catid;
  // final String cattitle;

  // CategoryMealScreen(this.catid , this.cattitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final caattid = routeArgument['id'];
    final cattitle = routeArgument['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle!),
      ),
      body: Center(
        child: Text('this is another page'),
      ),
    );
  }
}
