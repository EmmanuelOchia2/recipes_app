import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes_app/features/home/data/meals_repository.dart';
import 'package:recipes_app/features/home/data/model/meal_detail.dart';
import 'package:recipes_app/features/home/data/model/meals_response.dart';
import 'package:recipes_app/features/home/domain/get_meal_by_id_usecase.dart';
import 'package:recipes_app/features/home/domain/get_meals_usecase.dart';
import 'package:recipes_app/features/home/domain/search_meal_by_name_usecase.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  RecipesBloc() : super(RecipesInitial()) {
    on<GetMealsEvent>((event, emit) async {
      if (state.loading) return;
      showLoading(emit);

      final response = await getMealsUsecase.execute();

      response.fold((l) {}, (r) {
        final newList = List.of(state.recipes);
        newList.addAll(r.meals);
        emit(
          RecipesState(recipes: newList),
        );
      });
    });
    on<GetMealDetails>((event, emit) async {
      showLoading(emit);

      final response = await getMealByIdUsecase.execute(event.id);

      response.fold((l) {}, (r) {
        emit(
          RecipesState(
            recipes: state.recipes,
            selectedMeal: r.meals.first,
          ),
        );
      });
    });
    on<SearchMealEvent>((event, emit) async {
      showLoading(emit);
      final response = await searchMealUsecase.execute(event.searchTerm);
      response.fold((l) => left(l), (r) {
        emit(
          RecipesSearchLoadedState(
            recipes: state.recipes,
            searchResults: r.meals,
          ),
        );
      });
    });
    on<MarkRecipeAsFavorite>((event, emit) {
      final newList = List.of(state.recipes);
      final index = newList.indexWhere((e) => e.idMeal == event.id);
      newList[index] = newList[index].copyWith(favorite: true);
      emit(
        RecipesState(recipes: newList),
      );
    });
  }

  GetMealsUsecase getMealsUsecase =
      GetMealsUsecaseImpl(repository: MealsRepository());

  GetMealByIdUsecase getMealByIdUsecase =
      GetMealByIdUsecaseImpl(repository: MealsRepository());
  SearchMealByNameUsecaseImpl searchMealUsecase =
      SearchMealByNameUsecaseImpl(repository: MealsRepository());

  void showLoading(Emitter<RecipesState> emit) {
    emit(
      RecipesState(
        recipes: state.recipes,
        loading: true,
        selectedMeal: null,
      ),
    );
    Future.delayed(const Duration(seconds: 4));
  }
}
