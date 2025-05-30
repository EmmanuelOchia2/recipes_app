import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: theme.focusColor,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search recipe',
          suffix: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              BlocProvider.of<RecipesBloc>(context).add(
                SearchMealEvent(searchTerm: controller.text),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
