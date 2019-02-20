import 'package:flutter/material.dart';
import 'package:itaperuna/components/cards.dart';
import 'package:itaperuna/components/featured_posts.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ScrollPhysics(),
      key: PageStorageKey<String>("first_tab"),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: FeaturedPosts(),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Cards.simple();
              },
            ),
          ),
        ),
      ],
    );
  }
}
