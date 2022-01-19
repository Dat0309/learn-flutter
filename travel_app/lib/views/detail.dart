import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/data.dart';
import 'package:travel_app/models/country.dart';

class Detail extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;

  Detail(
      @required this.imgUrl, @required this.rating, @required this.placeName);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<Country> countrys = List<Country>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    countrys = getCountrys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Image.asset(
                                "assets/heart.png",
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Koh Chang Tai, Thailand",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar(widget.rating),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${widget.rating}",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureTile(
                    Icon(Icons.wifi, color: Color(0xff5A6C64)),
                    "Free Wi-Fi",
                  ),
                  FeatureTile(
                    Icon(Icons.beach_access, color: Color(0xff5A6C64)),
                    "Free Wi-Fi",
                  ),
                  FeatureTile(
                    Icon(Icons.card_travel, color: Color(0xff5A6C64)),
                    "Free Wi-Fi",
                  ),
                  FeatureTile(
                    Icon(Icons.local_drink, color: Color(0xff5A6C64)),
                    "Free Wi-Fi",
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailsCard("assets/card1.png", "Bokking", "8.2/10", 4.5),
                    DetailsCard("assets/card2.png", "HotelCar", "9.0/10", 4.9),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut scelerisque arcu quis eros auctor, eu dapibus urna congue. Nunc nisi diam, semper maximus risus dignissim, semper maximus nibh. Sed finibus ipsum eu erat finibus efficitur.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff879095),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                margin: EdgeInsets.only(right: 24, left: 24),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20),
                  itemCount: countrys.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ImageListTile(
                      countrys[index].imgUrl,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;

  ImageListTile(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String assetImg;
  final String title;
  final String noOfReviews;
  final double rating;

  DetailsCard(this.assetImg, this.title, this.noOfReviews, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffE9F4F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffD5E6F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  this.assetImg,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5A6C64),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    noOfReviews,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5A6C64),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final Icon icon;
  final String label;

  FeatureTile(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff5A6C64).withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: icon,
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff5A6C64),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;

  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: rating >= 1 ? Colors.white70 : Colors.white30,
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.star,
            color: rating >= 2 ? Colors.white70 : Colors.white30,
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.star,
            color: rating >= 3 ? Colors.white70 : Colors.white30,
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.star,
            color: rating >= 4 ? Colors.white70 : Colors.white30,
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.star,
            color: rating >= 5 ? Colors.white70 : Colors.white30,
          ),
        ],
      ),
    );
  }
}
