import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../config.dart';
import '../../utils.dart';
import '../root_state.dart';
import './app_types.dart';
import '../recent/recent_actions.dart';

final Function fetchHomePosts = (context) {
  return (Store<RootState> store) async {
    store.dispatch(HomePostsRequest());

    var fields =
        "items(author,content,id,images,published,title),nextPageToken";

    await getPosts(
            "posts?fetchImages=true&maxResults=${3}&labels=Destaque&fields=$fields&key=$TOKEN")
        .then((response) {
      if (response.statusCode == 200) {
        store.dispatch(SetFeatures(json.decode(response.body)['items']));
      }
    });

    await getPosts(
            "posts?fetchImages=true&maxResults=${4}&labels=Regiao&fields=$fields&key=$TOKEN")
        .then((response) {
      if (response.statusCode == 200) {
        store.dispatch(SetRegion(json.decode(response.body)['items']));
      }
    });

    store.dispatch(fetchRecent(context));

    // var maxResults = 100;
    //

    // await http
    //     .get(
    //         "$BLOGGER_API/posts?fetchImages=true&maxResults=$maxResults&fields=$fields&key=$TOKEN")
    //     .then((response) {
    //   var body = json.decode(response.body);

    //   print(body);
    // });
  };
};

final Function fetchCategories = () {
  return (Store<RootState> store) async {
    await http.get("https://www.paulorobertonews.com/feeds/posts/summary?alt=json&max-results=0").then((response) {


      if (response.statusCode == 200) {

        var categories = json.decode(response.body)['feed']['category'];

         store.dispatch(SetCategories(categories.map((item) => item['term']).toList()..sort()));
      }
    });
  };
};
