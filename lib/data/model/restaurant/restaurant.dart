import 'package:json_annotation/json_annotation.dart';

//new model rest

@JsonSerializable()
class Restaurant {
  static const Restaurant_TABLE = "restaurant";

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'remarks')
  final String? remarks;

  Restaurant(this.id, this.name, this.address, this.description, this.city,
      this.remarks);

//   factory Restaurant.fromJson(Map<String, dynamic> json) =>
//       _$RestaurantFromJson(json);

//   Map<String, dynamic> toJson() => _$RestaurantToJson(this);
// }

// flutter pub run build_runner build
// flutter pub run build_runner watch
//flutter pub run build_runner build --delete-conflicting-outputs

}
