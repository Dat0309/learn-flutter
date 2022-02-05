import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_app/src/bloc/personbloc/person_event.dart';
import 'package:moviedb_app/src/bloc/personbloc/person_state.dart';
import 'package:moviedb_app/src/model/person.dart';
import 'package:moviedb_app/src/service/api_service.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonLoading());

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is PersonEventStarted) {
      yield* _mapMovieEventStartedToState();
    }
  }

  Stream<PersonState> _mapMovieEventStartedToState() async* {
    final apiReposiroty = ApiService();
    yield PersonLoading();
    try {
      print('Personbloc called.');
      final List<Person> persons = await apiReposiroty.getTrendingPerson();
      yield PersonLoaded(persons);
    } catch (_) {
      yield PersonError();
    }
  }
}
