import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photoviewer/ImageData.dart';
import 'package:photoviewer/ImageScreen.dart';
import 'package:photoviewer/api_key.dart';



class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<ImageData> imageList = [];

  @override
  Widget build(BuildContext context) {
    _loadImage();
    return Container(
        color: Colors.black12,
        child: ListView(
          children: _buildList(),
          )
    );
  }

  //Load JSON from API and create list of ImageData objects
  _loadImage() async {
    ApiKey appID = ApiKey();
    final response = await http.get(
        'https://api.unsplash.com/photos/?page=1&per_page=30&client_id=' + appID.key());
    if (response.statusCode == 200) {
      setState(() {
        imageList = imageDataFromJson(response.body);
      });
    }
  }

  //Building list of images with descriptions
  List<Widget> _buildList() {
    return imageList.map((ImageData data) =>
       ListTile(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(data))),
          subtitle: Text(data.user.name),
          title: Text(
              data.description,
              maxLines: 2,
              ),
          leading: Image.network(data.urls.thumb),
       )
    ).toList();
  }

}
