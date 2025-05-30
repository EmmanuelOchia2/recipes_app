import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/data/model/meals_response.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.item,
  });

  final Meal item;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<RecipesBloc>(context).add(
          MarkRecipeAsFavorite(id: item.idMeal),
        );
      },
      icon: Icon(
        Icons.star,
        color: item.favorite ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
