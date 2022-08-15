import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../pages/meal_details_screen.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const MealItems(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.affordability,
      required this.complexity});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectItems(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItems(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 20,
                  child: Container(
                    width: 290,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('$duration'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_rounded),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
