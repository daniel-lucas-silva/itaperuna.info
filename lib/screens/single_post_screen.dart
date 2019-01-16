import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../store/root_state.dart';

class SinglePostScreen extends StatelessWidget {
  final id;

  SinglePostScreen(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<RootState, dynamic>(converter: (store) {
      return store.state.recent.items
          .where((item) => item['id'] == id)
          .toList()[0];
    }, builder: (context, post) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text(
                'Itaperuna',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
              Container(
                width: 1.0,
              ),
              Text(
                'Noticias',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '''${post['title']}''',
                    style: TextStyle(color: Colors.black87, fontSize: 30.0),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        timeago.format(
                          DateTime.parse(post['published']),
                          locale: 'pt_BR',
                        ),
                        style: TextStyle(color: Colors.black87),
                      ),
                      Container(
                        width: 3.0,
                      ),
                      Text(
                        post['author']['displayName'],
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: MarkdownBody(
                data: html2md.convert(post['content'],
                  styleOptions: {'headingStyle': 'atx'},),
              ),
            )
          ],
        ),
      );
    });
  }
}
