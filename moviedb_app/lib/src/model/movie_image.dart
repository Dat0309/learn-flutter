import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:moviedb_app/src/model/screen_shot.dart';

class MovieImage extends Equatable {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;

  MovieImage(this.backdrops, this.posters);

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    return MovieImage(
      (result['backdrops'] as List)
              ?.map((e) => Screenshot.fromJson(e))
              ?.toList() ??
          List.empty(),
      (result['posters'] as List)
              ?.map((e) => Screenshot.fromJson(e))
              ?.toList() ??
          List.empty(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [backdrops, posters];
}
