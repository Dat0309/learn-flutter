import 'dart:ffi';

class Movie {
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final int voteCount;
  final String voteAverage;

  late String error;

  Movie(
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  factory Movie.fromJson(dynamic json) {
    return Movie(
      json['backdrop_path'],
      json['id'],
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['release_date'],
      json['title'],
      json['video'],
      json['vote_average'].toString(),
      json['vote_count'],
    );
  }
}
