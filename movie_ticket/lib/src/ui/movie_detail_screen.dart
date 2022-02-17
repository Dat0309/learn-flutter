import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/src/model/cast_list.dart';
import 'package:movie_ticket/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ticket/src/model/movie_detail.dart';
import 'package:movie_ticket/src/model/movie_image.dart';
import 'package:movie_ticket/src/model/screen_shot.dart';
import 'package:movie_ticket/src/ui/buy_ticket_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen(this.movie);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=fdf1aa06f4acd57d8a35bb8ec5973c0b';
  List<Cast> casts = List<Cast>.empty(growable: true);
  MovieImage? movieImage;
  MovieDetail? movieDetail;
  var youtubeId;

  Future getMovieDetail(int movieId) async {
    await http
        .get(
      Uri.parse('$baseUrl/movie/$movieId?$apiKey'),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      movieDetail = MovieDetail.fromJson(jsonData);

      getYoutubeId(movieId);
      getCastList(movieId);
      getMovieImage(movieId);
      movieDetail?.trailerId = youtubeId;
      movieDetail?.movieImage = movieImage as MovieImage;
      movieDetail?.casts = casts;
    });
  }

  Future getCastList(int movieId) async {
    await http
        .get(
      Uri.parse("$baseUrl/movie/$movieId/credits?$apiKey"),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      if (casts.length > 0) casts.clear();

      var castList = jsonData['cast'] as List;
      casts = castList.map((e) => Cast.fromJson(e)).toList();
      print('cast ${casts.length}');
      // });
      setState(() {});
    });
  }

  Future getMovieImage(int movieId) async {
    await http
        .get(
      Uri.parse('$baseUrl/movie/$movieId/images?$apiKey'),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      movieImage = MovieImage.fromJson(jsonData);
      print('image ${movieImage?.backdrops.length}');
    });
  }

  Future getYoutubeId(int id) async {
    await http
        .get(
      Uri.parse('$baseUrl/movie/$id/videos?$apiKey'),
    )
        .then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      youtubeId = jsonData['results'][0]['key'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getMovieDetail(widget.movie.id);
    getCastList(widget.movie.id);
    getMovieImage(widget.movie.id);
    getYoutubeId(widget.movie.id);
    super.initState();
    print('initstate ${movieDetail?.casts.length}');
    print('innitState ${movieDetail?.movieImage.backdrops.length}');
  }

  @override
  Widget build(BuildContext context) {
    if (movieDetail != null) {
      return Scaffold(
        body: Stack(
          children: [
            ClipPath(
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original/${movieDetail?.backdropPath}',
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_not_found.jpg'),
                      ),
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 120),
                  child: GestureDetector(
                    onTap: () async {
                      final youtubeUrl =
                          'https://www.youtube.com/embed/${movieDetail?.trailerId}';
                      if (await canLaunch(youtubeUrl)) {
                        await launch(youtubeUrl);
                      }
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            color: Colors.yellow,
                            size: 65,
                          ),
                          Text(
                            movieDetail?.title as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'muli',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 35,
                        child: Text(
                          movieDetail?.overview as String,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontFamily: 'muli'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ngày chiếu'.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'muli',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                movieDetail?.releaseDate as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: Colors.red[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thời lượng'.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'muli',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                movieDetail?.runtime as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: Colors.red[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Giá vé'.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: 'muli',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                movieDetail?.budget as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: Colors.red[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Screenshots'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'muli',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                      ),
                      Container(
                        height: 155,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (movieDetail?.movieImage != null) {
                                Screenshot image = movieDetail
                                    ?.movieImage.backdrops[index] as Screenshot;
                                print(image.imagePath);
                                return Container(
                                  child: Card(
                                    elevation: 3,
                                    borderOnForeground: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) => Center(
                                          child: Platform.isAndroid
                                              ? CircularProgressIndicator()
                                              : CupertinoActivityIndicator(),
                                        ),
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/w500${image.imagePath}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                            separatorBuilder: (context, index) =>
                                VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                            itemCount: 10),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Positioned(
                        left: 60,
                        right: 60,
                        bottom: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BuyTicketPage(
                                    titleMovie: widget.movie.title,
                                    imgMovie: widget.movie.backdropPath),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              'Mua vé',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'muli',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
