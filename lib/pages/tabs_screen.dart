import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import './category_screen.dart';
import './favorite.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _screens;
  int _selectPageIndex = 0;
 @override
  void initState() {
    _screens = [
    {'pages': CategoryScreen(), 'title': 'Categotries'},
    {'pages': FavoriteScreen(widget.favoriteMeals), 'title': 'You\'r Favorits'}
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(_screens[_selectPageIndex]['title'] as String)),
        drawer: MainDrawer(),
        body: _screens[_selectPageIndex]['pages'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            // ignore: deprecated_member_use
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.white,
            currentIndex: _selectPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favoriets')
            ]));
  }
}
