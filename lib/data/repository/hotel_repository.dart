import 'package:hotel_booking/data/models/booking_model.dart';
import 'package:hotel_booking/data/models/hotel_model.dart';
import 'package:hotel_booking/data/models/rooms_model.dart';
import 'package:hotel_booking/network/network_service.dart';
import 'package:hotel_booking/utils/error.dart';

class HotelRepository {
  final RestClient _restClient;
  HotelRepository({required RestClient restClient}) : _restClient = restClient;

  Future<Hotel> getHotelData() async {
    try {
      final result = await _restClient.getHotel();
      return result;
    } catch (e) {
      throw ServerFailure(error: e.toString());
    }
  }

  Future<Rooms> getRoomsData() async {
    try {
      final result = await _restClient.getRooms();
      return result;
    } catch (e) {
      throw ServerFailure(error: e.toString());
    }
  }

  Future<Booking> getBookingInfo() async {
    try {
      final result = await _restClient.bookRoom();
      return result;
    } catch (e) {
      throw ServerFailure(error: e.toString());
    }
  }
}
