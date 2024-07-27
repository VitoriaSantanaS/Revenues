import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20, //tamanho das grades
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(
          category: cat,
        );
      }).toList(),
    );
  }
}

//tela principal, Em resumo, este código cria uma tela que exibe uma grade de itens de categoria, onde cada item é representado por um widget CategoryItem. 
//A estrutura da grade é definida para ter um espaçamento uniforme e um tamanho máximo específico para cada item.