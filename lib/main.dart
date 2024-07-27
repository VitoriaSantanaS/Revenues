import 'package:flutter/material.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs.screen.dart';
import 'screens/settings.screen.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;

  final List<Meal> _favoriteMeals = [];

  void _filterMweals(Settings settings) {
    setState(() {
      settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Color> whiteShades = {
      50: const Color.fromARGB(255, 218, 218, 218),
    };

    MaterialColor whiteColor = MaterialColor(0xFFFFFFFF, whiteShades);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(134, 91, 53, 1),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'RobotoCondensed-Italic',
          ),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 255, 236, 219),
          primarySwatch: whiteColor,
          accentColor: const Color.fromRGBO(253, 167, 106, 1.0),
        ).copyWith(),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'RobotoCondensed-Italic',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEALS_DETAIL: (context) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
            settings: settings, onSettingsChanged: _filterMweals),
      },
    );
  }
}
