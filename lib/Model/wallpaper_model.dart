class WallpaperModel {
  String photographer;
  String photoGrapherUrl;
  int photoGrapherId;
  SrcModel src;

  WallpaperModel(
      {this.photographer, this.photoGrapherId, this.photoGrapherUrl, this.src});
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData["src"]),
        photoGrapherUrl: jsonData["photographer_url"],
        photoGrapherId: jsonData["photographer_id"],
        photographer: jsonData["photographer"]);
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.portrait, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        portrait: jsonData["portrait"],
        original: jsonData["original"],
        small: jsonData["small"]);
  }
}
