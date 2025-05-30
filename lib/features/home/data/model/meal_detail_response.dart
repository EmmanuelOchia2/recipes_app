import 'package:recipes_app/features/home/data/model/meal_detail.dart';

class MealDetailResponse {
  final List<MealDetail> meals;

  MealDetailResponse({required this.meals});

  factory MealDetailResponse.fromJson(Map<String, dynamic> json) {
    return MealDetailResponse(
      meals: List<MealDetail>.from(
          json['meals'].map((x) => MealDetail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((x) => x.toJson()).toList(),
    };
  }
}
