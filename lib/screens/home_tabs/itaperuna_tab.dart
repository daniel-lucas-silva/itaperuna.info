import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../widgets/cards.dart';
import '../../store/root_state.dart';
import '../../store/posts/posts_actions.dart';
import '../../store/posts/posts_middleware.dart';

class ItaperunaTab extends StatelessWidget {

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return StoreBuilder(

      onInit: (store) {
        store.dispatch(fetchPosts("Itaperuna"));
        _scrollController.addListener(() {
          print(_scrollController);
          if((_scrollController.position.maxScrollExtent - 400) == _scrollController.offset) {
            store.dispatch(addPosts("Itaperuna"));
          }
        });

      },
      onDispose: (store) {
        store.dispatch(clearPosts());
//        _scrollController.dispose();
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
            child: ListView(
              children: <Widget>[
                Column(
                  children: posts.map<Widget>((post) {
                    return NormalCard(post);
                  }).toList(),
                ),
                loadButton(),
              ],
            ),
            onRefresh: () {
              var action = RefreshPostsAction(category: "Itaperuna");
              store.dispatch(action);
              return action.completer.future;
            },
          ),
        );
      },
    );
  }

  Widget loadButton() {
    return StoreBuilder(builder: (context, Store<RootState> store) {
      var isLoading = store.state.posts.isLoading;

      return Container(
        margin: EdgeInsets.all(15.0),
        child: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : RaisedButton(
          onPressed: () {
            store.dispatch(addPosts("Itaperuna"));
          },
          child: Text('Carregar Mais',
              style: TextStyle(color: Colors.white)),
          color: Colors.green,
        ),
      );
    });
  }

}
