import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeAppBar extends SliverPersistentHeaderDelegate {
  final double minHeight = 70.0;
  final double maxHeight = 100.0;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      margin: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[900],
          image: DecorationImage(
            image: AssetImage('bg-ita.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          top: true,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Itaperuna "),
                          TextSpan(
                            text: "Noticias",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(HomeAppBar oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
