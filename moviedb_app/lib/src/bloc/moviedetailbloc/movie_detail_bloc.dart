import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_app/src/bloc/moviedetailbloc/movie_detail_event.dart';
import 'package:moviedb_app/src/bloc/moviedetailbloc/movie_detail_state.dart';
import 'package:moviedb_app/src/service/api_service.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailLoading());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is MovieDetailEventStated) {
      yield* _mapMovieEventStartedToState(event.id);
    }
  }

  Stream<MovieDetailState> _mapMovieEventStartedToState(int id) async* {
    final apiRepository = ApiService();
    yield MovieDetailLoading();
    try {
      final movieDetail = await apiRepository.getMovieDetail(id);

      yield MovieDetailLoaded(movieDetail);
    } on Exception catch (e) {
      print(e);
      yield MovieDetailError();
    }
  }
}
