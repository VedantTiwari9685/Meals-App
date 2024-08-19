import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/shared_preferences_helper.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() async {
    final favoriteMeals = await SharedPreferencesHelper.loadFavoriteMeals();
    state = favoriteMeals;
  }

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealsIsFavorite = state.contains(meal);
    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    _saveFavorites();
    return !mealsIsFavorite;
  }

  void _saveFavorites() async {
    await SharedPreferencesHelper.saveFavoriteMeals(state);
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
