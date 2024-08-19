import 'dart:convert';

import 'package:meals/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _favoriteMealsKey = 'favorite_meals';

  static Future<void> saveFavoriteMeals(List<Meal> meals) async {
    final prefs = await SharedPreferences.getInstance();
    final mealsJson = meals.map((meal) => jsonEncode(meal.toJson())).toList();
    prefs.setStringList(_favoriteMealsKey, mealsJson);
  }

  static Future<List<Meal>> loadFavoriteMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final mealsJson = prefs.getStringList(_favoriteMealsKey) ?? [];
    return mealsJson.map((meal) => Meal.fromJson(jsonDecode(meal))).toList();
  }
}
