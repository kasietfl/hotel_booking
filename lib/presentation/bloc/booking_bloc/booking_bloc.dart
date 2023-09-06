import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/models/booking_model.dart';
import 'package:hotel_booking/data/repository/hotel_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final HotelRepository repository;
  BookingBloc({required this.repository}) : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      emit(BookingLoading());
      try {
        final bookingInfo = await repository.getBookingInfo();
        emit(BookingLoaded(bookingInfo));
      } catch (e) {
        emit(BookingError(e.toString()));
      }
    });
  }
}
