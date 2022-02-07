import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/model/genre.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ticket/src/model/movie.dart';
import 'package:movie_ticket/src/ui/movie_detail_screen.dart';

class BuildWidgetCategory extends StatefulWidget {
  final int selectedGenre;
  const BuildWidgetCategory({Key? key, this.selectedGenre = 28})
      : super(key: key);

  @override
  _BuildWidgetCategoryState createState() => _BuildWidgetCategoryState();
}

class _BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  late int selectedGenre;
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=fdf1aa06f4acd57d8a35bb8ec5973c0b';
  List<Genre> genres = List<Genre>.empty(growable: true);
  List<Movie> movies = List<Movie>.empty(growable: true);
  List<Movie> topRates = List<Movie>.empty(growable: true);
  List<Movie> upComings = List<Movie>.empty(growable: true);

  Future getGenres() async {
    await http
        .get(
      Uri.parse("$baseUrl/genre/movie/list?$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (genres.length > 0) genres.clear();
      // jsonData["results"].forEach((element) {
      //   Movie movie = Movie.fromJson(element);
      //   movies.add(movie);

      var movieList = jsonData['genres'] as List;
      genres = movieList.map((e) => Genre.fromJson(e)).toList();
      print('genres ${genres.length}');
      // });
      setState(() {});
    });
  }

  Future getTrendingMovie() async {
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
      print('movies now ${movies.length}');
      // });
      setState(() {});
    });
  }

  Future getMovieByGenre(int genreId) async {
    await http
        .get(
      Uri.parse("$baseUrl/discover/movie?with_genres=$genreId&$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (movies.length > 0) movies.clear();
      // jsonData["results"].forEach((element) {
      //   Movie movie = Movie.fromJson(element);
      //   movies.add(movie);

      var movieList = jsonData['results'] as List;
      movies = movieList.map((e) => Movie.fromJson(e)).toList();
      print('movies now ${movies.length}');
      // });
      setState(() {});
    });
  }

  Future getTopRateMovie() async {
    await http
        .get(
      Uri.parse("$baseUrl/movie/top_rated?$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (topRates.length > 0) movies.clear();
      // jsonData["results"].forEach((element) {
      //   Movie movie = Movie.fromJson(element);
      //   movies.add(movie);

      var movieList = jsonData['results'] as List;
      topRates = movieList.map((e) => Movie.fromJson(e)).toList();
      print('movies now ${topRates.length}');
      // });
      setState(() {});
    });
  }

  Future getUpComingMovie() async {
    await http
        .get(
      Uri.parse("$baseUrl/movie/upcoming?$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (upComings.length > 0) movies.clear();
      // jsonData["results"].forEach((element) {
      //   Movie movie = Movie.fromJson(element);
      //   movies.add(movie);

      var movieList = jsonData['results'] as List;
      upComings = movieList.map((e) => Movie.fromJson(e)).toList();
      print('movies upcoming ${upComings.length}');
      // });
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getGenres();
    getTrendingMovie();
    getTopRateMovie();
    getUpComingMovie();
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (genres.isNotEmpty) {
                  Genre genre = genres[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Genre genre = genres[index];
                            selectedGenre = genre.id;
                            setState(() {
                              getMovieByGenre(selectedGenre);
                            });
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black45,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: (genre.id == selectedGenre)
                                ? Colors.black45
                                : Colors.white,
                          ),
                          child: Text(
                            genre.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: (genre.id == selectedGenre)
                                  ? Colors.white
                                  : Colors.black45,
                              fontFamily: 'muli',
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (BuildContext context, int index) =>
                  VerticalDivider(
                    color: Colors.transparent,
                    width: 5,
                  ),
              itemCount: genres.length),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            'Phim đang chiếu'.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'muli',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (movies.isNotEmpty) {
                  Movie movie = movies[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(movie),
                            ),
                          );
                        },
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                            imageBuilder: (context, imgProvider) {
                              return Container(
                                width: 180,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                    image: imgProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) => Container(
                              width: 180,
                              height: 250,
                              child: Center(
                                child: Platform.isAndroid
                                    ? CircularProgressIndicator()
                                    : CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 180,
                              height: 250,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          movie.title.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Text(
                              movie.voteAverage,
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 15,
                  ),
              itemCount: movies.length),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            'Phim đánh giá cao'.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'muli',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (topRates.isNotEmpty) {
                  Movie movie = topRates[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(movie),
                            ),
                          );
                        },
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                            imageBuilder: (context, imgProvider) {
                              return Container(
                                width: 180,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                    image: imgProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) => Container(
                              width: 180,
                              height: 250,
                              child: Center(
                                child: Platform.isAndroid
                                    ? CircularProgressIndicator()
                                    : CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 180,
                              height: 250,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          movie.title.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Text(
                              movie.voteAverage,
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 15,
                  ),
              itemCount: movies.length),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            'Phim sắp chiếu'.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'muli',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (upComings.isNotEmpty) {
                  Movie movie = upComings[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(movie),
                            ),
                          );
                        },
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                            imageBuilder: (context, imgProvider) {
                              return Container(
                                width: 180,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                    image: imgProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) => Container(
                              width: 180,
                              height: 250,
                              child: Center(
                                child: Platform.isAndroid
                                    ? CircularProgressIndicator()
                                    : CupertinoActivityIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 180,
                              height: 250,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          movie.title.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 14,
                            ),
                            Text(
                              movie.voteAverage,
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (context, index) => VerticalDivider(
                    color: Colors.transparent,
                    width: 15,
                  ),
              itemCount: movies.length),
        ),
      ],
    );
  }
}
