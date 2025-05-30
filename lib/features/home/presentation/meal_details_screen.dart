import 'package:flutter/material.dart';
import 'package:recipes_app/features/home/data/model/meal_detail.dart';
import 'package:recipes_app/features/home/presentation/widgets/rounded_squared_image_widget.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({required this.mealDetail, super.key});
  final MealDetail mealDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.strMeal),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const DetailsTitleWidget(title: 'Ingredients'),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...mealDetail.ingredients.map(
                        (e) => Text(' - $e'),
                      ),
                    ],
                  ),
                  const Spacer(),
                  RoundedSquaredImageWidget(
                    strMealThumb: mealDetail.strMealThumb,
                    height: 180,
                    width: 180,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const DetailsTitleWidget(title: 'Instructions'),
              Text(
                mealDetail.strInstructions,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsTitleWidget extends StatelessWidget {
  const DetailsTitleWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}
