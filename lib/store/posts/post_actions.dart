import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import '../../models/post_model.dart';
import '../root_state.dart';
import './post_types.dart';

final Function fetchPosts = (BuildContext context) {
  return (Store<RootState> store) async {
    // store.dispatch(new PostRequest());
    await http
        .get(
            "https://www.googleapis.com/blogger/v3/blogs/8856333549335806928/posts?fetchImages=true&maxResults=100&fields=items(author,content,id,images,published,title),nextPageToken&key=AIzaSyBAl7cCnMtF6xCWE-EVWKxIEzMX2M10WSs")
        .then((response) {
      var data = json.decode(response.body);
      store.dispatch(new SetPosts(data['nextPageToken'], data['items']));
    });
  };
};
