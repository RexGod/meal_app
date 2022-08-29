import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class FiltersScreen extends StatefulWidget {
  static const routName = '/filter';
  Function saveFilters;
  Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegeterian = widget.currentFilters['vegeterian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String description, bool currentValue, var updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('filter page'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedMeal = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian
                };
                widget.saveFilters(selectedMeal);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'You\'r Filters Set Up',
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Expanded(
            child: ListView(children: [
              _buildSwitchTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTile('Lactose-free',
                  'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchTile(
                  'Vegeterian', 'Only include vegeterian meals', _vegeterian,
                  (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              }),
              _buildSwitchTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ]),
          )
        ],
      ),
    );
  }
}
