import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/models/rooms_model.dart';
import 'package:hotel_booking/data/repository/hotel_repository.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final HotelRepository repository;
  RoomsBloc({required this.repository}) : super(RoomsInitial()) {
    on<RoomsEvent>((event, emit) async {
      emit(RoomsLoading());
      try {
        final roomsData = await repository.getRoomsData();
        emit(RoomsLoaded(roomsData));
      } catch (e) {
        emit(RoomsError(e.toString()));
      }
    });
  }
}
