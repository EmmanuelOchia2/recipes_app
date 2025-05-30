part of 'recipes_bloc.dart';

class RecipesEvent {}

class GetMealsEvent extends RecipesEvent {}

class GetMealDetails extends RecipesEvent {
  GetMealDetails({
    required this.id,
  });
  String id;
}

class SearchMealEvent extends RecipesEvent {
  SearchMealEvent({required this.searchTerm});
  final String searchTerm;
}

class MarkRecipeAsFavorite extends RecipesEvent {
  MarkRecipeAsFavorite({required this.id});
  final String id;
}
