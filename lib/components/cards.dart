import 'package:flutter/material.dart';

class Cards {
  static simple({image, category, title, author, date, onPress}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        height: 105.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 90.0,
              height: 105.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$category",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "$title",
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 13.0,
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
