import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Data/Data.dart';
import 'package:wallpaper_app/Model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widgets/widgets.dart';

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({@required this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];

  getSeachedImages() async {
    Uri _url = Uri.parse(
        "https://api.pexels.com/v1/search?query=${widget.categorieName}&per_page=20");
    var responds = await http.get(_url, headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(responds.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSeachedImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers, context)
            ],
          ),
        ),
      ),
    );
  }
}
