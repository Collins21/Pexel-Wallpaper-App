import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _save();
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.imgUrl,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1B1B).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54),
                          borderRadius: BorderRadius.circular(28),
                          gradient: LinearGradient(
                              colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                      child: Column(
                        children: [
                          Text("Download Image",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70)),
                          Text(
                            "Image will be saved in your gallery",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _save() async {
    _requestPermission();
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }
}
