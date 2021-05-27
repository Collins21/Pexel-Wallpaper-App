import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/Data/Data.dart';
import 'package:wallpaper_app/Model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/widgets.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({@required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = [];

  getSeachedImages(String query) async {
    Uri _url =
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20");
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
    getSeachedImages(widget.searchQuery);
    searchController.text = widget.searchQuery;
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
              children: <Widget>[
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
                              hintText: 'Search wallpaper',
                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            getSeachedImages(searchController.text);
                          },
                          child: Container(child: Icon(Icons.search)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                wallpapersList(wallpapers, context)
              ],
            ),
          ),
        ));
  }
}
