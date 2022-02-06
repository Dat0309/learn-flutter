import 'package:equatable/equatable.dart';
import 'package:movie_ticket/src/model/screen_shot.dart';

class MovieImage extends Equatable {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;

  MovieImage(this.backdrops, this.posters);

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    return MovieImage(
      (result['backdrops'] as List).map((e) => Screenshot.fromJson(e)).toList(),
      (result['posters'] as List).map((e) => Screenshot.fromJson(e)).toList(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [backdrops, posters];
}
