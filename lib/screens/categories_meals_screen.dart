import 'package:flutter/material.dart';
import 'package:revenues/components/meal_item.dart';
import '../models/meal.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen({required this.meals, super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}

//Este código define uma tela de refeições para um aplicativo Flutter, exibindo uma lista de refeições associadas a uma determinada categoria.
//Em resumo, este código cria uma tela que exibe uma lista de refeições pertencentes a uma categoria específica. A categoria é passada como argumento da rota, e a tela é construída dinamicamente com base nas refeições que pertencem a essa categoria.
// A tela inclui uma barra de aplicativo com o título da categoria e uma lista de refeições que é renderizada usando ListView.builder.