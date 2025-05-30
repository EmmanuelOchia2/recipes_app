class MealsResponse {
  final List<Meal> meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) {
    return MealsResponse(
      meals: List<Meal>.from(json['meals'].map((x) => Meal.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((x) => x.toJson()).toList(),
    };
  }
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
    this.favorite = false,
  });

  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  final bool favorite;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }

  Meal copyWith({
    String? strMeal,
    String? strMealThumb,
    String? idMeal,
    bool? favorite,
  }) {
    return Meal(
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      idMeal: idMeal ?? this.idMeal,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }
}
