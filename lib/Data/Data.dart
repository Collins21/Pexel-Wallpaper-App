import 'package:wallpaper_app/Model/Categorie_model.dart';

String apiKey = "[Apikey]";

List<CatergorieModel> getCategories() {
  List<CatergorieModel> categorie = [];
  CatergorieModel catergorieModel = new CatergorieModel();
//
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Nature";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  catergorieModel.categorieName = "Landscape";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/4355347/pexels-photo-4355347.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Fashion";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/52910/pexels-photo-52910.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Love";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/3109830/pexels-photo-3109830.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Abstract";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/87403/cheetah-leopard-animal-big-87403.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Wild life";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/52910/pexels-photo-52910.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Technology";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  //
  catergorieModel.imgUrl =
      "https://images.pexels.com/photos/358042/pexels-photo-358042.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catergorieModel.categorieName = "Sports";
  categorie.add(catergorieModel);
  catergorieModel = new CatergorieModel();

  return categorie;
}
