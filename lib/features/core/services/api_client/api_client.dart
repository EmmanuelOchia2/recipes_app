import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Future<Either<Exception, String>> get(
    String endpoint, {
    Map<String, String>? params,
  }) async {
    final uri = Uri.parse(endpoint);
    final response = await http.get(uri, headers: params);
    if (response.statusCode < 204) {
      return right(response.body);
    } else {
      return left(Exception('Error in request'));
    }
  }
}
