import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../store/root_state.dart';
import '../../store/posts/post_actions.dart';
import '../post_screen.dart';

class GeneralTab extends StatelessWidget {
  postScreen(id) {
    return MaterialPageRoute(builder: (context) => PostScreen(id));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<RootState, dynamic>(
      onInit: (Store<RootState> store) {
        store.dispatch(fetchPosts(context));
      },
      converter: (store) => store.state.post.items ?? [],
      builder: (BuildContext context, posts) {
        return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return GestureDetector(
                onTap: () =>
                    Navigator.push(context, postScreen(posts[index]['id'])),
                child: Card(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      posts[index]['images'] == null
                          ? new Container(width: 0, height: 0)
                          : Image.network(posts[index]['images'][0]['url']),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(posts[index]['title']),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
