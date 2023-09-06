// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      json['id'] as int,
      json['hotel_name'] as String,
      json['hotel_adress'] as String,
      json['horating'] as int,
      json['rating_name'] as String,
      json['departure'] as String,
      json['arrival_country'] as String,
      json['tour_date_start'] as String,
      json['tour_date_stop'] as String,
      json['number_of_nights'] as int,
      json['room'] as String,
      json['nutrition'] as String,
      json['tour_price'] as int,
      json['fuel_charge'] as int,
      json['service_charge'] as int,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'hotel_name': instance.hotelName,
      'hotel_adress': instance.hotelAdress,
      'horating': instance.horating,
      'rating_name': instance.ratingName,
      'departure': instance.departure,
      'arrival_country': instance.arrivalCountry,
      'tour_date_start': instance.tourDateStart,
      'tour_date_stop': instance.tourDateStop,
      'number_of_nights': instance.numberOfNights,
      'room': instance.room,
      'nutrition': instance.nutrition,
      'tour_price': instance.tourPrice,
      'fuel_charge': instance.fuelCharge,
      'service_charge': instance.serviceCharge,
    };
