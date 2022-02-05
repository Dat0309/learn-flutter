import 'package:equatable/equatable.dart';
import 'package:moviedb_app/src/model/movie.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  const MovieLoaded(this.movies);

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class MovieError extends MovieState {}
