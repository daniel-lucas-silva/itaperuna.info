import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

import '../store/root_state.dart';

class PostScreen extends StatelessWidget {
  final id;

  PostScreen(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<RootState, dynamic>(converter: (store) {
      return store.state.post.items
          .where((item) => item['id'] == id)
          .toList()[0];
    }, builder: (context, post) {
      return Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: post['images'] != null
                  ? Image.network(
                      post['images'][0]['url'],
                      fit: BoxFit.cover,
                    )
                  : Container(),
              title: Container(
                child: Text(post['title'],
                    style: TextStyle(
                      fontSize: 10.0,
                    )),
                width: MediaQuery.of(context).size.width - 140.0,
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: MarkdownBody(
                    data: html2md.convert(post['content']),
                  )))
        ],
      ));
    });
  }
}
