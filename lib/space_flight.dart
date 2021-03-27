import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_flutter/space_flight_article.dart';
import 'package:http/http.dart' as http;

Future<List<SpaceFlightNewsModel>> fetchNews() async {
  List<SpaceFlightNewsModel> news;

  final response = await http
      .get(Uri.https("spaceflightnewsapi.net", "/api/v2/articles"));
  if (response.statusCode == 200) {
    news = (json.decode(response.body) as List)
        .map((i) => SpaceFlightNewsModel.fromJson(i))
        .toList();
    return news;
  } else {
    throw Exception('Failed to load news');
  }
}

class SpaceFlightNewsModel {
  final String id;
  final String title;
  final String url;
  final String imageUrl;
  final String sumary;
  final String publishedAt;
  final String updatedAt;

  SpaceFlightNewsModel({
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.imageUrl,
    @required this.sumary,
    @required this.publishedAt,
    @required this.updatedAt,
  });

  factory SpaceFlightNewsModel.fromJson(Map<String, dynamic> json) {
    return SpaceFlightNewsModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      sumary: json['summary'],
      publishedAt: json['publishedAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

Widget _listWidget(List<SpaceFlightNewsModel> news) {
  return ListView.builder(
    itemCount: news.length,
    itemBuilder: (context, index) {
      final item = news[index];
      return ListTile(
        title: Text(item.title),
        subtitle: Text(
          item.sumary,
          maxLines: 1,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpaceFlightArticle(article: item)
          )
          );
        },
      );
    },
  );
}

class SpaceFlightNews extends StatefulWidget {
  _SpaceFlightNewsState createState() => _SpaceFlightNewsState();
}

class _SpaceFlightNewsState extends State<SpaceFlightNews> {
  Future<List<SpaceFlightNewsModel>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Space Flight News",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Space Flight News"),
          ),
          body: FutureBuilder<List<SpaceFlightNewsModel>>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _listWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(child: CircularProgressIndicator(),);
            },
          )),
    );
  }
}
