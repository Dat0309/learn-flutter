import 'package:equatable/equatable.dart';
import 'package:moviedb_app/src/model/movie_detail.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail detail;
  const MovieDetailLoaded(this.detail);

  @override
  // TODO: implement props
  List<Object?> get props => [detail];
}
