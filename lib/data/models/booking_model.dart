import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable()
class Booking {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "hotel_name")
  final String hotelName;
  @JsonKey(name: "hotel_adress")
  final String hotelAdress;
  @JsonKey(name: "horating")
  final int horating;
  @JsonKey(name: "rating_name")
  final String ratingName;
  @JsonKey(name: "departure")
  final String departure;
  @JsonKey(name: "arrival_country")
  final String arrivalCountry;
  @JsonKey(name: "tour_date_start")
  final String tourDateStart;
  @JsonKey(name: "tour_date_stop")
  final String tourDateStop;
  @JsonKey(name: "number_of_nights")
  final int numberOfNights;
  @JsonKey(name: "room")
  final String room;
  @JsonKey(name: "nutrition")
  final String nutrition;
  @JsonKey(name: "tour_price")
  final int tourPrice;
  @JsonKey(name: "fuel_charge")
  final int fuelCharge;
  @JsonKey(name: "service_charge")
  final int serviceCharge;

  Booking(
      this.id,
      this.hotelName,
      this.hotelAdress,
      this.horating,
      this.ratingName,
      this.departure,
      this.arrivalCountry,
      this.tourDateStart,
      this.tourDateStop,
      this.numberOfNights,
      this.room,
      this.nutrition,
      this.tourPrice,
      this.fuelCharge,
      this.serviceCharge);

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
