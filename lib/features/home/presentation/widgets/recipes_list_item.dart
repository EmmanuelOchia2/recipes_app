import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/data/model/meals_response.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';
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
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
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
            RoundedSquaredImageWidget(
              strMealThumb: item.strMealThumb,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              item.strMeal,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                BlocProvider.of<RecipesBloc>(context).add(
                  MarkRecipeAsFavorite(id: item.idMeal),
                );
              },
              icon: Icon(
                Icons.star,
                color: item.favorite ? Colors.yellow : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
