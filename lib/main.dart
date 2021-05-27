import 'package:flutter/material.dart';
import 'package:wallpaper_app/Views/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(
        fontFamily: 'Blinker',
        backgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
