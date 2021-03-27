import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class LoremPicsum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lorem Picsum",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lorem Picsum"),
        ),
        body: Container(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/800')
        ),
      ),
    );
  }
}
