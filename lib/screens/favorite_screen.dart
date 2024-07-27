import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({
    required this.favoriteMeals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma refeição foi marcada como favorita!',
          style: TextStyle(
            color: Color.fromRGBO(134, 91, 53, 1),
            fontSize: 15,
            fontFamily: 'RobotoCondensed-Italic',
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
      );
    }
  }
}
