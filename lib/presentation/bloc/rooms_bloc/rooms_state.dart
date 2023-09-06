part of 'rooms_bloc.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final Rooms rooms;

  RoomsLoaded(this.rooms);
}

class RoomsError extends RoomsState {
  final String error;

  RoomsError(this.error);
}
