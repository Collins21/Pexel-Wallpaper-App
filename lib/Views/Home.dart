import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Data/Data.dart';
import 'package:wallpaper_app/Model/Categorie_model.dart';
import 'package:wallpaper_app/Model/wallpaper_model.dart';
import 'package:wallpaper_app/Views/categorie.dart';
import 'package:wallpaper_app/widgets/widgets.dart';

import 'Search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int imagesToload = 30;

class _HomeState extends State<Home> {
  List<CatergorieModel> categorie = [];
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = new TextEditingController();

  Uri _url =
      Uri.parse("https://api.pexels.com/v1/curated?per_page=$imagesToload");
  trendingImages() async {
    await http.get(_url, headers: {"Authorization": apiKey}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
      });
      setState(() {});
    });
  }

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    trendingImages();
    categorie = getCategories();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        imagesToload = imagesToload + 30;
        trendingImages();
      }
    });
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
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery: searchController.text,
                                    )));
                      },
                      child: Container(child: Icon(Icons.search)))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  itemCount: categorie.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                      title: categorie[index].categorieName,
                      imgUrl: categorie[index].imgUrl,
                    );
                  }),
            ),
            wallpapersList(wallpapers, context)
          ]),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;
  CategorieTile({@required this.imgUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categorie(
                      categorieName: title.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgUrl,
                  height: 50,
                  width: 100,
                  fit: BoxFit.cover,
                )),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
