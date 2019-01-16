import 'package:http/http.dart' as http;

import './config.dart';

final Function getPosts = (String params) async {
  return await http.get("$BLOGGER_API/$params");
};
