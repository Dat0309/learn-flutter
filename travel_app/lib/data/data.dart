import 'package:travel_app/models/country.dart';
import 'package:travel_app/models/popular_tours.dart';

List<Country> getCountrys() {
  List<Country> countrys = List<Country>.empty(growable: true);
  Country country = new Country();

  country.countryName = "Thailand";
  country.label = "New";
  country.noOfTours = 18;
  country.rating = 4.5;
  country.imgUrl =
      "https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  countrys.add(country);
  country = new Country();

  country.countryName = "Malaysia";
  country.label = "Sale";
  country.noOfTours = 12;
  country.rating = 4.3;
  country.imgUrl =
      "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  countrys.add(country);
  country = new Country();

  country.countryName = "VietNam";
  country.label = "New";
  country.noOfTours = 13;
  country.rating = 4.8;
  country.imgUrl =
      "https://vietcetera.com/wp-content/uploads/2019/10/travelfeature-2000x1000.jpg";

  countrys.add(country);
  country = new Country();

  country.countryName = "Japan";
  country.label = "Sale";
  country.noOfTours = 11;
  country.rating = 4.3;
  country.imgUrl =
      "https://th.bing.com/th/id/R.e0c3f048c31b1675703efb7298f8c1f1?rik=pYG5NEuQNA%2bhbA&pid=ImgRaw&r=0";

  countrys.add(country);
  country = new Country();

  country.countryName = "China";
  country.label = "Sale";
  country.noOfTours = 20;
  country.rating = 4.3;
  country.imgUrl =
      "https://th.bing.com/th/id/OIP.FnP563DSVnEBI0-8Zvlk3AHaE8?pid=ImgDet&rs=1";

  countrys.add(country);
  country = new Country();

  country.countryName = "Korea";
  country.label = "New";
  country.noOfTours = 21;
  country.rating = 4.3;
  country.imgUrl =
      "https://th.bing.com/th/id/R.9fdadcafd708b56a7e7949cf5421df68?rik=MyTCN8rtYn%2fXQQ&pid=ImgRaw&r=0";

  countrys.add(country);
  country = new Country();

  country.countryName = "Nauy";
  country.label = "New";
  country.noOfTours = 22;
  country.rating = 4.3;
  country.imgUrl =
      "https://www.hoangviettravel.com.vn/sites/default/files/styles/style_720x540/public/hinh-anh-tour-du-lich-bac-au-dan-mach-nauy-phan-lan-nga-estonia-thuy-dien-15n14d-bay-qatar-airways.jpg?itok=P0A_Ihd6";

  countrys.add(country);
  country = new Country();

  return countrys;
}

List<PopularTour> getPopularTours() {
  List<PopularTour> popularTours = List<PopularTour>.empty(growable: true);
  PopularTour popularTour = new PopularTour();

  //1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/1658967/pexels-photo-1658967.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Cuba";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 499.99";
  popularTour.rating = 4.5;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/1477430/pexels-photo-1477430.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Dominican";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.2;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/1743165/pexels-photo-1743165.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

//1
  popularTour.imgUrl =
      "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  popularTour.title = "Thailand";
  popularTour.desc = "10 nights for two/all inclusive";
  popularTour.price = "\$ 245.50";
  popularTour.rating = 4.0;
  popularTours.add(popularTour);
  popularTour = new PopularTour();

  return popularTours;
}
