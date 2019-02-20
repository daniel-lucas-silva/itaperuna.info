import 'package:dio/dio.dart';
import 'package:itaperuna/config.dart';

class GoogleService {
  Dio _dio = Dio();

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future fetch({ category, nextToken, max: 50 }) async {
    var fields = "items(author(displayName%2Cid%2Cimage)%2Ccontent%2Cid%2Cimages%2Clabels%2Cpublished%2CreaderComments%2Cstatus%2Ctitle)%2CnextPageToken";

    category = category != null ? "&labels=$category" : "";
    nextToken = nextToken != null ? "&pageToken=$nextToken" : "";

    try {
      _dio.options.headers = headers;
      return await _dio.get("$BLOGGER_API/posts?fetchImages=true&maxResults=$max$category$nextToken&fields=$fields&key=$TOKEN");
    } catch (e) {
      throw (e);
    }
  }
}

final googleService = new GoogleService();