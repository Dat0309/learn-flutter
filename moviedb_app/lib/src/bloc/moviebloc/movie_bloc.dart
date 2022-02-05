import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_app/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:moviedb_app/src/bloc/moviebloc/movie_bloc_state.dart';
import 'package:moviedb_app/src/model/movie.dart';
import 'package:moviedb_app/src/service/api_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStartedToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStartedToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movies;
      if (movieId == 0) {
        movies = await service.getNowPlayingMovie();
      } else {
        movies = await service.getMovieByGenre(movieId);
      }

      yield MovieLoaded(movies);
    } on Exception catch (e) {
      print(e);
      yield MovieError();
    }
  }
}
