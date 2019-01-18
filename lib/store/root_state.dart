import 'package:meta/meta.dart';

import './app/app_state.dart';
import './recent/recent_state.dart';
import './posts/posts_state.dart';

@immutable
class RootState {
  final AppState app;
  final RecentState recent;
  final PostsState posts;

  RootState({AppState app, RecentState recent, PostsState posts})
      : app = app ?? AppState(),
        recent = recent ?? RecentState(),
        posts = posts ?? PostsState();

  dynamic toJson() => {
        'app': app.toJSON(),
        'recent': recent.toJSON(),
      };

  static RootState fromJSON(dynamic json) {
    return RootState(
      app: json != null ? AppState.fromJSON(json['app']) : AppState(),
      recent: json != null ? RecentState.fromJSON(json['recent']) : RecentState(),
    );
  }

  RootState copyWith({
    AppState app,
    RecentState recent,
    PostsState posts,
  }) {
    return RootState(
      app: app ?? this.app,
      recent: recent ?? this.recent,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return '''RootState{
            app: $app
            recent: $recent
        }''';
  }
}
