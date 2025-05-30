import 'package:dartz/dartz.dart';
import 'package:recipes_app/features/home/data/meals_repository.dart';
import 'package:recipes_app/features/home/data/model/search_meal_detail_response.dart';

abstract class SearchMealByNameUsecase {
  Future<Either<Exception, SearchMealDetailResponse>> execute(String term);
}

class SearchMealByNameUsecaseImpl implements SearchMealByNameUsecase {
  SearchMealByNameUsecaseImpl({required this.repository});
  final MealsRepository repository;
  @override
  Future<Either<Exception, SearchMealDetailResponse>> execute(
      String term) async {
    final response = await repository.getMealByTerm(term);
    return response.fold((l) => left(l), (r) {
      final mealDetails = SearchMealDetailResponse.fromJson(r);
      return right(mealDetails);
    });
  }
}
