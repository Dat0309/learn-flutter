import 'package:covid19_app/core/consts.dart';
import 'package:covid19_app/core/flutter_icons.dart';
import 'package:covid19_app/page/statistics_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                Image.asset("assets/images/virus2.png"),
                _buildHeader(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Symptoms of ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: "COVID 19",
                        style: TextStyle(
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      _buildSymptomItem("assets/images/1.png", "Fever"),
                      _buildSymptomItem("assets/images/2.png", "Dry Cought"),
                      _buildSymptomItem("assets/images/3.png", "Headache"),
                      _buildSymptomItem("assets/images/4.png", "Breathless"),
                      _buildSymptomItem("assets/images/1.png", "Fever"),
                      _buildSymptomItem("assets/images/2.png", "Dry Cought"),
                      _buildSymptomItem("assets/images/3.png", "Headache"),
                      _buildSymptomItem("assets/images/4.png", "Breathless"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    "Prevention",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      _buildPrevention(
                          "assets/images/a10.png", "WASH", "hands often"),
                      _buildPrevention(
                          "assets/images/a4.png", "COVER", "your cough"),
                      _buildPrevention(
                          "assets/images/a6.png", "ALWAYS", "clean"),
                      _buildPrevention("assets/images/a9.png", "USE", "mask"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => StatisticPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/map.png"),
                        SizedBox(
                          width: 25,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "CASES\n",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: "Overview Woldwide\n",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: "21.119.594 confirmed",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomItem(String path, String text) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.mainColor.withOpacity(.1),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(
            path,
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPrevention(String path, String text1, String text2) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Image.asset(
                path,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    text: "$text1\n",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "COVID 19",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Coronavirus Relief Fund",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "to this fund will help to stop the virus spread and give\ncomunitiseson the font lines.",
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "DONATE NOW",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "EMERGENCY",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ),
      ],
    );
  }
}
