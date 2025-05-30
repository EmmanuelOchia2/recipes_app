import 'package:dartz/dartz.dart';
import 'package:recipes_app/features/home/data/meals_repository.dart';
import 'package:recipes_app/features/home/data/model/meal_detail_response.dart';

abstract class GetMealByIdUsecase {
  Future<Either<Exception, MealDetailResponse>> execute(String id);
}

class GetMealByIdUsecaseImpl implements GetMealByIdUsecase {
  const GetMealByIdUsecaseImpl({required this.repository});
  final MealsRepository repository;
  @override
  Future<Either<Exception, MealDetailResponse>> execute(String id) async {
    final response = await repository.getMealByID(id);
    return response.fold((l) => left(l), (r) {
      final mealDetails = MealDetailResponse.fromJson(r);
      return right(mealDetails);
    });
  }
}
