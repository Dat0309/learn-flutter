import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class PersonEventStarted extends PersonEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
