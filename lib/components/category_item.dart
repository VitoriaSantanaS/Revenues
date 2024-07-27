import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({required this.category, super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(25),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9), //dummy_data color
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            category.title, //dummy_data title
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}

//tela das bolinhas
//Este código define um widget CategoryItem para um aplicativo Flutter. 
//O widget representa visualmente uma categoria e permite a navegação para uma tela de refeições associada a essa categoria.
//Em resumo, este código cria um widget que 
//representa uma categoria com um gradiente de fundo e um texto, e que navega para uma tela de refeições associada a essa categoria quando tocado.