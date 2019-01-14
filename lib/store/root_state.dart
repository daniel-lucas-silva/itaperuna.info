import 'package:meta/meta.dart';

import './posts/post_state.dart';

@immutable
class RootState {
  final PostState post;

  RootState({PostState post}) : post = post ?? PostState();

  dynamic toJson() => {
        'post': post.toJSON(),
      };

  static RootState fromJSON(dynamic json) {
    print("fromJSON");
    print(json);
    return RootState(
      post: json != null ? PostState.fromJSON(json['post']) : PostState(),
    );
  }

  RootState copyWith({
    PostState post,
  }) {
    return RootState(
      post: post ?? this.post,
    );
  }

  @override
  String toString() {
    return '''RootState{
            post: $post
        }''';
  }
}
