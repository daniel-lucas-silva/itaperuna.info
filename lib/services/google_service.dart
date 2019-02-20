import 'package:dio/dio.dart';
import 'package:itaperuna/config.dart';

class AuthService {
  Dio _dio = Dio();

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future fetch({ category, fields, nextToken }) async {
    try {
      _dio.options.headers = headers;
      return await _dio.post("$BLOGGER_API/posts?fetchImages=true&maxResults=${50}&labels=$category&fields=$fields&pageToken=$nextToken&key=$TOKEN");
    } catch (e) {
      throw (e);
    }
  }
}

final authService = new AuthService();