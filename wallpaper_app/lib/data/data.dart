import 'package:wallpaper_app/models/categorie.dart';

String apiKEY = "563492ad6f91700001000001552ab26f4edf40ffa215ef5a6abadf72";

List<Categorie> getCategories() {
  List<Categorie> categories = List<Categorie>.empty(growable: true);
  Categorie categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "Street Art";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "Wild Life";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "Nature";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "City";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorie.catName = "Motivation";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "Bikes";
  categories.add(categorie);
  categorie = new Categorie();

  categorie.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorie.catName = "Cars";
  categories.add(categorie);
  categorie = new Categorie();

  return categories;
}
