import 'package:flutter/material.dart';
import 'package:wallpaper_app/Model/wallpaper_model.dart';
import 'package:wallpaper_app/Views/imageview.dart';

Widget brandName() {
  return RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          children: <TextSpan>[
        TextSpan(text: 'wallpaper', style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue))
      ]));
}

Widget wallpapersList(List<WallpaperModel> wallpapers, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(
                          imgUrl: wallpaper.src.portrait,
                        )));
          },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: GridTile(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                  child: Image.network(
                wallpaper.src.portrait,
                fit: BoxFit.cover,
              )),
            )),
          ),
        );
      }).toList(),
    ),
  );
}
