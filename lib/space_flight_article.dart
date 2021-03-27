import 'package:flutter/material.dart';
import 'package:hello_flutter/space_flight.dart';
import 'package:transparent_image/transparent_image.dart';

class SpaceFlightArticle extends StatelessWidget {
  final SpaceFlightNewsModel article;

  const SpaceFlightArticle({this.article}) : assert(article != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Space Flight Article",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Space Flight Article"),
        ),
        body: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              height: 300,
              placeholder: kTransparentImage,
              image: article.imageUrl
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                "Published at ${article.publishedAt}",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(article.title,
                style: TextStyle(fontSize: 24, color: Colors.black),
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                article.sumary,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ),
          ],
        )
      ),
    );
  }

}