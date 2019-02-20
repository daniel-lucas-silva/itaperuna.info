import 'package:flutter/material.dart';
import 'package:itaperuna/blocs/bloc_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeaturedPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = BlocProvider.of(context).posts;

    posts.fetchFeatured();

    return StreamBuilder(
      stream: posts.featured,
      builder: (context, snapshot) {
        return DefaultTabController(
          length: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            color: Colors.red,
            child: !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: <Widget>[
                      TabBarView(
                        physics: ScrollPhysics(),
                        children: [
                          _card(image: snapshot.data[1]['images'][0]['url']),
                          Icon(Icons.directions_transit),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: TabPageSelector(
                            color: Colors.white,
                            selectedColor: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }

  _card({image, title}) {
    return Stack(
      children: <Widget>[
        new CachedNetworkImage(
          imageUrl: "$image",
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
