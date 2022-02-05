import 'package:equatable/equatable.dart';
import 'package:moviedb_app/src/model/genre.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GenreLoading extends GenreState {}

class GenreError extends GenreState {}

class GenreLoaded extends GenreState {
  final List<Genre> genres;
  const GenreLoaded(this.genres);

  @override
  // TODO: implement props
  List<Object?> get props => [genres];
}
