import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class FiltersScreen extends StatelessWidget {
  static const routName = '/filter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('filter page'),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('filter'),
      ),
    );
  }
}
