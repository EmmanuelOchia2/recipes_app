import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/data/model/meals_response.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';
import 'package:recipes_app/features/home/presentation/widgets/favorite_icon_widget.dart';
import 'package:recipes_app/features/home/presentation/widgets/rounded_squared_image_widget.dart';

class RecipesListItem extends StatelessWidget {
  const RecipesListItem({
    required this.item,
    this.actionable = false,
    super.key,
  });
  final Meal item;
  final bool actionable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RecipesBloc>(context).add(
          GetMealDetails(id: item.idMeal),
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 8,
                offset: const Offset(2, 4),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: item.idMeal,
                child: RoundedSquaredImageWidget(
                  strMealThumb: item.strMealThumb,
                ),
              ),
              const SizedBox(width: 8),
              Hero(
                tag: item.strMeal,
                child: Text(
                  item.strMeal,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const Spacer(),
              FavoriteIconWidget(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
