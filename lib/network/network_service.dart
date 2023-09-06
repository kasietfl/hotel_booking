import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:hotel_booking/data/models/booking_model.dart';
import 'package:hotel_booking/data/models/hotel_model.dart';
import 'package:hotel_booking/data/models/rooms_model.dart';
import 'package:hotel_booking/domain/api_url.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: ApiUrl.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET(ApiUrl.getHotel)
  Future<Hotel> getHotel();

  @GET(ApiUrl.getRooms)
  Future<Rooms> getRooms();

  @GET(ApiUrl.bookRoom)
  Future<Booking> bookRoom();
}
