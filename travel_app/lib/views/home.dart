import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/data.dart';
import 'package:travel_app/models/country.dart';
import 'package:travel_app/models/popular_tours.dart';
import 'package:travel_app/views/detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PopularTour> listPopularTours = List<PopularTour>.empty(growable: true);
  List<Country> countrys = List<Country>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    countrys = getCountrys();
    listPopularTours = getPopularTours();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          padding: EdgeInsets.all(7),
          child: Image.asset(
            "assets/menu.png",
            height: 20,
            width: 20,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 30,
            ),
            Text(
              "DiscountTour",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tìm kiếm Tour hàng đầu",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Quốc gia",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                  itemCount: countrys.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CountryListTile(
                        countrys[index].countryName,
                        countrys[index].label,
                        countrys[index].noOfTours,
                        countrys[index].rating,
                        countrys[index].imgUrl);
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Tour Phổ biến",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: getPopularTours().length,
                itemBuilder: (context, index) {
                  return PopularTours(
                      listPopularTours[index].imgUrl,
                      listPopularTours[index].title,
                      listPopularTours[index].desc,
                      listPopularTours[index].price,
                      listPopularTours[index].rating);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PopularTours extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;

  PopularTours(this.imgUrl, this.title, this.desc, this.price, this.rating);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(
                      imgUrl,
                      rating,
                      title,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Color(0xffE9F4F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 90,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4E6059),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4E6059),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4E6059),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, right: 8),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xff139157),
              ),
              child: Column(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryListTile extends StatelessWidget {
  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  final String imgUrl;

  CountryListTile(
      this.countryName, this.label, this.noOfTours, this.rating, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 220,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 8),
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white38,
                      ),
                      child: Text(
                        label,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              countryName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${noOfTours} Tours",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
