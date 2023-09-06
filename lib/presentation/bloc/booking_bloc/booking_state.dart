part of 'booking_bloc.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final Booking bookingInfo;

  BookingLoaded(this.bookingInfo);
}

class BookingError extends BookingState {
  final String error;

  BookingError(this.error);
}
