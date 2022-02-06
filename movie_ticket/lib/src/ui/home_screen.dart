import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ticket/src/model/person.dart';
import 'package:movie_ticket/src/service/api_service.dart';
import 'package:movie_ticket/src/ui/movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=fdf1aa06f4acd57d8a35bb8ec5973c0b';
  List<Movie> movies = List<Movie>.empty(growable: true);
  List<Person> persons = List<Person>.empty(growable: true);

  getTrendingMovie() async {
    await http
        .get(
      Uri.parse("$baseUrl/movie/now_playing?$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (movies.length > 0) movies.clear();
      // jsonData["results"].forEach((element) {
      //   Movie movie = Movie.fromJson(element);
      //   movies.add(movie);

      var movieList = jsonData['results'] as List;
      movies = movieList.map((e) => Movie.fromJson(e)).toList();
      print('movies ${movies.length}');
      // });
      setState(() {});
    });
  }

  getTrendingPerson() async {
    await http
        .get(
      Uri.parse('$baseUrl/trending/person/week?$apiKey'),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (persons.length > 0) persons.clear();

      var personList = jsonData['results'] as List;
      persons = personList.map((e) => Person.fromJson(e)).toList();
      print('persons ${persons.length}');
      setState(() {});
    });
  }

  @override
  void initState() {
    getTrendingMovie();
    getTrendingPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black45,
        ),
        title: Text(
          'Movie Ticket'.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'muli',
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          print('carous Movie ${movies.length}');
                          Movie movie = movies[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(),
                                ),
                              );
                            },
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Platform.isAndroid
                                            ? CircularProgressIndicator()
                                            : CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_not_found.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 15,
                                    left: 15,
                                  ),
                                  child: Text(
                                    movie.title.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'muli',
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 8),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Diễn viên được quan tâm trong tuần'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                fontFamily: 'muli',
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 110,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        print('list person ${persons[0]}')
                                        Person person = persons[index];
                                        return Container(
                                          child: Column(
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                elevation: 3,
                                                child: ClipRRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://image.tmdb.org/t/p/w200${person.profilePath}',
                                                    imageBuilder:
                                                        (context, imgProvier) {
                                                      return Container(
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                100),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: imgProvier,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      width: 80,
                                                      height: 80,
                                                      child: Center(
                                                        child: Platform
                                                                .isAndroid
                                                            ? CircularProgressIndicator()
                                                            : CupertinoActivityIndicator(),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/img_not_found.jpg'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Center(
                                                  child: Text(
                                                    person.name.toUpperCase(),
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontFamily: 'muli',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Center(
                                                  child: Text(
                                                    person.knowForDepartment
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontFamily: 'muli',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          VerticalDivider(
                                            color: Colors.transparent,
                                            width: 5,
                                          ),
                                      itemCount: persons.length),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
