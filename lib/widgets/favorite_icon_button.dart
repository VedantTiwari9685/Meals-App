import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({
    super.key,
    required this.meal,
    required this.favoriteMeals,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final List<Meal> favoriteMeals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.favoriteMeals.contains(widget.meal);
  }

  void _toggleFavorite() {
    widget.onToggleFavorite(widget.meal);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorite,
      icon: Icon(isFavorite ? Icons.star : Icons.star_border),
    );
  }
}
