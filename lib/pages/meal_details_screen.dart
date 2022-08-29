import 'package:flutter/material.dart';
import '../data/166 dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/detailScreen';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  Widget selectSection(BuildContext context, String sectionTitle) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(sectionTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      ),
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              selectSection(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              selectSection(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('#${index + 1}')),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => toggleFavorite(mealId),
            child: isFavorite(mealId)
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)));
  }
}
