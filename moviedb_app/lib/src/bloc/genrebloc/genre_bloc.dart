import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_app/src/bloc/genrebloc/genre_event.dart';
import 'package:moviedb_app/src/bloc/genrebloc/genre_state.dart';
import 'package:moviedb_app/src/model/genre.dart';
import 'package:moviedb_app/src/service/api_service.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreLoading());

  @override
  Stream<GenreState> mapEventToState(GenreEvent event) async* {
    if (event is GenreEventStarted) {
      yield* _mapMovieEventStartToState();
    }
  }

  Stream<GenreState> _mapMovieEventStartToState() async* {
    final service = ApiService();
    yield GenreLoading();
    try {
      List<Genre> genres = await service.getGenreList();

      yield GenreLoaded(genres);
    } on Exception catch (e) {
      print(e);
      yield GenreError();
    }
  }
}
