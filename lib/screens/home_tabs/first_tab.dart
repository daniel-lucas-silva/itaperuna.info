import 'package:flutter/material.dart';
import 'package:itaperuna/blocs/bloc_provider.dart';
import 'package:itaperuna/components/cards.dart';
import 'package:itaperuna/components/featured_posts.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = BlocProvider.of(context).posts;

    posts.fetch();

    return CustomScrollView(
      physics: ScrollPhysics(),
      key: PageStorageKey<String>("first_tab"),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: FeaturedPosts(),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0),
          sliver: StreamBuilder(
            stream: posts.latest,
//            initialData: [],
            builder: (context, snapshot) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (snapshot.hasError) {
                      return Text("Error!");
                    } else if (snapshot.hasData) {
                      return Cards.simple(
                        title: snapshot.data[index]['title'],
                        category: snapshot.data[index]['labels'][0],
                        image: snapshot.data[index]['images'][0]['url'],
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                  childCount: snapshot.data?.length ?? 1,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
