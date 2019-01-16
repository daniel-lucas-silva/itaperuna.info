import 'package:redux/redux.dart';
import 'dart:convert';

import '../../config.dart';
import '../../utils.dart';
import '../root_state.dart';
import './recent_types.dart';

final Function fetchRecent = (context) {
  return (Store<RootState> store) async {
    store.dispatch(LoadingRecent());
    var fields =
        "items(author,content,id,images,published,title),nextPageToken";

    await getPosts("posts?fetchImages=true&maxResults=${50}&fields=$fields&key=$TOKEN").then((response) {
      if(response.statusCode == 200) {
        var body = json.decode(response.body);
        store.dispatch(SetRecent(body['nextPageToken'], body['items']));
      }
    });

  };
};

final Function addRecent = (context) {
  return (Store<RootState> store) async {
    store.dispatch(LoadingRecent());
    var fields =
        "items(author,content,id,images,published,title),nextPageToken";

    var nextToken = store.state.recent.nextToken;

    await getPosts("posts?fetchImages=true&maxResults=${50}&fields=$fields&pageToken=$nextToken&key=$TOKEN").then((response) {
      if(response.statusCode == 200) {
        var body = json.decode(response.body);
        store.dispatch(AddRecent(body['nextPageToken'], body['items']));
      }
    });

  };
};
