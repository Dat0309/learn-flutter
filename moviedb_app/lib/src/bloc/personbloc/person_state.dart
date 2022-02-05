import 'package:equatable/equatable.dart';
import 'package:moviedb_app/src/model/person.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonLoading extends PersonState {}

class PersonError extends PersonState {}

class PersonLoaded extends PersonState {
  final List<Person> persons;
  const PersonLoaded(this.persons);

  @override
  // TODO: implement props
  List<Object?> get props => [persons];
}
