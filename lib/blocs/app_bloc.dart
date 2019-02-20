import 'package:itaperuna/blocs/posts_bloc.dart';

class AppBloc {
  PostsBloc _posts;

  AppBloc() {
    _posts = PostsBloc();
  }

  PostsBloc get posts => _posts;
}