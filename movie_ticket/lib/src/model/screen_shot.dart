import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final String aspect;
  final String imagePath;
  final int height;
  final int width;
  final String countryCode;
  final double voteAverage;
  final int voteCount;

  Screenshot(this.aspect, this.imagePath, this.height, this.width,
      this.countryCode, this.voteAverage, this.voteCount);

  factory Screenshot.fromJson(dynamic json) {
    return Screenshot(
        json['aspect_ratio'].toString(),
        json['file_path'],
        json['height'],
        json['width'],
        json['iso_639_1'],
        json['vote_average'],
        json['vote_count']);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [aspect, imagePath, height, width, countryCode, voteAverage, voteCount];
}
