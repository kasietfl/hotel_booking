part of 'hotel_bloc.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final Hotel hotel;

  HotelLoaded(this.hotel);
}

class HotelError extends HotelState {
  final String error;

  HotelError(this.error);
}
