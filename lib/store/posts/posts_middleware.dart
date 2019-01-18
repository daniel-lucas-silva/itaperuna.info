import 'package:redux/redux.dart';
import 'dart:async';
import 'dart:convert';

import '../../config.dart';
import '../../utils.dart';
import '../root_state.dart';
import './posts_types.dart';

class RefreshPostsAction {
  final Completer<Null> completer;
  final String category;
  RefreshPostsAction({ Completer completer, this.category }) : this.completer = completer ?? Completer<Null>();
}

Middleware<RootState> _refreshPosts() {
  return (Store<RootState> store, action, NextDispatcher next) async {
    if (action is RefreshPostsAction) {

      var fields =
          "items(author,content,id,images,published,title),nextPageToken";

      await getPosts("posts?fetchImages=true&maxResults=${50}&labels=${action.category}&fields=$fields&key=$TOKEN").then((response) {
        if(response.statusCode == 200) {
          var body = json.decode(response.body);
          store.dispatch(SetPosts(body['nextPageToken'], body['items']));
        }
        action.completer.complete();
      });

//      loadPosts().then((items) {
////        store.dispatch(PostsRefreshedAction(items));
//        action.completer.complete();
//      },
//      ).catchError((_) {
////        store.dispatch(PostsNotRefreshedAction());
//        action.completer.complete();
//      });
    }
    next(action);
  };
}

Middleware<RootState> postsMiddleware = TypedMiddleware<RootState, RefreshPostsAction>(_refreshPosts());


//return RefreshIndicator(
//  onRefresh: () {
//    var action = RefreshPostsAction();
//    store.dispatch(action);
//    return action.completer.future;
//  },
//  child: ListView(...)
//);