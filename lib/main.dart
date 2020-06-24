import 'package:flutter/material.dart';
import 'package:photoviewer/MyApp.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text (
          'Devsteam.mobi'
        ),
      ),
      body: MyApp(),
    )
  )
  );
}
