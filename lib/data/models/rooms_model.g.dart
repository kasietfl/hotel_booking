// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
      (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'rooms': instance.rooms,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      json['id'] as int,
      json['name'] as String,
      json['price'] as int,
      json['price_per'] as String,
      (json['peculiarities'] as List<dynamic>).map((e) => e as String).toList(),
      (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.pricePer,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
