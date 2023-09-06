import 'package:json_annotation/json_annotation.dart';
part 'rooms_model.g.dart';

@JsonSerializable()
class Rooms {
  @JsonKey(name: "rooms")
  final List<Room>? rooms;

  Rooms(this.rooms);

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "price_per")
  final String pricePer;
  @JsonKey(name: "peculiarities")
  final List<String> peculiarities;
  @JsonKey(name: "image_urls")
  final List<String> imageUrls;

  Room(this.id, this.name, this.price, this.pricePer, this.peculiarities,
      this.imageUrls);

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
