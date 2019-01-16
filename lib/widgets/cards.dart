import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../screens/single_post_screen.dart';

class NormalCard extends StatelessWidget {

  final String id;
  final Map<dynamic, dynamic> author;
  final List<dynamic> images;
  final String title;
  final String date;

  NormalCard({
    this.id,
    this.author,
    this.images,
    this.title,
    this.date,
  });

  static NormalCard fromJSON(Map<String, dynamic> json) {
    return NormalCard(
      id: json['id'],
      author: json['author'],
      images: json['images'],
      title: json['title'],
      date: json['published'],
    );
  }

  postScreen(id) {
    return MaterialPageRoute(builder: (context) => SinglePostScreen(id));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, postScreen(id)),
      child: Card(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: width * 0.6,
              decoration: BoxDecoration(
                // color: Colors.red,
                  image: DecorationImage(
                    image: images != null ? NetworkImage(images[0]['url']) : AssetImage('no-image.png'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(13.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '''$title''',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16.5,
                    ),
                  ),
                  Container(
                    height: 7.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        timeago.format(
                          DateTime.parse(date),
                          locale: 'pt_BR_short',),
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                      Container(
                        width: 3.0,
                      ),
                      Text(
                        author['displayName'],
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {

  final String id;
  final Map<dynamic, dynamic> author;
  final List<dynamic> images;
  final String title;
  final String date;

  SmallCard({
    this.id,
    this.author,
    this.images,
    this.title,
    this.date,
  });

  static SmallCard fromJSON(Map<String, dynamic> json) {
    return SmallCard(
      id: json['id'],
      author: json['author'],
      images: json['images'],
      title: json['title'],
      date: json['published'],
    );
  }

  postScreen(id) {
    return MaterialPageRoute(builder: (context) => SinglePostScreen(id));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, postScreen(id)),
      child: Container(
        height: 80.0,
        margin: EdgeInsets.only(bottom: 5.0),
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                      image: images != null ? NetworkImage(images[0]['url']) : AssetImage('no-image.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '''$title''',
                        maxLines: 2,
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        height: 7.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            timeago.format(
                                DateTime.parse(date),
                                locale: 'pt_BR_short'),
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                          Container(
                            width: 3.0,
                          ),
                          Text(
                            author['displayName'],
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {

  final String id;
  final Map<dynamic, dynamic> author;
  final List<dynamic> images;
  final String title;
  final String date;

  BigCard({
    this.id,
    this.author,
    this.images,
    this.title,
    this.date,
  });

  static BigCard fromJSON(Map<String, dynamic> json) {
    return BigCard(
      id: json['id'],
      author: json['author'],
      images: json['images'],
      title: json['title'],
      date: json['published'],
    );
  }

  postScreen(id) {
    return MaterialPageRoute(builder: (context) => SinglePostScreen(id));
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, postScreen(id)),
      child: Container(
        height: 250.0,
        margin: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: images != null ? NetworkImage(images[0]['url']) : AssetImage('no-image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    child: Chip(
                      label: Text('Destaques'),
                      backgroundColor: Colors.green,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    right: 10.0,
                    top: 10.0,
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  // width: width,
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      colors: [
                        Color(0x00000000),
                        Colors.black87,
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '''$title''',
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Container(
                        height: 2.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            timeago.format(
                              DateTime.parse(date),
                              locale: 'pt_BR_short',),
                            style: TextStyle(color: Colors.white70),
                          ),
                          Container(
                            width: 3.0,
                          ),
                          Text(
                            author['displayName'],
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlackCard extends StatelessWidget {

  final String id;
  final Map<dynamic, dynamic> author;
  final List<dynamic> images;
  final String title;
  final String date;

  BlackCard({
    this.id,
    this.author,
    this.images,
    this.title,
    this.date,
  });

  static BlackCard fromJSON(Map<String, dynamic> json) {
    return BlackCard(
      id: json['id'],
      author: json['author'],
      images: json['images'],
      title: json['title'],
      date: json['published'],
    );
  }

  postScreen(id) {
    return MaterialPageRoute(builder: (context) => SinglePostScreen(id));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, postScreen(id)),
      child: Container(
        height: 180.0,
        width: width,
        margin: EdgeInsets.only(bottom: 5.0),
        child: Card(
          color: Colors.black,
          child: Row(
            children: <Widget>[
              Container(
                height: 180.0,
                width: 130.0,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                      image: images != null ? NetworkImage(images[0]['url']) : AssetImage('no-image.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '''$title''',
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                        ),
                      ),
                      Container(
                        height: 7.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                timeago.format(
                                  DateTime.parse(date),
                                  locale: 'pt_BR_short',),
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 3.0,
                              ),
                              Text(
                                author['displayName'],
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 11.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
