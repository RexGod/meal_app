import 'package:flutter/material.dart';
import '../pages/filter_screen.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      // ignore: use_function_type_syntax_for_parameters
      String title,
      IconData iconData,
      Function onTapHandler) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        onTapHandler;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          Container(
            // ignore: deprecated_member_use
            color: Theme.of(context).accentColor,
            height: 160,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
