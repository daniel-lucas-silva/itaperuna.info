import 'package:flutter/material.dart';

class FeaturedPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.8,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            TabBarView(
            physics: ScrollPhysics(),
              children: [
                Icon(Icons.directions_car),
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
  }
}

