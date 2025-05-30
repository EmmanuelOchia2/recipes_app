import 'package:dartz/dartz.dart';
import 'package:recipes_app/features/home/data/meals_repository.dart';
import 'package:recipes_app/features/home/data/model/meals_response.dart';

abstract class GetMealsUsecase {
  Future<Either<Exception, MealsResponse>> execute();
}

class GetMealsUsecaseImpl implements GetMealsUsecase {
  GetMealsUsecaseImpl({required this.repository});
  MealsRepository repository;
  @override
  Future<Either<Exception, MealsResponse>> execute() async {
    final response = await repository.getMeals();
    return response.fold((l) {
      return left(l);
    }, (r) {
      return right(MealsResponse.fromJson(r));
    });
  }
}
