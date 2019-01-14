import 'package:meta/meta.dart';
import 'dart:convert';

import '../../models/post_model.dart';

class PostState {
  // properties
  final bool isLoading;
  final String token;
  final List<dynamic> items;

  // constructor with default
  PostState({
    this.isLoading = false,
    this.token,
    this.items,
  });

  // allows to modify PostState parameters while cloning previous ones
  PostState copyWith({bool isLoading, String token, List<dynamic> items}) {
    return new PostState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      items: items ?? this.items,
    );
  }

  static PostState fromJSON(dynamic jsonData) => PostState(
        isLoading: jsonData['isLoading'],
        token: jsonData['token'],
        items:
            jsonData['items'] == null ? null : json.decode(jsonData['items']),
      );

  dynamic toJSON() => <String, dynamic>{
        'isLoading': this.isLoading,
        'token': this.token,
        'items': this.items == null ? null : json.encode(this.items),
      };

  @override
  String toString() {
    print(token);
    return '''{
                isLoading: $isLoading,
                token: $token,
                items: $items
            }''';
  }
}
