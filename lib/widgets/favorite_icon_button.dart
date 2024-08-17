import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';

class FavoriteIconButton extends ConsumerStatefulWidget {
  const FavoriteIconButton({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends ConsumerState<FavoriteIconButton> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = ref.read(favoriteMealsProvider).contains(widget.meal);
  }

  void _toggleFavorite() {
    final wasAdded = ref
        .read(favoriteMealsProvider.notifier)
        .toggleMealFavoriteStatus(widget.meal);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(wasAdded
            ? "Meal added as a Favorite!"
            : "Meal removed from Favorites."),
      ),
    );
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorite,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: Tween<double>(
              begin: 0.85,
              end: 1,
            ).animate(animation),
            child: child,
          );
        },
        child: Icon(
          isFavorite ? Icons.star : Icons.star_border,
          key: ValueKey(isFavorite),
        ),
      ),
    );
  }
}
