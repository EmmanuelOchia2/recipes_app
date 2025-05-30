import 'package:recipes_app/features/home/data/model/meal_detail.dart';

class SearchMealDetailResponse {
  final List<MealDetail> meals;

  SearchMealDetailResponse({required this.meals});

  factory SearchMealDetailResponse.fromJson(Map<String, dynamic> json) {
    return SearchMealDetailResponse(
      meals: List<MealDetail>.from(
        (json['meals'] ?? []).map((x) => MealDetail.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((x) => x.toJson()).toList(),
    };
  }
}
