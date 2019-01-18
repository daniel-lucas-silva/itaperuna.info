import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../widgets/cards.dart';
import '../store/root_state.dart';
import '../store/posts/posts_actions.dart';
import '../store/posts/posts_middleware.dart';

class CategoryScreen extends StatelessWidget {

  final scrollController = ScrollController();
  final String category;

  CategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: StoreBuilder(

        onInit: (store) {
          store.dispatch(fetchPosts(category));
          scrollController.addListener(() {
            print(scrollController.position.maxScrollExtent);
            if((scrollController.position.maxScrollExtent - 800.0) < scrollController.offset) {
              if(!store.state.posts.isLoading) {
                store.dispatch(addPosts(category));
              }
            }
          });

        },
        onDispose: (store) {
          store.dispatch(clearPosts());
          scrollController.dispose();
        },
        builder: (BuildContext context, Store<RootState> store) {
          var posts = store.state.posts.items;

          return Container(
            padding: EdgeInsets.only(top: 10.0),
            child: posts == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : RefreshIndicator(
              child: ListView.builder(
                controller: scrollController,
                itemCount: posts.length,

                itemBuilder: (BuildContext context, idx) {
                  return NormalCard(posts[idx]);
                },
              ),
              onRefresh: () {
                var action = RefreshPostsAction(category: category);
                store.dispatch(action);
                return action.completer.future;
              },
            ),
          );
        },
      ),
    );
  }
}
