import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData iconData, Function onTapHandler) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () => onTapHandler,
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
            height: 15,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed('');
          }),
        ],
      ),
    );
  }
}
