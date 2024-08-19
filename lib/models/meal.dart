enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  // Convert a Meal object into a Map.
  Map<String, dynamic> toJson() => {
        'id': id,
        'categories': categories,
        'title': title,
        'imageUrl': imageUrl,
        'ingredients': ingredients,
        'steps': steps,
        'duration': duration,
        'complexity': complexity.index,
        'affordability': affordability.index,
        'isGlutenFree': isGlutenFree,
        'isLactoseFree': isLactoseFree,
        'isVegan': isVegan,
        'isVegetarian': isVegetarian,
      };

  // Convert a Map into a Meal object.
  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json['id'],
        categories: List<String>.from(json['categories']),
        title: json['title'],
        imageUrl: json['imageUrl'],
        ingredients: List<String>.from(json['ingredients']),
        steps: List<String>.from(json['steps']),
        duration: json['duration'],
        complexity: Complexity.values[json['complexity']],
        affordability: Affordability.values[json['affordability']],
        isGlutenFree: json['isGlutenFree'],
        isLactoseFree: json['isLactoseFree'],
        isVegan: json['isVegan'],
        isVegetarian: json['isVegetarian'],
      );
}
