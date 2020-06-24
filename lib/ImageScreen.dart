import 'package:flutter/material.dart';
import 'package:photoviewer/ImageData.dart';

class ImageScreen extends StatelessWidget {
  final ImageData imageData;
  ImageScreen(this.imageData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(imageData.altDescription,
        maxLines: 2,)),
      body: Center(
          child: Image.network(imageData.urls.regular)
      ),
    );
  }
}
