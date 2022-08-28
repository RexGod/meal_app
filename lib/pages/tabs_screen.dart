import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorite.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _screens = [
    {'pages': CategoryScreen(), 'title': 'Categotries'},
    {'pages': FavoriteScreen(), 'title': 'You\'r Favorits'}
  ];
  int _selectPageIndex = 0;
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
