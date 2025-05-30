part of 'recipes_bloc.dart';

class RecipesState {
  RecipesState(
      {required this.recipes,
      this.loading = false,
      this.selectedMeal,
      this.searchResults});
  bool loading;
  List<Meal> recipes;
  List<MealDetail>? searchResults;
  MealDetail? selectedMeal;
}

final class RecipesInitial extends RecipesState {
  RecipesInitial() : super(recipes: List.empty());
}

final class RecipesSearchLoadedState extends RecipesState {
  RecipesSearchLoadedState({
    required super.searchResults,
    required super.recipes,
  });
}
