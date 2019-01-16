import 'package:meta/meta.dart';

import './app/app_state.dart';
import './recent/recent_state.dart';
import './posts/post_state.dart';

@immutable
class RootState {
  final AppState app;
  final RecentState recent;
  final PostState post;

  RootState({AppState app, RecentState recent, PostState post})
      : app = app ?? AppState(),
        recent = recent ?? RecentState(),
        post = post ?? PostState();

  dynamic toJson() => {
        'app': app.toJSON(),
        'recent': recent.toJSON(),
        'post': post.toJSON(),
      };

  static RootState fromJSON(dynamic json) {
    return RootState(
      app: json != null ? AppState.fromJSON(json['app']) : AppState(),
      recent: json != null ? RecentState.fromJSON(json['recent']) : RecentState(),
      post: json != null ? PostState.fromJSON(json['post']) : PostState(),
    );
  }

  RootState copyWith({
    AppState app,
    RecentState recent,
    PostState post,
  }) {
    return RootState(
      app: app ?? this.app,
      recent: recent ?? this.recent,
      post: post ?? this.post,
    );
  }

  @override
  String toString() {
    return '''RootState{
            app: $app
            recent: $recent
            post: $post
        }''';
  }
}
