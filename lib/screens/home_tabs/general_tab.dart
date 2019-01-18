import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../store/root_state.dart';
import '../../store/app/app_actions.dart';
import '../../store/recent/recent_actions.dart';
import '../single_post_screen.dart';
import '../../widgets/cards.dart';

class GeneralTab extends StatefulWidget {
  @override
  createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  bool isLoading = false;

  void loadMore() {
    print('FIM');
  }

  postScreen(id) {
    return MaterialPageRoute(builder: (context) => SinglePostScreen(id));
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
       onInit: (store) {
         store.dispatch(fetchHomePosts(context));
       },
//      rebuildOnChange: true,
      builder: (context, Store<RootState> store) {
        var featuresPosts = store.state.app.features;
        var regionPosts = store.state.app.region;
        var recentPosts = store.state.recent.items;

        return ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            features(context, featuresPosts),
            title('Regiao'),
            region(context, regionPosts),
            title('Recentes'),
            recent(context, recentPosts),
            loadButton(),
          ],
        );
      },
    );
  }

  Widget loadButton() {
    return StoreBuilder(builder: (context, Store<RootState> store) {
      var isLoading = store.state.recent.isLoading;

      return Container(
        margin: EdgeInsets.all(15.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RaisedButton(
                onPressed: () {
                  store.dispatch(addRecent(context));
                },
                child: Text('Carregar Mais',
                    style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
      );
    });
  }

  Widget title(name) {
    return Chip(
      label: Text(
        name,
        style: TextStyle(fontSize: 17.0),
      ),
      backgroundColor: Colors.green,
      labelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
    );
  }

  Widget recent(context, posts) {
    double width = MediaQuery.of(context).size.width;
    return posts == null
        ? Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            width: width,
            child: Column(
              children: posts.map<Widget>((post) {
                return NormalCard(post);
              }).toList(),
            ),
          );
  }

  Widget region(context, posts) {
    double width = MediaQuery.of(context).size.width;
    var x = 0;
    return posts == null
        ? Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            width: width,
            child: Column(
              children: posts.map<Widget>((post) {
                var card = x == 0
                    ? BlackCard(post)
                    : SmallCard(post);
                x++;
                return card;
              }).toList(),
            ),
          );
  }

  Widget features(context, posts) {
    double width = MediaQuery.of(context).size.width;
    var x = 0;
    return posts == null
        ? Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            width: width,
            child: Column(
              children: posts.map<Widget>((post) {
                var card =
                    x == 0 ? BigCard(post) : SmallCard(post);
                x++;
                return card;
              }).toList(),
            ),
          );
  }
}
