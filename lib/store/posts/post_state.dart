import 'package:meta/meta.dart';
import 'dart:convert';

import '../../models/post_model.dart';

class PostState {
  // properties
  final bool loading;
  final String token;
  final List<dynamic> items;

  // constructor with default
  PostState({
    this.loading = false,
    this.token,
    this.items,
  });

  // allows to modify PostState parameters while cloning previous ones
  PostState copyWith({bool loading, String token, List<dynamic> items}) {
    return new PostState(
      loading: loading ?? this.loading,
      token: token ?? this.token,
      items: items ?? this.items,
    );
  }

  static PostState fromJSON(dynamic jsonData) => PostState(
        loading: jsonData['loading'],
        token: jsonData['token'],
        items:
            jsonData['items'] == null ? null : json.decode(jsonData['items']),
      );

  dynamic toJSON() => <String, dynamic>{
        'loading': this.loading,
        'token': this.token,
        'items': this.items == null ? null : json.encode(this.items),
      };
}
