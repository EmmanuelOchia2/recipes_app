import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recipes_app/features/core/services/api_client/api_client.dart';

class MealsRepository {
  final endpoint = 'https://www.themealdb.com/api/json/v1/1/';
  final _client = APIClient();
  Future<Either<Exception, Map<String, dynamic>>> getMeals() async {
    final response = await _client.get('${endpoint}filter.php?a=Canadian');
    return response.fold(
      (l) => left(l),
      (r) {
        final decoded = jsonDecode(r);
        return right(decoded);
      },
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> getMealByID(String id) async {
    final response = await _client.get('${endpoint}lookup.php?i=$id');
    return response.fold((l) => left(l), (r) {
      final decoded = jsonDecode(r);
      return right(decoded);
    });
  }

  Future<Either<Exception, Map<String, dynamic>>> getMealByTerm(
      String term) async {
    final response = await _client.get('${endpoint}search.php?s=$term');
    return response.fold((l) => left(l), (r) {
      final decoded = jsonDecode(r);
      return right(decoded);
    });
  }
}
