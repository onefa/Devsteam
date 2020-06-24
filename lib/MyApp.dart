import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
  int imagePage = 1;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    _loadImage(imagePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
          title: Text ('Devsteam.mobi'
          ),
        ),
      body: _buildList(),
    );
  }

  ListView _buildList() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: imageList == null ? 0 : imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () =>
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ImageScreen(imageList[index]))),
            subtitle: Text(imageList[index].user.name),
            title: Text(
              imageList[index].description,
              maxLines: 2,
            ),
            leading: Image.network(imageList[index].urls.thumb),
          );
        }
    );
  }

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent
        && !_scrollController.position.outOfRange) {
      _loadImage(++imagePage);
    }
  }

  _loadImage(int page) async {
    ApiKey appID = ApiKey();
    final response = await http.get(
            'https://api.unsplash.com/photos/?page='
            + page.toString()
            + '&per_page=30&client_id=' + appID.key());
    if (response.statusCode == 200) {
      setState(() {
        imageList += imageDataFromJson(response.body);
      });
    }
  }


}
