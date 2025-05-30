import 'package:flutter/material.dart';
import 'package:recipes_app/features/home/data/model/meal_detail.dart';
import 'package:recipes_app/features/home/presentation/widgets/recipes_list_item.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    required this.searchResults,
    super.key,
  });
  final List<MealDetail> searchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search results'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
            children: (searchResults)
                .map(
                  (e) => RecipesListItem(item: e.toMeal()),
                )
                .toList()),
      ),
    );
  }
}
