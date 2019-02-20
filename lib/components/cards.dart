import 'package:flutter/material.dart';

class Cards  {
  static simple({ category, title, author, date, onPress }) {
    return Card(
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 85.0,
              height: 100.0,
              color: Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "CATEGORY",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                        children: [
                          TextSpan(text: "por "),
                          TextSpan(text: "Daniel Lucas"),
                          TextSpan(text: " as "),
                          TextSpan(text: "12:00"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}