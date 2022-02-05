import 'package:dio/dio.dart';
import 'package:moviedb_app/src/model/cast_list.dart';
import 'package:moviedb_app/src/model/genre.dart';
import 'package:moviedb_app/src/model/movie.dart';
import 'package:moviedb_app/src/model/movie_detail.dart';
import 'package:moviedb_app/src/model/movie_image.dart';
import 'package:moviedb_app/src/model/person.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=fdf1aa06f4acd57d8a35bb8ec5973c0b';

/**
 * Lấy Danh sách phim hiện tại
 */
  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;

      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();

      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

/**
 * Lấy danh sách phim theo thể loại
 */
  Future<List<Movie>> getMovieByGenre(int movieId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;

      List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movieList;
    } catch (err, stacktrace) {
      throw Exception('Exception acc: $err with stacktrace: $stacktrace');
    }
  }

  Future<List<Genre>> getGenreList() async {
    try {
      final url = '$baseUrl/genre/movie/list?$apiKey';
      final response = await _dio.get(url);
      var genres = response.data['genres'] as List;

      List<Genre> genreList = genres.map((e) => Genre.fromJson(e)).toList();
      return genreList;
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }

  Future<List<Person>> getTrendingPerson() async {
    try {
      final url = '$baseUrl/trending/person/week?$apiKey';
      final response = await _dio.get(url);
      var persons = response.data['results'] as List;

      List<Person> personList = persons.map((e) => Person.fromJson(e)).toList();
      return personList;
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }

  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      final url = '$baseUrl/movie/$movieId?$apiKey';
      final response = await _dio.get(url);
      MovieDetail movieDetail = MovieDetail.fromJson(response.data);

      movieDetail.trailerId = await getYoutubeId(movieId);
      movieDetail.movieImage = await getMovieImage(movieId);
      movieDetail.casts = await getCastList(movieId);

      return movieDetail;
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final url = '$baseUrl/movie/$id/videos?$apiKey';
      final response = await _dio.get(url);
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }

  Future<MovieImage> getMovieImage(int movieId) async {
    try {
      final url = '$baseUrl/movie/$movieId/images?$apiKey';
      final response = await _dio.get(url);
      return MovieImage.fromJson(response.data);
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }

  Future<List<Cast>> getCastList(int movieId) async {
    try {
      final url = '$baseUrl/movie/$movieId/credits?$apiKey';
      final response = await _dio.get(url);
      var list = response.data['cast'] as List;

      List<Cast> castList = list.map((e) => Cast.fromJson(e)).toList();
      return castList;
    } catch (err, stack) {
      throw Exception('Exception: $err with stacktrace: $stack');
    }
  }
}
