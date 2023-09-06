import 'package:json_annotation/json_annotation.dart';
part 'hotel_model.g.dart';

@JsonSerializable()
class Hotel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "adress")
  final String adress;
  @JsonKey(name: "minimal_price")
  final int minimalPrice;
  @JsonKey(name: "price_for_it")
  final String priceForIt;
  @JsonKey(name: "rating")
  final int rating;
  @JsonKey(name: "rating_name")
  final String ratingName;
  @JsonKey(name: "image_urls")
  final List<String> imageUrls;
  @JsonKey(name: "about_the_hotel")
  final AboutTheHotel aboutTheHotel;

  Hotel(this.id, this.name, this.adress, this.minimalPrice, this.priceForIt,
      this.rating, this.ratingName, this.imageUrls, this.aboutTheHotel);

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "peculiarities")
  final List<String> peculiarities;

  AboutTheHotel(this.description, this.peculiarities);

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}
