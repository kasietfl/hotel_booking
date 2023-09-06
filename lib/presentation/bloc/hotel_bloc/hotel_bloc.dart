import 'package:hotel_booking/data/models/hotel_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/repository/hotel_repository.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository repository;
  HotelBloc({required this.repository}) : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      emit(HotelLoading());
      try {
        final hotelData = await repository.getHotelData();
        emit(HotelLoaded(hotelData));
      } catch (e) {
        emit(HotelError(e.toString()));
      }
    });
  }
}
