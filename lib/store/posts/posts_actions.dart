import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'dart:convert';

import '../../config.dart';
import '../../utils.dart';
import '../root_state.dart';
import './posts_types.dart';


final Function fetchPosts = (category) {
  return (Store<RootState> store) async {
    store.dispatch(LoadingPosts());
    var fields =
        "items(author,content,id,images,published,title),nextPageToken";

    await getPosts("posts?fetchImages=true&maxResults=${50}&labels=$category&fields=$fields&key=$TOKEN").then((response) {
      if(response.statusCode == 200) {
        var body = json.decode(response.body);
        store.dispatch(SetPosts(body['nextPageToken'], body['items']));
        if(body['items'].length < 50) {
          store.dispatch(EndPosts());
        }
      }
    });

  };
};

final Function addPosts = (category) {
  return (Store<RootState> store) async {

    if(!store.state.posts.end) {
      store.dispatch(LoadingPosts());
      var fields =
          "items(author,content,id,images,published,title),nextPageToken";

      var nextToken = store.state.posts.nextToken;

      await getPosts("posts?fetchImages=true&maxResults=${50}&labels=$category&fields=$fields&pageToken=$nextToken&key=$TOKEN").then((response) {
        if(response.statusCode == 200) {
          var body = json.decode(response.body);
          store.dispatch(AddPosts(body['nextPageToken'], body['items']));
          if(body['items'].length < 50) {
            store.dispatch(EndPosts());
          }
        }
      });
    }
  };
};

final Function clearPosts = () {
  return (Store<RootState> store) async {
    store.dispatch(ClearPosts());
  };
};